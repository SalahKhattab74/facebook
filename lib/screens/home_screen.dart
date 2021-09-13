// ignore_for_file: prefer_const_constructors

import 'package:facebook/constants/color_repository.dart';
import 'package:facebook/data/data.dart';
import 'package:facebook/models/post_model.dart';
import 'package:facebook/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    _trackingScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Responsive(
          desktop:
              _homeScreenDesktop(scrollController: _trackingScrollController),
          mobile:
              _homeScreenMobile(scrollController: _trackingScrollController),
        ),
      ),
    );
  }
}

Widget _homeScreenMobile({TrackingScrollController? scrollController}) {
  return CustomScrollView(
    controller: scrollController,
    slivers: [
      SliverAppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title: Text(
          'Facebook',
          style: const TextStyle(
            color: ColorRepository.facebookBlue,
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            letterSpacing: -1.2,
          ),
        ),
        centerTitle: false,
        floating: true,
        actions: [
          CircleButton(
            icon: Icons.search,
            iconSize: 30.0,
            onPressed: () {},
          ),
          CircleButton(
            icon: MdiIcons.facebookMessenger,
            iconSize: 30.0,
            onPressed: () {},
          ),
        ],
      ),
      SliverToBoxAdapter(
          child: CreateTypePostContainer(currentUser: currentUser)),
      SliverPadding(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
        sliver: SliverToBoxAdapter(
          child: Rooms(onlineUsers: onlineUsers),
        ),
      ),
      SliverPadding(
        padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
        sliver: SliverToBoxAdapter(
          child: Stories(
            currentUser: currentUser,
            stories: stories,
          ),
        ),
      ),
      SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return PostContainer(index: index);
          },
          childCount: posts.length,
        ),
      )
    ],
  );
}

Widget _homeScreenDesktop({TrackingScrollController? scrollController}) {
  return Row(
    children: [
      Flexible(
        flex: 2,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: MoreOptionsList(currentUser: currentUser),
          ),
        ),
      ),
      Spacer(),
      Container(
        width: 600.0,
        child: CustomScrollView(
          controller: scrollController,
          slivers: [
            SliverPadding(
              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
              sliver: SliverToBoxAdapter(
                child: Stories(
                  currentUser: currentUser,
                  stories: stories,
                ),
              ),
            ),
            SliverToBoxAdapter(
                child: CreateTypePostContainer(currentUser: currentUser)),
            SliverPadding(
              padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 5.0),
              sliver: SliverToBoxAdapter(
                child: Rooms(onlineUsers: onlineUsers),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final Post post = posts[index];
                  return PostContainer(
                    index: index,
                  );
                },
                childCount: posts.length,
              ),
            )
          ],
        ),
      ),
      Spacer(),
      Flexible(
        flex: 2,
        child: Align(
          alignment: Alignment.centerRight,
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: ContactsList(users: onlineUsers),
          ),
        ),
      ),
    ],
  );
}
