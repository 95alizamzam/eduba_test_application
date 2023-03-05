import 'package:flutter/material.dart';

class NavigationServices {
  void goTo({
    required BuildContext context,
    required Widget targetScreen,
    bool replace = false,
    bool clean = false,
  }) {
    if (replace) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => targetScreen));
    } else if (clean) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => targetScreen),
        (route) => false,
      );
    } else {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => targetScreen));
    }
  }

  void goBack({required BuildContext context}) {
    Navigator.of(context).canPop() ? Navigator.of(context).pop() : null;
  }
}
