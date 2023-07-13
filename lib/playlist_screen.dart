import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicstreamingapp/explore.dart';
import 'package:musicstreamingapp/player_buttons.dart';
import 'package:musicstreamingapp/playlist_screen.dart';
import 'package:musicstreamingapp/playlistitem.dart';
import 'package:musicstreamingapp/song_screen.dart';
import 'package:musicstreamingapp/songs_model.dart';
import 'package:musicstreamingapp/song_card.dart';
import 'package:musicstreamingapp/account.dart';
class PlaylistScreen extends StatefulWidget {
 const PlaylistScreen({super.key});

  @override

  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  List <Song> songlist=Song.play;

dynamic x=Icons.delete_sweep;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient:  LinearGradient(
          colors: [Colors.blue.shade800.withAlpha(35).withOpacity(0.5),Colors.blue.shade800.withAlpha(35).withOpacity(0.5),Colors.transparent.withOpacity(0.5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,


        )
      ),
child: Scaffold(
  backgroundColor: Colors.transparent,
  appBar: AppBar(title: Text("Playlist"),
  centerTitle: true,
    backgroundColor: Colors.transparent,
    elevation: 0.1,


  ),

  body: Padding(
    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Column(

      children: [
        SizedBox(height: 30,),
        SizedBox(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15)
            ),
            height: MediaQuery.of(context).size.height*0.30,
            width: MediaQuery.of(context).size.width*0.99,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(

                  children:[Image.asset('${songlist[0].coverUrl}'),

                    Column(
                      crossAxisAlignment:CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FloatingActionButton(onPressed: (){
                          Get.toNamed('/song',arguments:  songlist[0]);
                          
                        },child: Icon(Icons.play_arrow_rounded),backgroundColor:Colors.blue.shade900.withOpacity(0.9),),

                      ],
                    )
                ]),
              ],
            ),
          ),
        ),
        SizedBox(height: 30,),

        SizedBox(
          height: MediaQuery.of(context).size.height*0.40,
          child: ListView.builder(itemBuilder: (context,index){
            return Container(

              height:60,
              width:MediaQuery.of(context).size.width*0.40,
              margin:const EdgeInsets.only(bottom:10),

              decoration: BoxDecoration(
                  borderRadius:BorderRadius.circular(15.0) ,
                  color: Colors.blueGrey.shade900.withOpacity(0.8),
                  gradient:LinearGradient(colors: [Colors.blue.shade800.withAlpha(35).withOpacity(0.5),Colors.blue.shade800.withAlpha(35).withOpacity(0.5),Colors.purple.shade600.withAlpha(40).withOpacity(0.3)],)
                  ,backgroundBlendMode: BlendMode.darken
              ), child: Padding(

              padding: const EdgeInsets.fromLTRB(3,8,8,3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(backgroundImage:AssetImage( songlist[index].coverUrl,),radius: 25,)
                  ,Column(
                    children: [
                      Text(songlist[index].title,style: TextStyle(

                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.bold

                      ),),

                      Text(songlist[index].description,style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),),
                    ],

                  ),
                  Row(
                    children: [
                      TextButton(onPressed: (){
                        setState(() {
                          if(index==songlist.length-1){
                            x=null;
                          }
                          else {
                            x=Icons.delete_sweep;
                            Song.play.remove(songlist[index]);
                          }

                        });

                      }, child: Icon(x,color: Colors.white,size: 30,)),
                      TextButton(onPressed: (){
                        setState(() {
                          Get.toNamed('/song',arguments:  songlist[index]);
                        });

                      }, child: Icon(Icons.play_arrow_rounded,color: Colors.white,size: 20,)),
                    ],
                  )

                ],
              ),
            ),
            );


          },scrollDirection: Axis.vertical,itemCount: songlist.length,),
        )


      ],





    ),
  )


),
    );
  }
}
