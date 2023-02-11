import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:music/video.dart';

import 'VideoPage.dart';
import 'gallery.dart';
import 'music.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;
  List page = [
    const Music(),
    const Gallery(),
    const VideoHomePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: page[index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: const Color(0xFF6495ED),
        unselectedItemColor: const Color(0xFF6495ED),
        type: BottomNavigationBarType.fixed,
        currentIndex: index,
        onTap: (val) {
          setState(() {
            index = val;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.music_albums),
            label: "Music",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.photo),
            label: "Gallery",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.video_camera_solid),
            label: "Video",
          ),
        ],
      ),
    );
  }
}