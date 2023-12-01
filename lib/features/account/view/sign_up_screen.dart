import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskills_first/features/widgets/exports.dart';
import 'package:taskills_first/help_classes/exports.dart';
import 'package:taskills_first/localisation/app_localizations.dart';
import 'package:taskills_first/router/router.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String name = '';
  String email = '';
  String password = '';
  String confirmPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor().greyBackground,
      body: Container(
        height: MyVariables.screenHeight,
        child: Stack(
          children: [
            Positioned(
              child: Image.asset(
                MyVariables.pathToBackGroundBlue,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: MyVariables.screenHeight * 0.15,
              left: MyVariables.screenWidth * 0.1,
              child: Column(
                children: [
                  Container(
                    width: MyVariables.screenWidth * 0.8,
                    padding: EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: MyVariables.screenHeight * 0.035,
                        ),
                        Text(
                          AppLocalizations.of(context).strAcquainted,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: MyVariables.screenHeight * 0.03,
                        ),
                        buildCustomTextField(
                          label: AppLocalizations.of(context).strName,
                          onChanged: (value) {
                            name = value;
                          },
                        ),
                        SizedBox(
                          height: MyVariables.screenHeight * 0.005,
                        ),
                        buildCustomTextField(
                          label: AppLocalizations.of(context).strEmail,
                          isEmail: true,
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: MyVariables.screenHeight * 0.005,
                        ),
                        buildCustomTextField(
                          label: AppLocalizations.of(context).strPassword,
                          isPassword: true,
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                        SizedBox(
                          height: MyVariables.screenHeight * 0.005,
                        ),
                        buildCustomTextField(
                          label:
                              AppLocalizations.of(context).strConfirmPassword,
                          isPassword: true,
                          onChanged: (value) {
                            confirmPassword = value;
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MyVariables.screenHeight * 0.05,
                  ),
                  Container(
                    width: MyVariables.screenWidth * 0.6,
                    child: ElevatedButton(
                      onPressed: () {
                        if (password == confirmPassword &&
                            password.length>=8 && _isEmailValid(email) && name.isNotEmpty) {
                          AutoRouter.of(context).replace(AccountRoute());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  AppLocalizations.of(context).strValidateSignUp),
                              duration: Duration(seconds: 5),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        primary: MyColor().mainBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Text(
                              AppLocalizations.of(context).strSignUp,
                              style: TextStyle(
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).replace(SignInRoute());
                    },
                    child: Text(
                      AppLocalizations.of(context).strAlreadyHaveAccount,
                      style: TextStyle(
                        fontSize: 14.0,
                        color: MyColor().mainBlue,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      context.read<LocalizationProvider>().toggleLocale();
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.grey, // Text color
                      padding: const EdgeInsets.all(16.0),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.language, color: Colors.grey),
                        SizedBox(width: 8.0),
                        Text(
                          AppLocalizations.of(context).strChangeLanguage,
                          style: TextStyle(fontSize: 16.0),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              top: MyVariables.screenHeight * 0.10,
              left: MyVariables.screenWidth * 0.5 -
                  MyVariables.screenHeight * 0.05,
              child: Container(
                height: MyVariables.screenHeight * 0.1,
                width: MyVariables.screenHeight * 0.1,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: MyColor().mainBlue,
                  border: Border.all(color: Colors.white, width: 2.0),
                ),
                child: Center(
                  child: Icon(
                    Icons.account_circle_rounded,
                    size: MyVariables.screenHeight * 0.05,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCustomTextField({
    bool isPassword = false,
    bool isEmail = false,
    String label = '',
    required Function(String) onChanged,
  }) {
    return Container(
      height: MyVariables.screenHeight * 0.09,
      width: MyVariables.screenWidth * 0.9,
      child: CustomTextField(
        labelText: label,
        enabledColor: Colors.white,
        focusColor: MyColor().greyForTextField,
        fillColor: Color.fromARGB(255, 240, 240, 240),
        isPassword: isPassword,
        isEmail: isEmail,
        borderRadius: 12,
        onChanged: onChanged,
      ),
    );
  }
  bool _isEmailValid(String email) {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(email);
  }
}
