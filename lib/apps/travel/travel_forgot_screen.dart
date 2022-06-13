import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:stackit/theme/app_css.dart';
import 'package:stackit/theme/app_theme.dart';
import 'package:stackit/apps/travel/travel_full_screen.dart';
import 'package:stackit/widgets/custom_button.dart';
import 'package:stackit/widgets/custom_textformfield.dart';

class TravelForgotPassword extends StatefulWidget {
  const TravelForgotPassword({Key? key}) : super(key: key);

  @override
  _TravelForgotPasswordState createState() => _TravelForgotPasswordState();
}

class _TravelForgotPasswordState extends State<TravelForgotPassword> {
  late ThemeData theme;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    theme = AppTheme.theme;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.colorScheme.onPrimary,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            MdiIcons.arrowLeft,
            color: theme.colorScheme.onBackground,
            size: 25,
          ),
        ),
        title: Text(
          'Forgot Password',
          style: AppCss.getTextStyle(
            theme.textTheme.headline6!,
            color: theme.colorScheme.primary,
            fontWeight: 700,
            letterSpacing: 0.5,
          ),
        ),
      ),
      backgroundColor: theme.colorScheme.onPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(
                    "assets/svg/forgot_password.png",
                  ),
                ),
                // SizedBox(height: 20),
                Align(
                  child: Text(
                    "We have sent a password recover instructions to your email",
                    textAlign: TextAlign.center,
                    style: AppCss.getTextStyle(
                      theme.textTheme.bodyText1!.copyWith(fontSize: 17),
                      fontWeight: 600,
                      letterSpacing: 0,
                    ),
                  ),
                ),
                Form(
                  child: Column(
                    children: [
                      const SizedBox(height: 40),
                      Container(
                        decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: theme.primaryColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: CustomTextFormField(
                          hintText: "Email address",
                          prefixIcon: Icon(MdiIcons.email,
                              color: theme.primaryColor, size: 20),
                        ),
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        title: "Send Email",
                        style: AppCss.getTextStyle(theme.textTheme.bodyText2!,
                            fontWeight: 700,
                            letterSpacing: 0.4,
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
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
