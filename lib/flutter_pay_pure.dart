import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pay_interface/flutter_pay_interface.dart';
import 'package:flutter_pay_ios/flutter_pay.dart';
import 'package:flutter_pay_android/flutter_pay.dart';
import 'package:universal_platform/universal_platform.dart';

class FlutterPayPure {
  static late FlutterPayInterface _interface;
  static FlutterPayInterface get interface => _interface;
  static Future<void> init(
      {required VerifyReceipt verifyReceipt,
      required LocalizationText localizationText,
      required void Function() onError,
      required ShowBottomSheet showBottomSheet,
      required withDrawalMgr}) async {
    if (UniversalPlatform.isIOS) {
      _interface = FlutterPayIos();
    } else if (UniversalPlatform.isAndroid) {
      _interface = FlutterPayAndroid(withDrawalMgr);
    }
    _interface.init(
        verifyReceipt: verifyReceipt,
        localizationText: localizationText,
        showBottomSheet: showBottomSheet,
        onError: onError);
  }

  static int getTyp(bool isAli) {
    return _interface.getTyp(isAli);
  }
   static String getPname(bool isAli) {
    return _interface.getPname(isAli);
  }
  // 支付
  static Future<void> pay(dynamic rsp, int time) async {
    _interface.pay(rsp, time);
  }

  // 获取支付按钮
  static Widget getPlayButton(BuildContext context, double rate, int chooseIndex, void Function (int index, int typ) toPay){
    return _interface.getPlayButton(context, rate, chooseIndex, toPay);
  }

  static void paymethodBottom(BuildContext context,
      {required int id,
      required int gold,
      required int rmb,
      required void Function(int p1, int p2) toPay}) {
    _interface.paymethodBottom(context,
        id: id, gold: gold, rmb: rmb, toPay: toPay);
  }

  static void vipPayBottom(BuildContext context, {required int index, required void Function(bool isShow) onchange}) {
    _interface.vipPayBottom(context, index: index, onchange: onchange);
  }

  static Future<void> restorePurchases() async {
    await _interface.restorePurchases();
  }

  static Future<void> logout() async {
    await _interface.logout();
  }

  static Future<void> showBottomSheet(
      {required BuildContext context,
      required Widget container}) async {
  }
}
