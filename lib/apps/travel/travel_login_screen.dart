import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';
import 'package:stackit/apps/travel/routes/route_screen_list.dart';
import 'package:stackit/widgets/custom_button.dart';
import 'package:stackit/widgets/custom_textformfield.dart';

class TravelLoginScreen extends StatefulWidget {
  const TravelLoginScreen({Key? key}) : super(key: key);

  @override
  _TravelLoginScreenState createState() => _TravelLoginScreenState();
}

class _TravelLoginScreenState extends State<TravelLoginScreen> {
  late ThemeData theme;
  bool _passwordVisible = true;
  // bool _passwordVisible = true;

  @override
  void initState() {
    theme = AppTheme.theme;
    super.initState();
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
              padding: const EdgeInsets.symmetric(horizontal: 25),
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
                  const SizedBox(height: 30),
                  Text(
                    'Sign in to StacKit',
                    style: AppCss.getTextStyle(
                      theme.textTheme.headline5!,
                      color: theme.primaryColor,
                      fontWeight: 700,
                      height: 1.15,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: theme.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomTextFormField(
                            hintText: "Email Address",
                            prefixIcon: Icon(
                              MdiIcons.email,
                              color: theme.primaryColor,
                              size: 20,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: theme.primaryColor),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: CustomTextFormField(
                            hintText: "Your Password",
                            prefixIcon: Icon(
                              MdiIcons.lock,
                              color: theme.primaryColor,
                              size: 20,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _passwordVisible
                                    ? MdiIcons.eyeOffOutline
                                    : MdiIcons.eyeOutline,
                                color: theme.primaryColor,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              },
                            ),
                            obscureText: _passwordVisible,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Align(
                          alignment: Alignment.topRight,
                          child: InkWell(
                            child: Text(
                              "Forgot Password",
                              style: AppCss.getTextStyle(
                                theme.textTheme.subtitle2!,
                                color: theme.primaryColor,
                                fontWeight: 600,
                              ),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const TravelForgotPassword(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.all(0),
                          child: CustomButton(
                            title: "Sign in",
                            style: AppCss.getTextStyle(
                                theme.textTheme.subtitle2!,
                                fontWeight: 600,
                                color: theme.colorScheme.background),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const TravelScreen(),
                                ),
                              );
                            },
                          ),
                        ),
                        const SizedBox(height: 20),
                        RichText(
                          text: TextSpan(
                            text: "Don't have a account ? ",
                            style: AppCss.getTextStyle(
                              theme.textTheme.subtitle2!,
                              color: theme.primaryColor,
                              fontWeight: 600,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Sing Up',
                                style: AppCss.getTextStyle(
                                  theme.textTheme.subtitle2!,
                                  color: theme.primaryColor,
                                  fontWeight: 700,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const TravelRegisterScreen(),
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
