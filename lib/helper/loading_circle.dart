import 'package:fluttbase/utils/constants.dart';
import 'package:flutter/material.dart';

void showLoadingCircle(BuildContext context) {
  showDialog(
      context: context,
      builder: (context) => Center(
            child: CircularProgressIndicator(
                color: Constants.primaryColor.withOpacity(0.5)),
          ));
}

void hideLoadingCircle(BuildContext context) {
  Navigator.pop(context);
}
