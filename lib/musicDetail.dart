import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'global.dart';

class MusicDetails extends StatefulWidget {
  const MusicDetails({Key? key}) : super(key: key);

  @override
  State<MusicDetails> createState() => _MusicDetailsState();
}

class _MusicDetailsState extends State<MusicDetails> {
  Duration position = Duration.zero;
  Duration duration = Duration.zero;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Variable.assetsAudioPlayer.open(
      Audio('${Variable.audio[Variable.musicIndex]['path']}'),
      autoStart: true,
      showNotification: true,
    );

    Variable.assetsAudioPlayer.currentPosition.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });

    Variable.assetsAudioPlayer.current.listen((totalDuration) {
      setState(() {
        duration = totalDuration!.audio.duration;
      });
    });

  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        height: height,
        width: width,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Color(0xFF6495ED),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            const Text(
              "Music",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
                letterSpacing: 0.8,
              ),
            ),
            const Spacer(),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 10,
              child: Container(
                height: 350,
                width: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                    Variable.audio[Variable.musicIndex]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const Spacer(),
            Text(
              Variable.audio[Variable.musicIndex]['name'],
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              Variable.audio[Variable.musicIndex]['singer'],
              style: const TextStyle(
                color: Color(0xFFe6e6fa),
                fontSize: 20,
              ),
            ),
            const Spacer(),
            SliderTheme(
              data: const SliderThemeData(
                trackHeight: 1.5,
                thumbShape: RoundSliderThumbShape(
                    disabledThumbRadius: 0, enabledThumbRadius: 8),
                overlayShape: RoundSliderOverlayShape(overlayRadius: 0),
              ),
              child: Slider(
                activeColor: const Color(0xFF6495ED),
                inactiveColor: const Color(0xFF6495ED),
                thumbColor: Colors.white,
                value: position.inSeconds.toDouble(),
                max: duration.inSeconds.toDouble(),
                onChanged: (double value) async {
                  await Variable.assetsAudioPlayer
                      .seek(Duration(seconds: value.toInt()));
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${position.inMinutes.remainder(60)} : ${position.inSeconds.remainder(60)}",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "${duration.inMinutes.remainder(60)} : ${duration.inSeconds.remainder(60)}",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (Variable.musicIndex > 0) {
                        Variable.musicIndex--;
                        Variable.assetsAudioPlayer.open(
                          Audio('${Variable.audio[Variable.musicIndex]['path']}'),
                          autoStart: true,
                          showNotification: true,
                        );
                      }
                    });
                  },
                  child: const Icon(
                    CupertinoIcons.backward_fill,
                    color: Colors.white70,
                    size: 40,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Variable.assetsAudioPlayer.playOrPause();
                    });
                  },
                  child: Icon(
                    Variable.assetsAudioPlayer.isPlaying.value
                        ? CupertinoIcons.stop_fill
                        : CupertinoIcons.play_arrow_solid,
                    color: Colors.white70,
                    size: 40,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (Variable.musicIndex < Variable.audio.length - 1) {
                        Variable.musicIndex++;
                        Variable.assetsAudioPlayer.open(
                          Audio('${Variable.audio[Variable.musicIndex]['path']}'),
                          autoStart: true,
                          showNotification: true,
                        );
                      }
                    });
                  },
                  child: const Icon(
                    CupertinoIcons.forward_fill,
                    color: Colors.white70,
                    size: 40,
                  ),
                ),
              ],
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}