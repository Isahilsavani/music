import 'package:flutter/material.dart';
import 'global.dart';
class VideoHomePage extends StatefulWidget {
  const VideoHomePage({Key? key}) : super(key: key);

  @override
  State<VideoHomePage> createState() => _VideoHomePageState();
}

class _VideoHomePageState extends State<VideoHomePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: ListView(
        children: [Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: Variable.video.map((e) {
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return Video(videoIndex: Variable.video.indexOf(e),);
                        })
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 20),
                    height: 200,
                    width: width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(e['image'], fit: BoxFit.cover,),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),],
      ),
    );
  }
}

class Video extends StatefulWidget {
  const Video({Key? key, required int videoIndex}) : super(key: key);

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}