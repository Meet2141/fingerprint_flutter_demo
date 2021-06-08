import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';

import 'home.dart';

//1.object of local auth
final LocalAuthentication localAuthentication = LocalAuthentication();

//2.variable for checking whether your device has fingerprint or not
bool _hasFingerprintSupport = false;

//3.we will set state whether user authorizes or not
String _authorizedOrNot = 'Not Authorized';

// 4. list of available biometric authentication supports of your device will be saved in this array
List<BiometricType> _availableBiometricType = <BiometricType>[];

//5.this method check whether your device support biometric or not
Future<void> getBioMetricSupport() async {
  bool hasFingerprintSupport = false;
  try {
    hasFingerprintSupport = await localAuthentication.canCheckBiometrics;
  } catch (e) {
    print('bio Support error : $e' );
  }
  _hasFingerprintSupport = hasFingerprintSupport;
}

//6. this method fetches all the available biometric supports of the device
Future<void> getAvailableSupport() async {
  List<BiometricType> availableBioMetricType = <BiometricType>[];
  try {
    availableBioMetricType = await localAuthentication.getAvailableBiometrics();
  } catch (e) {
    print('available support error : $e');
  }
  _availableBiometricType = availableBioMetricType;
}

// 7. this method opens a dialog for fingerprint authentication.
//    we do not need to create a dialog nut it popup from device natively

Future authenticMe(context) async {
  bool authenticated = false;
  try {
    authenticated =
    await localAuthentication.authenticate(localizedReason: 'Authenticate for SignIn', useErrorDialogs: true, stickyAuth: true);
  } catch (e) {
    print('authenticate error : $e');
  }
  _authorizedOrNot = authenticated ? 'Authorized' : 'Not Authorized';
  authenticated ? print('Authorized') : print('Not Authorized');
  if (authenticated) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(signInFrom: 'Successfully Sign In Using Fingerprint',)));
  }
}
