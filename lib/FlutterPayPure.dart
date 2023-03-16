import 'package:flutter_pay_interface/flutter_pay_interface.dart';
import 'package:flutter_pay_ios/flutter_pay.dart';
import 'package:flutter_pay_android/flutter_pay.dart';
import 'package:universal_platform/universal_platform.dart';

class FlutterPayPure {
  static late FlutterPayInterface _interface;
  static Future<void> init(
      Future<bool> Function(String?, String, String) verifyReceipt, void Function() onError) async {
    if (UniversalPlatform.isIOS) {
      _interface = FlutterPayIos();
      _interface.init(verifyReceipt, onError);
    } else if (UniversalPlatform.isAndroid) {
      _interface = FlutterPayAndroid();
    }
  }

    // 支付
  static Future<void> pay(dynamic rsp, int time) async{
    _interface.pay(rsp, time);
  }

  static Future<void> restorePurchases() async {
    await _interface.restorePurchases();
  }

  static Future<void> logout() async {
    await _interface.logout();
  }
}
