import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:taskills_first/features/widgets/exports.dart';
import 'package:taskills_first/help_classes/exports.dart';
import 'package:taskills_first/localisation/app_localizations.dart';
import 'package:taskills_first/router/router.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  
  String password = '';
  String email = '';
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
              top: MyVariables.screenHeight * 0.25,
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
                          height: MyVariables.screenHeight * 0.05,
                        ),
                        Text(
                          AppLocalizations.of(context).strLoginToContinue,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: MyVariables.screenHeight * 0.05,
                        ),
                        buildCustomTextField(
                          label: AppLocalizations.of(context).strEmail,
                          isEmail: true,
                          onChanged: (value) {
                            email = value;
                          },
                        ),
                        SizedBox(
                          height: MyVariables.screenHeight * 0.02,
                        ),
                        buildCustomTextField(
                          label: AppLocalizations.of(context).strPassword,
                          isPassword: true,
                          onChanged: (value) {
                            password = value;
                          },
                        ),
                        /* TextButton(
                          onPressed: () {},
                          child: Text(
                            'Забыли пароль?',
                            style: TextStyle(
                              fontSize: 14.0,
                              color: MyColor().mainBlue,
                            ),
                          ),
                        ), */
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MyVariables.screenHeight * 0.07,
                  ),
                  Container(
                    width: MyVariables.screenWidth * 0.6,
                    child: ElevatedButton(
                      onPressed: () {
                        if (password.length>=8 && _isEmailValid(email)) {
                          AutoRouter.of(context).replace(AccountRoute());
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  AppLocalizations.of(context).strValidateSignIn),
                              duration: Duration(seconds: 3),
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
                        child: Text(
                          AppLocalizations.of(context).strSignIn,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).replace(SignUpRoute());
                    },
                    child: Text(
                      AppLocalizations.of(context).strNoAccountSignUp,
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
                        Icon(Icons.language,
                            color: Colors.grey), // Icon on the left
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
              top: MyVariables.screenHeight * 0.2,
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
                    Icons.login_rounded,
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
