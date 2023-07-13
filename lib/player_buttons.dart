

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:musicstreamingapp/playlist_screen.dart';
import 'package:musicstreamingapp/home_screen.dart';
import 'package:musicstreamingapp/songs_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicstreamingapp/eekbar.dart';
import 'package:rxdart/rxdart.dart'as rxdart;
import 'package:musicstreamingapp/song_screen.dart';
class PlayerButtons extends StatefulWidget {
  const PlayerButtons({
    super.key,
    required this.audioPlayer,
  });

  final AudioPlayer audioPlayer;

  @override

  State<PlayerButtons> createState() => _PlayerButtonsState();
}

class _PlayerButtonsState extends State<PlayerButtons> {
  int x=0;
  @override

  Widget build(BuildContext context) {
    StreamBuilder<PlayerState> z;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [StreamBuilder(
          stream: widget.audioPlayer.playerStateStream,
          builder: (context,snapshot){
          return IconButton(onPressed:(){setState(() {
            widget.audioPlayer.hasPrevious ?widget.audioPlayer.seekToPrevious:null;


          });

         }
             ,icon:const Icon(Icons.skip_previous,color: Colors.white,
              ), iconSize: 45);

          },



      ),
        z=StreamBuilder<PlayerState>(
            stream:widget.audioPlayer.playerStateStream
            ,builder: (context,snapshot){
          if(snapshot.hasData){
            final playerState=snapshot.data;
            final processingState=
                playerState! .processingState;

            if(processingState==ProcessingState.loading||processingState==ProcessingState.buffering){
              return Container(width:64.0,
                  height:64.0,
                  margin: const EdgeInsets.all(10.0)
                  ,child:CircularProgressIndicator());
            }else if(!widget.audioPlayer.playing){
              return IconButton(onPressed: widget.audioPlayer.play,iconSize: 75, icon: Icon(Icons.play_circle,
                color: Colors.white,));

            }
            else if(processingState!=ProcessingState.completed){
              return IconButton(onPressed: widget.audioPlayer.pause,iconSize: 75, icon: Icon(Icons.pause_circle,
                color: Colors.white,));
            }else{
              return IconButton(onPressed:()=> widget.audioPlayer.seek(Duration.zero,index: widget.audioPlayer.effectiveIndices!.first),iconSize: 75, icon: Icon(Icons.replay_circle_filled_outlined,
                color: Colors.white,));


            }
          }else{
            return const CircularProgressIndicator();
          }
        }),
        StreamBuilder(
          stream: widget.audioPlayer.playerStateStream,
          builder: (context,snapshot){
            return IconButton(onPressed:(){setState(() {
              widget.audioPlayer.hasNext ?widget.audioPlayer.seekToNext:null;

            });     }
               ,icon:const Icon(Icons.skip_next,color: Colors.white,
                ), iconSize: 45);

          },



        ),
      ],
    );
  }
}
