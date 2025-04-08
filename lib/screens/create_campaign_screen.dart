// ignore_for_file: prefer_const_constructors, sort_child_properties_last, unused_import, duplicate_import
import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:fluttbase/services/provider/database_provider.dart';
import 'package:fluttbase/utils/constants.dart';
import 'package:fluttbase/utils/constants.dart';
import 'package:fluttbase/widgets/global/DescriptionField.dart';
import 'package:fluttbase/widgets/global/FilePicker.dart';
import 'package:fluttbase/widgets/global/TextField.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:firebase_storage/firebase_storage.dart';

class CreateCampaignScreen extends StatefulWidget {
  const CreateCampaignScreen({super.key});

  @override
  State<CreateCampaignScreen> createState() => _CreateCampaignScreenState();
}

class _CreateCampaignScreenState extends State<CreateCampaignScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  int _activeIndex = 0;
  String imageUrl = '';
  var newUrl = '';

  // databaseProvider instance
  late final databaseProvider =
      Provider.of<DatabaseProvider>(context, listen: false);

  Future<void> postCampaign(
      String description, date, amount, title, imageUrl) async {
    await databaseProvider.postCampaign(
        description, date, amount, title, imageUrl);
  }

  // function to get image from gallery
  File? _image;
  final picker = ImagePicker();

  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  // function to upload image to firebase storage
  FirebaseStorage storage = FirebaseStorage.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Create campaign",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Theme(
            data: Theme.of(context).copyWith(
                colorScheme: ColorScheme.light(
                    primary: Constants.primaryColor.withOpacity(1))),
            child: Stepper(
              elevation: 0,
              type: StepperType.horizontal,
              currentStep: _activeIndex,
              steps: stepList(),
              onStepContinue: () {
                if (_activeIndex < (stepList().length - 1)) {
                  _activeIndex += 1;
                }
                setState(() {});
              },
              onStepCancel: () {
                if (_activeIndex != 0) {
                  _activeIndex -= 1;
                }
                setState(() {});
              },
              controlsBuilder: (BuildContext context, ControlsDetails details) {
                // _activeIndex = stepList().length - 1;
                final isLastStep = _activeIndex == stepList().length - 1;
                return Container(
                    margin: EdgeInsets.only(top: 48),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          if (_activeIndex != 0)
                            FilledButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Constants.greyShade.withOpacity(0.8)),
                                    padding: MaterialStatePropertyAll(
                                        EdgeInsets.symmetric(horizontal: 0))),
                                child: Icon(
                                  Icons.arrow_back,
                                  color: Constants.blackColor.withOpacity(1),
                                ),
                                onPressed: details.onStepCancel),
                          const SizedBox(
                            width: 12,
                          ),
                          FilledButton(
                              style: ButtonStyle(
                                  backgroundColor: MaterialStatePropertyAll(
                                      Constants.primaryColor.withOpacity(1)),
                                  padding: MaterialStatePropertyAll(
                                      EdgeInsets.symmetric(horizontal: 24.0))),
                              child: Text(isLastStep ? 'Create ' : 'Next'),
                              onPressed: isLastStep
                                  ? () async {
                                      if (_image != null) {
                                        FirebaseStorage storage =
                                            FirebaseStorage.instance;
                                        Reference ref = storage.ref("image1" +
                                            DateTime.now().toString());
                                        UploadTask uploadTask =
                                            ref.putFile(_image!);
                                        TaskSnapshot taskSnapshot =
                                            await uploadTask;
                                        if (taskSnapshot.state ==
                                            TaskState.success) {
                                          newUrl = await ref.getDownloadURL();
                                          print(
                                              "Upload successful. URL: $newUrl");
                                        } else {
                                          print("Upload failed.");
                                        }
                                      } else {
                                        print('No image selected for upload.');
                                      }
                                      await postCampaign(
                                          descriptionController.text,
                                          dateController.text,
                                          amountController.text,
                                          titleController.text,
                                          newUrl);
                                      Navigator.pop(context);
                                    }
                                  : details.onStepContinue),
                        ]));
              },
            ),
          ),
        ));
  }

  List<Step> stepList() => [
        Step(
          state: _activeIndex <= 0 ? StepState.indexed : StepState.complete,
          isActive: _activeIndex >= 0,
          title: const SizedBox.shrink(),
          content: Column(children: [
            MyTextField(
              hintText: "Title of Campaign",
              obscureText: false,
              controller: titleController,
              labelText: "Title of campaign",
            ),
            SizedBox(
              height: 10,
            ),
            MyTextField(
              hintText: "Enter Amount in INR ",
              obscureText: false,
              controller: amountController,
              labelText: "Amount to be raised",
            ),
            SizedBox(
              height: 10,
            ),
            MyDescriptionField(
              readOnly: false,
              hintText: "DD/MM/YYYY",
              controller: dateController,
              textInputType: TextInputType.datetime,
              labelText: "Deadline Date",
              formIcon: IconButton(
                  onPressed: () {
                    _selectDate();
                  },
                  icon: Icon(
                    Icons.calendar_month,
                    color: Constants.greyColor.withOpacity(1),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
          ]),
        ),
        Step(
            state: _activeIndex <= 1 ? StepState.indexed : StepState.complete,
            isActive: _activeIndex >= 1,
            title: SizedBox.shrink(),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MyDescriptionField(
                  readOnly: false,
                  maxLines: 8,
                  textInputType: TextInputType.multiline,
                  hintText: "Write about your campaign in brief",
                  controller: descriptionController,
                  labelText: "Description of Campaign",
                ),
                SizedBox(
                  height: 40,
                ),
                Text("Upload Image",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 12,
                        color: Color(0x5d5d5d).withOpacity(1),
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 4,
                ),
                Text(
                    "Upload relevant images for Campaign, for e.g photo of beneficiary for whom fundraiser is created",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0x5d5d5d).withOpacity(1),
                    )),
                SizedBox(
                  height: 4,
                ),
                FilePickerWidget(
                  text: "Select Image",
                  onTap: () async {
                    await getImageFromGallery();
                  },
                ),
                Container(
                  child: Center(
                    child: _image != null
                        ? Image.file(_image!)
                        : SizedBox.shrink(),
                    // child: Image(
                    //     image: NetworkImage(
                    //         'https://picsum.photos/250?image=${Random().nextInt(100)}')),
                  ),
                  width: 50,
                  height: 50,
                )
              ],
            )),
        Step(
            state: _activeIndex <= 2 ? StepState.indexed : StepState.complete,
            isActive: _activeIndex >= 2,
            title: SizedBox.shrink(),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Upload Documents",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontSize: 14,
                        color: Color(0x010101).withOpacity(1),
                        fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 4,
                ),
                Text(
                    "Upload relevant images for Campaign, for e.g photo of beneficiary for whom fundraiser is created",
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                      color: Color(0x5d5d5d).withOpacity(1),
                    )),
                SizedBox(
                  height: 8,
                ),
                FilePickerWidget(
                    text: "Select Image",
                    onTap: () {
                      getImageFromGallery();
                    }),
              ],
            )),
      ];

  Future<void> _selectDate() async {
    DateTime? picked = await showDatePicker(
      // barrierColor: Constants.primaryColor.withOpacity(1),
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2040),
    );

    if (picked != null) {
      final formatDate = DateFormat("dd/MM/yyyy").format(picked);
      setState(() {
        dateController.text = formatDate.toString();
      });
    }
  }
}
