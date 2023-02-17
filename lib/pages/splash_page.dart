import 'package:flutter/material.dart';
import 'package:ftt151attendant/helpers/colors.dart';
import '../helpers/tt151_attendant_icons_icons.dart';

class SplashPage extends StatefulWidget {
  static const String route = '/splash';
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TT151AttendantColors.mainOrgane,
      body: Center(
          child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 60,
            height: 60,
            child: Stack(
              children: const [
                Center(
                    child: Icon(TT151AttendantIcons.robot,
                        color: Colors.white, size: 30)),
                Center(
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: 20),
          const Text("Loading Tough Techs Attendant App...")
        ],
      )),
    );
  }
}
