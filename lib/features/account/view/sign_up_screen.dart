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
              top: MyVariables.screenHeight * 0.20,
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
                          AppLocalizations.of(context).hello,
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: MyVariables.screenHeight * 0.03,
                        ),
                        buildCustomTextField(AppLocalizations.of(context).strName, false),
                        SizedBox(
                          height: MyVariables.screenHeight * 0.005,
                        ),
                        buildCustomTextField(AppLocalizations.of(context).strEmail, false),
                        SizedBox(
                          height: MyVariables.screenHeight * 0.005,
                        ),
                        buildCustomTextField(AppLocalizations.of(context).strPassword, true),
                        SizedBox(
                          height: MyVariables.screenHeight * 0.005,
                        ),
                        buildCustomTextField(
                            AppLocalizations.of(context).strConfirmPassword, true),
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
                    height: MyVariables.screenHeight * 0.05,
                  ),
                  Container(
                    width: MyVariables.screenWidth * 0.6,
                    child: ElevatedButton(
                      onPressed: () {
                        // Действие при нажатии кнопки
                      },
                      style: ElevatedButton.styleFrom(
                        primary: MyColor().mainBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          'Зарегестрироваться',
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AutoRouter.of(context).replace(SignInRoute());
                    },
                    child: Text(
                      'Уже есть аккакунт? Войдите!',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: MyColor().mainBlue,
                      ),
                    ),
                  ),
                  ElevatedButton(
      onPressed: () {
        // Меняем язык при нажатии кнопки
        context.read<LocalizationProvider>().toggleLocale();

      },
      child: Text(
        'Switch Language', // Текст кнопки можете изменить под свои нужды
      ),),
                ],
              ),
            ),
            Positioned(
              top: MyVariables.screenHeight * 0.15,
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

  Widget buildCustomTextField(String labelText, bool isPassword) {
    return Container(
      height: MyVariables.screenHeight * 0.09,
      width: MyVariables.screenWidth * 0.9,
      child: CustomTextField(
        labelText: labelText,
        enabledColor: Colors.white,
        focusColor: MyColor().greyForTextField,
        fillColor: Color.fromARGB(255, 240, 240, 240),
        isPassword: isPassword,
        borderRadius: 12,
      ),
    );
  }
}
