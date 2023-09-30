import 'package:flutter/material.dart';
import 'package:honeybee/presentation/screens/profile/edit_profile/edit_profile.dart';
import 'package:honeybee/presentation/screens/profile/profile_preview.dart';
import 'package:honeybee/presentation/screens/sign_in/sign_in_page/sign_in_page.dart';
import 'package:honeybee/presentation/widgets/constants/colors.dart';
import 'package:honeybee/presentation/widgets/fonts/fonts.dart';
import 'package:honeybee/presentation/widgets/policies/privacy.dart';
import 'package:honeybee/presentation/widgets/policies/terms_and_conditions.dart';
import 'package:honeybee/presentation/widgets/text_widgets/custom_text.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.1,
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const CustomText(
              text: 'Profile',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePreview()),
              );
            },
          ),
          SizedBox(
            height: height * 0.03,
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const CustomText(
              text: 'Edit Profile',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const EditProfile()),
              );
            },
          ),
          SizedBox(
            height: height * 0.03,
          ),
          ListTile(
            leading: const Icon(Icons.menu_book_sharp),
            title: const CustomText(
              text: 'Terms & Conditions',
            ),
            onTap: () {
              TermsAndConditions().termsandcondition(context);
            },
          ),
          SizedBox(
            height: height * 0.02,
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip_rounded),
            title: const CustomText(
              text: 'Privacy policy',
            ),
            onTap: () {
              Privacy().privacy(context);
            },
          ),
          SizedBox(
            height: height * 0.03,
          ),
          ListTile(
            leading: const Icon(Icons.logout),
            title: const CustomText(
              text: 'Logout',
            ),
            onTap: () {
              logoutAlertMethod(context);
            },
          ),
        ],
      ),
    );
  }

  Future<dynamic> logoutAlertMethod(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const CustomText(
            text: 'Logout',
            fontFamily: CustomFont.headTextFont,
          ),
          content: const CustomText(
            text: 'Are you sure you want to log out?',
            fontFamily: CustomFont.headTextFont,
          ),
          actions: <Widget>[
            TextButton(
              child: const CustomText(
                text: 'Cancel',
                fontFamily: CustomFont.headTextFont,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const CustomText(
                text: 'Logout',
                fontFamily: CustomFont.headTextFont,
                textColor: CustomColors.kRedButtonColor,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignInPage()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
