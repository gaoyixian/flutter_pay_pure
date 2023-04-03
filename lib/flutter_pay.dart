import 'package:flutter/material.dart';
import 'package:flutter_pay_interface/flutter_pay_interface.dart';
import 'dart:io';

class FlutterPayPure {
  static Future<void> init(
      {required VerifyReceipt verifyReceipt,
      required LocalizationText localizationText,
      required void Function() onError,
      required ShowBottomSheet showBottomSheet,
      required withDrawalMgr,
      required isSandbox}) async {
    _isSandbox = isSandbox;
    FlutterPayPlatform.instance.init(
        verifyReceipt: verifyReceipt,
        localizationText: localizationText,
        onError: onError,
        showBottomSheet: showBottomSheet,
        withDrawalMgr: withDrawalMgr);
  }

  static int getTyp(bool isAli) {
    return FlutterPayPlatform.instance.getTyp(isAli);
  }

  static String getPname(bool isAli) {
    return FlutterPayPlatform.instance.getPname(isAli);
  }

  //是否包含安卓
  static bool _isSandbox = true;
  static bool isAndroid(BuildContext context) {
    if (Platform.isIOS && !_isSandbox) {
      showDialog(
          context: context,
          builder: (context) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                padding: const EdgeInsets.all(16),
                color: Colors.black,
                child: const Text(
                  '支付插件选择错误。请重新打包！！！',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    decoration: TextDecoration.none,
                  ),
                ),
              ),
            );
          });
      return false;
    }
    return true;
  }

  // 支付
  static Future<void> pay(dynamic rsp, int time) async {
    FlutterPayPlatform.instance.pay(rsp, time);
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
      required int rmb,
      required void Function(int p1, int p2) toPay}) {
    if (isAndroid(context)) {
      FlutterPayPlatform.instance
          .paymethodBottom(context, id: id, gold: gold, rmb: rmb, toPay: toPay);
    }
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
