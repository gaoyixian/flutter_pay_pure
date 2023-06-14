import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_pay_interface/flutter_pay_interface.dart';

class FlutterPayPure {
  static Future<void> init(
      {required VerifyReceipt verifyReceipt,
      required LocalizationText localizationText,
      required void Function() onError,
      required ShowBottomSheet showBottomSheet,
      required withDrawalMgr,
      String? payConfig, //pay插件配置
      required isSandbox}) async {
    FlutterPayPlatform.instance.init(
        verifyReceipt: verifyReceipt,
        localizationText: localizationText,
        onError: onError,
        showBottomSheet: showBottomSheet,
        withDrawalMgr: withDrawalMgr,
        payConfig: payConfig,
    );
  }

  static int getTyp(bool isAli) {
    return FlutterPayPlatform.instance.getTyp(isAli);
  }

  static String getPname(bool isAli) {
    return FlutterPayPlatform.instance.getPname(isAli);
  }

  static String getPnameByType(int type) {
    return FlutterPayPlatform.instance.getPnameByType(type);
  }

  // 支付
  static Future<dynamic> pay(dynamic rsp, int time) async {
    return FlutterPayPlatform.instance.pay(rsp, time);
  }

  // 获取支付按钮
  static Widget getPlayButton(BuildContext context, double rate,
      int chooseIndex, void Function(int index, int typ) toPay) {
    return FlutterPayPlatform.instance
        .getPlayButton(context, rate, chooseIndex, toPay);
  }

  static void paymethodBottom(BuildContext context,
      {required int id,
      required int gold,
      required double price,
      String? currencyCode,
      required void Function(int p1, int p2) toPay}) {
    FlutterPayPlatform.instance
        .paymethodBottom(context, id: id, gold: gold, price: price, currencyCode: currencyCode, toPay: toPay);
  }

  static void vipPayBottom(BuildContext context,
      {required int index, required void Function(bool isShow) onchange}) {
    FlutterPayPlatform.instance
        .vipPayBottom(context, index: index, onchange: onchange);
  }

  static Widget getLxbysm() {
    return FlutterPayPlatform.instance.getLxbysm();
  }

  static Future<void> restorePurchases() async {
    await FlutterPayPlatform.instance.restorePurchases();
  }

  static Future<void> logout() async {
    await FlutterPayPlatform.instance.logout();
  }

  static Future<void> showBottomSheet(
      {required BuildContext context, required Widget container}) async {}
}
