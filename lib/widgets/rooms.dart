// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:facebook/constants/color_repository.dart';
import 'package:facebook/models/user_model.dart';
import 'package:facebook/widgets/widgets.dart';
import 'package:flutter/material.dart';

class Rooms extends StatelessWidget {
  final List<User> onlineUsers;

  const Rooms({Key? key, required this.onlineUsers}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);

    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: isDesktop ? 0.5 : 0.0), // to make shadow appears
      elevation: isDesktop ? 1.0 : 0.0,
      shape: isDesktop
          ? RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            )
          : null,
      child: Container(
        height: 60.0,
        color: Colors.white,
        child: ListView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 4.0),
          scrollDirection: Axis.horizontal,
          itemCount: 1 + onlineUsers.length,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                child: _createRoomButton(),
                padding: const EdgeInsets.symmetric(
                  horizontal: 8.0,
                ),
              );
            }
            final User user = onlineUsers[index - 1];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: ProfileAvatar(
                imageUrl: user.imageUrl,
                isActive: true,
              ),
            );
          },
        ),
      ),
    );
  }
}

Widget _createRoomButton() {
  return OutlineButton(
    onPressed: () => print('Room is created'),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30.0),
    ),
    color: Colors.white,
    borderSide: BorderSide(
      width: 3.0,
      color: Colors.blueAccent,
    ),
    textColor: ColorRepository.facebookBlue,
    child: Row(
      children: [
        Icon(
          Icons.video_call,
          size: 35.0,
          color: Colors.purple,
        ),
        const SizedBox(
          width: 4.0,
        ),
        Text('Create\nRoom'),
      ],
    ),
  );
}
