import 'package:flutter_pay_interface/flutter_pay_interface.dart';
import 'package:flutter_pay_ios/flutter_pay.dart';
import 'package:flutter_pay_android/flutter_pay.dart';
import 'package:universal_platform/universal_platform.dart';
export 'package:flutter_pay_android/android_widgets.dart';

class FlutterPayPure {
  static late FlutterPayInterface _interface;
  static Future<void> init(
      {required VerifyReceipt verifyReceipt,
      required LocalizationText localizationText,
      required void Function() onError}) async {
    if (UniversalPlatform.isIOS) {
      _interface = FlutterPayIos();
    } else if (UniversalPlatform.isAndroid) {
      _interface = FlutterPayAndroid();
    }
    _interface.init(
        verifyReceipt: verifyReceipt,
        localizationText: localizationText,
        onError: onError);
  }

  // 支付
  static Future<void> pay(dynamic rsp, int time) async {
    _interface.pay(rsp, time);
  }

  static Future<void> restorePurchases() async {
    await _interface.restorePurchases();
  }

  static Future<void> logout() async {
    await _interface.logout();
  }
}
