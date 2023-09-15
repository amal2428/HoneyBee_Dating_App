import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:honeybee/presentation/screens/liked_users/liked_users_page.dart';
import 'package:honeybee/presentation/widgets/text_widgets/custom_text.dart';
import 'package:honeybee/presentation/widgets/textform_widgets/custom_textformfield.dart';

import '../../widgets/fonts/fonts.dart';
import 'chat_screen.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    List<Message> messages = [
      Message(
        senderName: 'John Doe',
        lastMessage: 'Hello!',
        profilePicUrl: 'assets/images/profile.jpg',
        lastSeenTime: '2 hrs',
      ),
      Message(
        senderName: 'John Doe',
        lastMessage: 'Hello!',
        profilePicUrl: 'assets/images/profile.jpg',
        lastSeenTime: '2 hrs',
      ),
      Message(
        senderName: 'John Doe',
        lastMessage: 'Hello!',
        profilePicUrl: 'assets/images/profile.jpg',
        lastSeenTime: '2 hrs',
      ),
      Message(
        senderName: 'John Doe',
        lastMessage: 'Hello!',
        profilePicUrl: 'assets/images/profile.jpg',
        lastSeenTime: '2 hrs',
      ),
      Message(
        senderName: 'John Doe',
        lastMessage: 'Hello!',
        profilePicUrl: 'assets/images/profile.jpg',
        lastSeenTime: '2 hrs',
      ),
      Message(
        senderName: 'John Doe',
        lastMessage: 'Hello!',
        profilePicUrl: 'assets/images/profile.jpg',
        lastSeenTime: '2 hrs',
      ),
      Message(
        senderName: 'John Doe',
        lastMessage: 'Hello!',
        profilePicUrl: 'assets/images/profile.jpg',
        lastSeenTime: '2 hrs',
      ),
      Message(
        senderName: 'John Doe',
        lastMessage: 'Hello!',
        profilePicUrl: 'assets/images/profile.jpg',
        lastSeenTime: '2 hrs',
      ),
      Message(
        senderName: 'John Doe',
        lastMessage: 'Hello!',
        profilePicUrl: 'assets/images/profile.jpg',
        lastSeenTime: '2 hrs',
      ),
      Message(
        senderName: 'John Doe',
        lastMessage: 'Hello!',
        profilePicUrl: 'assets/images/profile.jpg',
        lastSeenTime: '2 hrs',
      ),
      Message(
        senderName: 'John Doe',
        lastMessage: 'Hello!',
        profilePicUrl: 'assets/images/profile.jpg',
        lastSeenTime: '2 hrs',
      ),
      Message(
        senderName: 'John Doe',
        lastMessage: 'Hello!',
        profilePicUrl: 'assets/images/profile.jpg',
        lastSeenTime: '2 hrs',
      ),
    ];

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: height * 0.05,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              BorderlineButton(
                  icon: Icons.arrow_back_ios_new,
                  onpressed: () {
                    Navigator.pop(context);
                  }),
              const CustomText(
                text: 'Messages',
                fontFamily: CustomFont.headTextFont,
                fontsize: 25,
                fontWeight: FontWeight.bold,
                letterspacing: 1,
              ),
              BorderlineButton(icon: Icons.tune_outlined, onpressed: () {})
            ],
          ),
          SizedBox(
            height: height * 0.04,
          ),
          const CustomTextFormFiled(
            icon: Icons.search,
            text: 'Search',
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                Message message = messages[index];

                return InkWell(
                  onTap: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (context) {
                        return const ChatScreen();
                      },
                    );

                    print('tapping');
                  },
                  child: Card(
                    // Adjust padding, margin, and decoration as needed
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(message.profilePicUrl),
                      ),
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(message.senderName),
                          Text(message.lastSeenTime),
                        ],
                      ),
                      subtitle: Text(message.lastMessage),
                      // onTap: () {
                      //   // Handle tap on message
                      // },
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class Message {
  final String senderName;
  final String lastMessage;
  final String profilePicUrl;
  final String lastSeenTime;

  Message({
    required this.senderName,
    required this.lastMessage,
    required this.profilePicUrl,
    required this.lastSeenTime,
  });
}
