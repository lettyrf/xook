import 'package:flutter/material.dart';
import 'data.dart';

import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';

class BookReader extends StatelessWidget {
  AudioPlayer advancedPlayer;

  Future loadMusic() async {
    //advancedPlayer = await AudioCache().loop("assets/sonido1.mp3");
    advancedPlayer.play("assets/sonido1.mp3");

  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    final cardAspectRatio = 12.0 / 16.0;
    final widgetAspectRatio = cardAspectRatio * 1.2;
    loadMusic();

    return Scaffold(
      /*appBar: AppBar(
        title: Text('Story'),
        backgroundColor: Colors.deepPurple,
      ),*/
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Color(0xFF3B53FF),
                      Color(0xFF35D9E8),
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )
              )
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 40),
                Padding(
                  padding: const EdgeInsets.only(top: 0.0, left: 16),
                  child: IconButton(
                    icon: Icon(Icons.close),
                    iconSize: 40,
                    color: Colors.white.withOpacity(0.9),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 8.0),
                  child: Text(
                      title[3],style: TextStyle(
                    color: Colors.white,
                    fontSize: 36.0,
                    fontFamily: "Calibre-Semibold",
                    letterSpacing: 1.0,
                  )),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 24, left: 24, bottom: 12),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16.0),
                    child: Container(
                      decoration: BoxDecoration(color: Colors.white, boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(3.0, 6.0),
                            blurRadius: 10.0)
                      ]),
                      child: AspectRatio(
                        aspectRatio: cardAspectRatio,
                        child: Stack(
                          fit: StackFit.expand,
                          children: <Widget>[
                            Hero(
                                tag: "avatar_" + 0.toString(),
                                child: Image.asset(images[3], fit: BoxFit.cover)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32.0,vertical: 8.0),
                  child: Container(
                    child: AspectRatio(
                      aspectRatio: cardAspectRatio,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                              xolo[3],style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          )),
                          Text(
                              xolo[2],style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          )),
                          Text(
                              xolo[1],style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          )),
                          Text(
                              xolo[0],style: TextStyle(
                            color: Colors.white,
                            fontSize: 24.0,
                          )),
                        ],
                      ),
                    ),
                  ),
                ),


              ],
            ),
          )
        ],
      ),
    );
  }

}