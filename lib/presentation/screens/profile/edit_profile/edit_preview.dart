// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
// import 'package:honeybee/domain/models/edit_profile_model/edit_profile_model.dart';
// import 'package:honeybee/presentation/screens/bottom_navigation/bottom_navbar.dart';
// import 'package:honeybee/presentation/screens/create_account/basic_info/basic_info_last_page.dart';
// import 'package:honeybee/presentation/screens/liked_users/liked_users_page.dart';
// import 'package:honeybee/presentation/widgets/button_widgets/main_custom_button.dart';
// import 'package:honeybee/presentation/widgets/constants/colors.dart';
// import 'package:honeybee/presentation/widgets/fonts/fonts.dart';
// import 'package:honeybee/presentation/widgets/text_widgets/custom_text.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';

// class EditPreviewAccount extends StatelessWidget {
//   const EditPreviewAccount({
//     super.key,
//     required this.editProfileDetails,
//     // required this.selectedOptions,
//   });

//   final EditProfileModel editProfileDetails;
//   // final SelectedOptions selectedOptions;

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     String age = calculateAge(editProfileDetails.birthday!).toString();

//     return Scaffold(
//       body: Center(
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               SizedBox(
//                 height: height * 0.05,
//               ),
//               Row(
//                 children: [
//                   SizedBox(
//                     width: width * 0.02,
//                   ),
//                   BorderlineButton(
//                       icon: Icons.arrow_back_ios_new,
//                       onpressed: () {
//                         Navigator.pop(context);
//                       }),
//                   SizedBox(
//                     width: width * 0.09,
//                   ),
//                   const CustomText(
//                     text: 'Edit Preview Account',
//                     fontFamily: CustomFont.headTextFont,
//                     fontsize: 18,
//                     letterspacing: 1,
//                   ),
//                 ],
//               ),
//               SizedBox(
//                 height: height * 0.03,
//               ),
//               Container(
//                 width: width * 0.9,
//                 height: height * 0.4,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(10),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.grey.withOpacity(0.5),
//                       spreadRadius: 5,
//                       blurRadius: 7,
//                       offset: const Offset(0, 3),
//                     ),
//                   ],
//                 ),
//                 child:
                
//                 // profilePic != null
//                 //               ? profilePic!.path.startsWith(
//                 //                       'http') // Assuming URLs start with 'http'
//                 //                   ? Image.network(profilePic!.path,
//                 //                       fit: BoxFit.cover)
//                 //                   : Image.file(profilePic!, fit: BoxFit.cover)
//                 //               : const Center(
//                 //                   child: Text('No profile image available')),
                
//                 //  Image.file(
//                 //   profileImage,
//                 //   fit: BoxFit.cover,
//                 // ),





//               ),
//               SizedBox(
//                 width: width * 0.99,
//                 // color: Colors.grey,
//                 child: Column(
//                   children: [
//                     SizedBox(height: height * 0.05),
//                     Row(
//                       children: [
//                         SizedBox(
//                           width: width * 0.1,
//                         ),
//                         CustomText(
//                           text: '$fullName, $age',
//                           fontFamily: CustomFont.headTextFont,
//                           fontsize: 20,
//                           fontWeight: FontWeight.bold,
//                           letterspacing: 1,
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: height * 0.025),
//                     Row(
//                       children: [
//                         SizedBox(width: width * 0.1),
//                         CustomText(
//                           text: location,
//                           fontFamily: CustomFont.headTextFont,
//                           fontsize: 17,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: height * 0.02),
//                     Row(
//                       children: [
//                         SizedBox(width: width * 0.1),
//                         Flexible(
//                           child: CustomText(
//                             text: bio,
//                             fontFamily: CustomFont.headTextFont,
//                             fontsize: 15,
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: height * 0.03),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         ChoiceButton(
//                             icon: FontAwesomeIcons.person, label: gender),
//                         ChoiceButton(
//                             icon: FontAwesomeIcons.personPraying,
//                             label: selectedOptions.faith),
//                       ],
//                     ),
//                     SizedBox(height: height * 0.03),
//                     ChoiceButton(
//                         icon: FontAwesomeIcons.heart,
//                         label: selectedOptions.relationshipStatus),
//                     SizedBox(height: height * 0.03),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         ChoiceButton(
//                             icon: FontAwesomeIcons.smoking,
//                             label: selectedOptions.smoking),
//                         ChoiceButton(
//                             icon: FontAwesomeIcons.wineGlass,
//                             label: selectedOptions.drinking),
//                       ],
//                     ),
//                     SizedBox(height: height * 0.05),
//                     BlocBuilder<CreateAccountBloc, CreateAccountState>(
//                         builder: (context, state) {
//                       if (state.isLoading!) {
//                         return LoadingAnimationWidget.horizontalRotatingDots(
//                           color: Colors.purple,
//                           size: 60,
//                         );
//                       } else if (state.navigationState == true) {
//                         WidgetsBinding.instance
//                             .addPostFrameCallback((timeStamp) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: const Row(
//                                 children: [
//                                   Icon(Icons.check_circle_outline,
//                                       color: Colors.white),
//                                   SizedBox(width: 15),
//                                   Flexible(
//                                     child: Text(
//                                       'Profile Details Updated...',
//                                       style: TextStyle(
//                                         color: Colors.white,
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               duration: const Duration(seconds: 5),
//                               backgroundColor:
//                                   const Color.fromARGB(234, 92, 16, 105),
//                               behavior: SnackBarBehavior.floating,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(20),
//                               ),
//                             ),
//                           );

//                           // log('token on the preview account page --- ${state.token!}');

// //----------->>>>>>>>>>----------saving token---------------->>>>>>>>>>>
//                           // saveTokenToPrefs(state.token!);

//                           Navigator.pushAndRemoveUntil(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => BottomNavbar(
//                                 token: state.token!,
//                               ),
//                             ),
//                             (route) => false,
//                           );
//                         });
//                       } else {
//                         return MainCustomButton(
//                           customtext: 'Create Account',
//                           height: height * 0.015,
//                           width: width * 0.2,
//                           txtcolor: CustomColors.kWhiteTextColor,
//                           onpressed: () {
//                             // BlocProvider.of<CreateAccountBloc>(context).add(
//                             //     CreateAccountEvent.createAccount(
//                             //         fullName: fullName,
//                             //         location: location,
//                             //         email: email,
//                             //         phoneNumber: phoneNumber,
//                             //         birthday: birthday,
//                             //         bio: bio,
//                             //         gender: gender,
//                             //         age: age,
//                             //         profileImage: profileImage,
//                             //         coverImage: coverImage,
//                             //         selectedOptions: selectedOptions,
//                             //         preference: preference,
//                             //         image1: image1,
//                             //         image2: image2,
//                             //         image3: image3));

//                             // log("on create function $image1,$image2,$image3");
//                             // log("$fullName, $birthday, $coverImage, $email, $location, $phoneNumber, $profileImage, $image1, $image2, $image3,${selectedOptions.faith},${selectedOptions.relationshipStatus},${selectedOptions.drinking},${selectedOptions.smoking},$bio,$gender,$preference");
//                           },
//                         );
//                       }

//                       return const SizedBox();
//                     }),
//                     SizedBox(height: height * 0.05),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   int calculateAge(String birthday) {
//     DateTime birthDate = DateTime.parse(birthday);
//     DateTime currentDate = DateTime.now();
//     int age = currentDate.year - birthDate.year;
//     if (currentDate.month < birthDate.month ||
//         (currentDate.month == birthDate.month &&
//             currentDate.day < birthDate.day)) {
//       age--;
//     }
//     return age;
//   }
// }

// class ChoiceButton extends StatelessWidget {
//   const ChoiceButton({
//     this.icon,
//     required this.label,
//     super.key,
//   });

//   final IconData? icon;
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     return TextButton.icon(
//       onPressed: () {
//         return;
//       },
//       icon: Icon(
//         icon,
//         color: Colors.black,
//       ),
//       label: Text(
//         label,
//         style: const TextStyle(color: Colors.black),
//       ),
//     );
//   }
// }





// // class EditPreviewAccount extends StatelessWidget {
// //   const EditPreviewAccount({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     double width = MediaQuery.of(context).size.width;
// //     double height = MediaQuery.of(context).size.height;
// //     return Scaffold(
// //       body: Center(
// //         child: SingleChildScrollView(
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.center,
// //             children: [
// //               SizedBox(
// //                 height: height * 0.05,
// //               ),
// //               Row(
// //                 children: [
// //                   SizedBox(
// //                     width: width * 0.09,
// //                   ),
// //                   const CustomText(
// //                     text: 'Preview Account',
// //                     fontFamily: CustomFont.headTextFont,
// //                     fontsize: 18,
// //                     letterspacing: 1,
// //                   ),
// //                 ],
// //               ),
// //               SizedBox(
// //                 height: height * 0.03,
// //               ),
// //               Container(
// //                 width: width * 0.9,
// //                 height: height * 0.4,
// //                 decoration: BoxDecoration(
// //                   color: Colors.white,
// //                   borderRadius: BorderRadius.circular(10),
// //                   boxShadow: [
// //                     BoxShadow(
// //                       color: Colors.grey.withOpacity(0.5),
// //                       spreadRadius: 5,
// //                       blurRadius: 7,
// //                       offset: const Offset(0, 3),
// //                     ),
// //                   ],
// //                 ),
// //                 child: Image.asset(
// //                   'assets/images/profile.jpg',
// //                   fit: BoxFit.cover,
// //                 ),
// //               ),
// //               SizedBox(
// //                 width: width * 0.99,
// //                 // color: Colors.grey,
// //                 child: Column(
// //                   children: [
// //                     SizedBox(height: height * 0.05),
// //                     Row(
// //                       children: [
// //                         SizedBox(
// //                           width: width * 0.1,
// //                         ),
// //                         const CustomText(
// //                           text: 'Full Name , age',
// //                           fontFamily: CustomFont.headTextFont,
// //                           fontsize: 20,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ],
// //                     ),
// //                     SizedBox(
// //                       height: height * 0.03,
// //                     ),
// //                     Row(
// //                       children: [
// //                         SizedBox(
// //                           width: width * 0.1,
// //                         ),
// //                         const CustomText(
// //                           text: 'Location',
// //                           fontFamily: CustomFont.headTextFont,
// //                           fontsize: 15,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ],
// //                     ),
// //                     SizedBox(
// //                       height: height * 0.02,
// //                     ),
// //                     Row(
// //                       children: [
// //                         SizedBox(
// //                           width: width * 0.1,
// //                         ),
// //                         const Flexible(
// //                           child: CustomText(
// //                             text:
// //                                 'This is a dummy text that showing the bio of the user',
// //                             fontFamily: CustomFont.headTextFont,
// //                             fontsize: 15,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                     SizedBox(
// //                       height: height * 0.03,
// //                     ),
// //                     const Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                       children: [
// //                         ChoiceButton(
// //                             icon: FontAwesomeIcons.person, label: 'Gender'),
// //                         ChoiceButton(
// //                             icon: FontAwesomeIcons.personPraying,
// //                             label: 'Faith'),
// //                       ],
// //                     ),
// //                     SizedBox(height: height * 0.03),
// //                     const ChoiceButton(
// //                         icon: FontAwesomeIcons.heart,
// //                         label: 'Relationship status'),
// //                     SizedBox(height: height * 0.03),
// //                     const Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                       children: [
// //                         ChoiceButton(
// //                             icon: FontAwesomeIcons.smoking, label: 'Smoking'),
// //                         ChoiceButton(
// //                             icon: FontAwesomeIcons.wineGlass,
// //                             label: 'Drinking'),
// //                       ],
// //                     ),
// //                     SizedBox(height: height * 0.05),
// //                     MainCustomButton(
// //                       customtext: 'Update Details',
// //                       height: height * 0.015,
// //                       width: width * 0.2,
// //                       txtcolor: CustomColors.kWhiteTextColor,
// //                       onpressed: () {
// //                         Navigator.push(
// //                           context,
// //                           MaterialPageRoute(
// //                               builder: (context) => BottomNavbar(token: '',)),
// //                         );
// //                       },
// //                     ),
// //                     SizedBox(height: height * 0.1),
// //                   ],
// //                 ),
// //               )
// //             ],
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }

// // class ChoiceButton extends StatelessWidget {
// //   const ChoiceButton({
// //     this.icon,
// //     required this.label,
// //     super.key,
// //   });

// //   final IconData? icon;
// //   final String label;

// //   @override
// //   Widget build(BuildContext context) {
// //     return TextButton.icon(
// //       onPressed: () {},
// //       icon: Icon(
// //         icon,
// //         color: Colors.black,
// //       ),
// //       label: Text(
// //         label,
// //         style: const TextStyle(color: Colors.black),
// //       ),
// //     );
// //   }
// // }
