import 'package:fluttbase/utils/constants.dart';
import 'package:fluttbase/widgets/global/TextField.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/auth/auth_service.dart';
import '../services/model/user_model.dart';
import '../services/provider/database_provider.dart';

class ProfileEdit extends StatefulWidget {
  final String uid;
  const ProfileEdit({super.key, required this.uid});

  @override
  State<ProfileEdit> createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {
  late final databaseProvider =
      Provider.of<DatabaseProvider>(context, listen: false);

  final _auth = AuthService();

  UserProfile? user;

  String currentUserId = AuthService().getCurrentUser()!.uid;

  Future<void> loadUser() async {
    user = await databaseProvider.getUser(currentUserId);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadUser();
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    nameController.text = user?.name ?? '';
    final emailController = TextEditingController();
    // nameController.text = user?.name ?? '';
    return Scaffold(
      backgroundColor: Constants.backgroundColor.withOpacity(1),
      appBar: AppBar(
        backgroundColor: Constants.backgroundColor.withOpacity(1),
        actions: [
          IconButton(
            tooltip: 'Edit',
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  Constants.primaryColor.withOpacity(0.2)),
            ),
            onPressed: () {
              // save user
              databaseProvider
                  .updateUserName(nameController.text)
                  .then((value) => Navigator.pop(context));
            },
            icon: Icon(Icons.edit),
          ),
          Padding(padding: EdgeInsets.only(left: 12.0)),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Stack(children: [
                CircleAvatar(
                  radius: 60,
                  backgroundColor: Constants.secondaryColor.withOpacity(0.5),
                  child: Text(
                    user?.name[0] ?? '',
                    style: TextStyle(
                        fontSize: 40,
                        color: Constants.primaryColor.withOpacity(1)),
                  ),
                ),
                Positioned(
                    bottom: -2,
                    right: 0,
                    child: GestureDetector(
                        child: Container(
                      decoration: const ShapeDecoration(
                        color: Colors.white,
                        shape: CircleBorder(),
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.camera_alt_outlined),
                        color: Colors.black,
                        onPressed: () {},
                      ),
                    ))),
              ]),
              SizedBox(
                height: 16,
              ),
              MyTextField(
                  hintText: user?.name ?? 'Loading...',
                  obscureText: false,
                  controller: nameController,
                  labelText: "Name"),
              MyTextField(
                  hintText: user?.email ?? 'Loading...',
                  obscureText: false,
                  controller: emailController,
                  labelText: "Name"),
            ],
          ),
        ),
      ),
    );
  }
}
