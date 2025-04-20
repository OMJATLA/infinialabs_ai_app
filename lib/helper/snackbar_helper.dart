import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:infinialabs_ai/theme/app_colors.dart';
import 'package:infinialabs_ai/utils/app_constants.dart';

typedef SnackbarClosed = void Function();

class SnackbarHelper {
  const SnackbarHelper._();

  static void showNoInternetSnackBar() {
    if (!Get.isSnackbarOpen) {
      GetWarningSnackBar(
        snackIcon: const Icon(
          Icons.wifi_off_sharp,
          color: AppColors.colorWhite,
        ),
        msg: AppConstants.unableToConnectToInternet,
        seconds: 10,
      ).show();
    }
  }
}

class GetWarningSnackBar extends GetSnackBar {
  final String msg;
  final Icon? snackIcon;
  final int seconds;
  final SnackbarClosed? snackbarClosed;
  GetWarningSnackBar({
    super.key,
    required this.msg,
    this.snackIcon,
    this.seconds = 3,
    this.snackbarClosed,
  }) : super(
         backgroundColor: const Color(0xff42526E),
         margin: const EdgeInsets.all(8),
         duration: Duration(seconds: seconds),
         borderRadius: 8,
         icon:
             snackIcon ??
             const Icon(Icons.warning_amber_rounded, color: Colors.white),
         messageText: Text(msg, style: const TextStyle(color: Colors.white)),
         snackbarStatus: (status) {
           if (status == SnackbarStatus.CLOSED && snackbarClosed != null) {
             snackbarClosed();
           }
         },
       );
  @override
  String get message => msg;
}
