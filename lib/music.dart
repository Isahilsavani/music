import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'global.dart';

class Music extends StatefulWidget {
  const Music({Key? key}) : super(key: key);

  @override
  State<Music> createState() => _MusicState();
}

class _MusicState extends State<Music> {

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(begin: Alignment.bottomCenter, colors: [
            Colors.white,
            Color(0xFF6495ED),
          ]),
        ),
        child: ListView.builder(
          itemCount: Variable.audio.length,
          itemBuilder: (context, index) {
            return ListTile(
              onTap: () {
                Variable.musicIndex = index;
                Navigator.pushNamed(context, 'details');
              },
              leading: Container(
                height: 65,
                width: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(Variable.audio[index]['image']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              title: Text(
                Variable.audio[index]['name'],
                style: const TextStyle(
                  color: Color(0xFFffffff),
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 0.8,
                ),
              ),
              subtitle: Text(
                Variable.audio[index]['singer'],
                style: const TextStyle(
                  color: Color(0xFFe6e6fa),
                  fontSize: 14,
                ),
              ),
              trailing: GestureDetector(
                onTap: () {
                  if(Variable.audio[index]['play'] == false) {
                    Variable.assetsAudioPlayer.open(
                      Audio('${Variable.audio[index]['path']}'),
                      showNotification: true,
                    );
                  }
                  setState(() {
                    for(int no = 0 ; no < Variable.audio.length ; no++) {
                      if(no == index) {
                        continue;
                      }
                      else {
                        Variable.audio[no]['play'] = false;

                      }
                    }
                    Variable.audio[index]['play'] = !Variable.audio[index]['play'];
                    Variable.assetsAudioPlayer.playOrPause();
                  });
                },
                child: Icon(
                  Variable.audio[index]['play']==true
                      ? CupertinoIcons.stop_fill
                      : CupertinoIcons.play_arrow_solid,
                  color: Colors.white70,
                  size: 25,
                ),
              ),
              //tileColor: const Color(0xFFFFE5D4),
            );
          },
        )
    );
  }
}