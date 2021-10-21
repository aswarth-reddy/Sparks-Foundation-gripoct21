import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FacebookSignInController with ChangeNotifier {
  Map? userData;

  get googleAccount => null;

  login() async {
    var result = await FacebookAuth.i.login(
      permissions: ["public_profile", "email"],
    );

    if (result == LoginStatus.success) {
      final requestData = await FacebookAuth.i.getUserData(
        fields: "email, name, picture",
      );

      userData = requestData;
      notifyListeners();
    }

    // ignore: unused_element
    logOut() async {
      await FacebookAuth.i.logOut();
      userData = null;
      notifyListeners();
    }
  }

  void logOut() {}
}
