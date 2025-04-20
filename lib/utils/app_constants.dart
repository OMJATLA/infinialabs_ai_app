import 'package:flutter/widgets.dart';

class AppConstants {
  const AppConstants._();

  //keys
  static const accessTokenKey = 'access_token';

  //strings
  static const String unableToConnectToInternet =
      "Unable to connect to the internet. Please check your network connection.";
  static const String somethingWentWrng = "Something went wrong";
  static const String authorization = "Authorization";
  static const String mobileNumberRequired = 'Mobile number is required';
  static const String mobileNumberMaxLength = 'Mobile number must be 10 digits';
  static const String logIn = 'Log In';
  static const String signUp = 'Sign Up';
  static const String email = 'Email';
  static const String name = 'Name';
  static const String mobile = 'Mobile';
  static const String password = 'Password';
  static const String continuee = 'Continue';
  static const String donNotHaveAcc = 'Don\'t have a account';
  static const String alreadyHaveAcc = 'Already have a account';
  static const String unableToLogInUser = 'Unable to Log In user';
  static const String unableToSignUpUser = 'Unable to Sign Up user';
  static const String invalidMobileNum = 'Invalid Mobile Number';
  static const String logInSuccess = 'Log In Success';
  static const String explore = 'EXPLORE';
  static const String healthcareSupportMessage =
      "We're here to help you.\nGet expert answers to your healthcare questions 24/7.";

  //sizedbox
  static const sizedBoxHeight12 = SizedBox(height: 12);
  static const sizedBoxHeight16 = SizedBox(height: 16);
  static const sizedBoxHeight20 = SizedBox(height: 20);

  static const sizedBoxWidth12 = SizedBox(width: 12);
}
