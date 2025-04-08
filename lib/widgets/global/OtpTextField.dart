import 'package:fluttbase/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpTextField extends StatelessWidget {
  // final Function()? onChanged;
  const OtpTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 70,
          decoration: BoxDecoration(
            color: Constants.greyShade.withOpacity(0.2),
          ),
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            keyboardType: TextInputType.number,
            inputFormatters: [LengthLimitingTextInputFormatter(1)],
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Constants.greyColor.withOpacity(0.7),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Constants.primaryColor.withOpacity(1),
                  ),
                )),
          ),
        ),
        Container(
          width: 70,
          decoration: BoxDecoration(
            color: Constants.greyShade.withOpacity(0.2),
          ),
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            keyboardType: TextInputType.number,
            inputFormatters: [LengthLimitingTextInputFormatter(1)],
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Constants.greyColor.withOpacity(0.7),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Constants.primaryColor.withOpacity(1),
                  ),
                )),
          ),
        ),
        Container(
          width: 70,
          decoration: BoxDecoration(
            color: Constants.greyShade.withOpacity(0.2),
          ),
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).nextFocus();
              }
            },
            keyboardType: TextInputType.number,
            inputFormatters: [LengthLimitingTextInputFormatter(1)],
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Constants.greyColor.withOpacity(0.7),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Constants.primaryColor.withOpacity(1),
                  ),
                )),
          ),
        ),
        Container(
          width: 70,
          decoration: BoxDecoration(
            color: Constants.greyShade.withOpacity(0.2),
          ),
          child: TextFormField(
            onChanged: (value) {
              if (value.length == 1) {
                FocusScope.of(context).unfocus();
              }
            },
            keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(1),
            ],
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Constants.greyColor.withOpacity(0.7),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    color: Constants.primaryColor.withOpacity(1),
                  ),
                )),
          ),
        ),
      ],
    ));
  }
}
