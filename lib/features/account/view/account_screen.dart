import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taskills_first/help_classes/variable.dart';

@RoutePage()
class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Container(
        child: Icon(
          Icons.settings,
          color: Colors.white,
          size: MyVariables.screenWidth * 0.5,
        ),
        alignment: Alignment.center,
      ),
    );
  }
}
