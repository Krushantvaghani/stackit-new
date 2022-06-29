import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/apps/travel/routes/route_screen_list.dart';
import 'package:stackit/widgets/custom_button.dart';
import 'package:stackit/widgets/custom_textformfield.dart';

import '../../theme/app_theme.dart';

class TravelRegisterScreen extends StatefulWidget {
  const TravelRegisterScreen({Key? key}) : super(key: key);

  @override
  _TravelRegisterScreenState createState() => _TravelRegisterScreenState();
}

class _TravelRegisterScreenState extends State<TravelRegisterScreen> {
  late ThemeData theme;
  bool agreedToTAC = true;
  bool get isRememberLogin => agreedToTAC;

  // Ubdate method
  setAgreedToTOS(bool newValue) {
    setState(() {
      agreedToTAC = newValue;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: SafeArea(
            child: Container(
              alignment: Alignment.center,
              width: screenSize.width /
                  (2 / (screenSize.height / screenSize.width)),
              padding: EdgeInsets.symmetric(horizontal: 25),
              constraints: const BoxConstraints(maxWidth: 700),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Stackit',
                    style: AppCss.getTextStyle(
                      theme.textTheme.headline5!,
                      fontWeight: 700,
                      color: theme.primaryColor,
                      fontSize: 26,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    'Create an account',
                    style: AppCss.getTextStyle(
                      theme.textTheme.headline5!,
                      color: theme.primaryColor,
                      fontWeight: 700,
                      height: 1.15,
                    ),
                  ),
                  SizedBox(height: 30),
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: theme.primaryColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: CustomTextFormField(
                            hintText: "User name and email",
                            prefixIcon: Icon(
                              MdiIcons.email,
                              color: theme.primaryColor,
                              size: 20,
                            ),
                            hintStyle: AppCss.getTextStyle(
                              theme.textTheme.bodyText1!,
                            ),
                            // style: AppCss.getTextStyle(
                            //   theme.textTheme.bodyText1!,
                            //   fontWeight: 600,
                            //   letterSpacing: 0.2,
                            // ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: theme.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomTextFormField(
                            // style: AppCss.getTextStyle(
                            //   theme.textTheme.bodyText1!,
                            //   fontWeight: 600,
                            //   letterSpacing: 0.2,
                            // ),
                            hintStyle: AppCss.getTextStyle(
                              theme.textTheme.bodyText1!,
                            ),
                            hintText: "Password",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: Icon(
                              MdiIcons.lock,
                              color: theme.primaryColor,
                              size: 20,
                            ),
                            suffixIcon: Icon(
                              MdiIcons.eyeOff,
                              color: theme.primaryColor,
                              size: 20,
                            ),
                            isDense: true,
                            // autofocus: false,
                            // textInputAction: TextInputAction.search,
                            // textCapitalization: TextCapitalization.sentences,
                            // obscureText: true,
                          ),
                        ),
                        SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: theme.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomTextFormField(
                            // style: AppCss.getTextStyle(
                            //   theme.textTheme.bodyText1!,
                            //   fontWeight: 600,
                            //   letterSpacing: 0.2,
                            // ),
                            hintStyle: AppCss.getTextStyle(
                              theme.textTheme.bodyText1!,
                            ),
                            hintText: "Confirm Password",
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            prefixIcon: Icon(
                              MdiIcons.lock,
                              color: theme.primaryColor,
                              size: 20,
                            ),
                            suffixIcon: Icon(
                              MdiIcons.eyeOff,
                              color: theme.primaryColor,
                              size: 20,
                            ),
                            isDense: true,
                            // autofocus: false,
                            // textInputAction: TextInputAction.search,
                            // textCapitalization: TextCapitalization.sentences,
                            obscureText: true,
                          ),
                        ),
                        SizedBox(height: 50),
                        Padding(
                          padding: EdgeInsets.all(0),
                          child: CustomButton(
                            title: "Sign up",
                            style: AppCss.getTextStyle(
                              theme.textTheme.subtitle2!,
                              fontWeight: 600,
                              color: theme.colorScheme.background,
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => TravelScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                        RichText(
                          text: TextSpan(
                            text: "Already have account? ",
                            style: AppCss.getTextStyle(
                              theme.textTheme.subtitle2!,
                              color: theme.primaryColor,
                              fontWeight: 600,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Sing in',
                                style: AppCss.getTextStyle(
                                    theme.textTheme.subtitle2!,
                                    color: theme.primaryColor,
                                    fontWeight: 700),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            TravelLoginScreen(),
                                      ),
                                    );
                                  },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
