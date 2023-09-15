import 'package:flutter/material.dart';
import 'package:honeybee/presentation/screens/liked_users/liked_users_page.dart';
import 'package:honeybee/presentation/widgets/fonts/fonts.dart';
import 'package:honeybee/presentation/widgets/text_widgets/custom_text.dart';
import 'package:honeybee/presentation/widgets/textform_widgets/custom_textformfield.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BorderlineButton(
                    icon: Icons.arrow_back_ios_new,
                    onpressed: () {
                      Navigator.pop(context);
                    }),
                BorderlineButton(
                    icon: Icons.tune,
                    onpressed: () {
                      // Navigator.pop(context);
                    }),
              ],
            ),
          ),
          SizedBox(
            height: height * 0.01,
          ),
          const CustomTextFormFiled(
            text: 'Search',
            icon: Icons.search,
          ),
          SizedBox(
            height: height * 0.01,
          ),
          const SearchWidget()
        ],
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 30, // Number of users
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              ListTile(
                leading: const CircleAvatar(
                  radius: 30, // Adjust size as needed
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                ),

                title: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CustomText(
                    text: 'John',
                    fontWeight: FontWeight.bold,
                    fontFamily: CustomFont.textFont,
                  ),
                ),
                // Replace with actual user name
                onTap: () {
                  // Handle tap on user
                  print('Tapped on user $index');
                },
              ),
              const Divider(),
              const SizedBox(
                height: 10,
              )
            ],
          );
        },
      ),
    );
  }
}
