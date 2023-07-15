import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:musicstreamingapp/home_screen.dart';
import 'package:musicstreamingapp/songs_model.dart';

class SongCard extends StatelessWidget {
  const SongCard({
    super.key,
    required this.songlist,
  });

  final Song songlist;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children:[ InkWell(
          onTap:(){Get.toNamed('/song',arguments: songlist);} ,
          child: Container(
            width:MediaQuery.of(context).size.width*0.45 ,
            decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(15.0) ,
              image: DecorationImage(
                image: AssetImage(songlist.coverUrl),
                fit: BoxFit.cover,

              ),


            ),


          ),
        ),
          InkWell(
onTap:(){Get.toNamed('/song',arguments: songlist);} ,
            child: Container(
              height:50,
              width:MediaQuery.of(context).size.width*0.43,
              margin:const EdgeInsets.only(bottom:10),


              decoration: BoxDecoration(

                  borderRadius:BorderRadius.circular(15.0),
                  color:Colors.blue.shade900.withOpacity(0.9),
                  gradient:LinearGradient(colors: [Colors.blue.shade800.withAlpha(35).withOpacity(1),Colors.blue.shade800.withAlpha(35).withOpacity(0.8),Colors.blue.shade800.withAlpha(35).withOpacity(0.8),Colors.purple.withAlpha(40).withOpacity(0.4)],)

              ),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8,8,0,8),
                child:   Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,



                  children: [



                    Column(



                      mainAxisAlignment: MainAxisAlignment.start,

                      children: [

                        Text(songlist.title,style: TextStyle(

                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.bold

                        ),),

                        Text(songlist.description,style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),),
                      ],
                    ), TextButton(onPressed: (){

                      Get.toNamed('/song',arguments: songlist);
                    }, child: Icon(Icons.play_arrow_rounded,color: Colors.white,size: 20,))
                  ],

                ),
              ),),
          ),],),


    );
  }
}
