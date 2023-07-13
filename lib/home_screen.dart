import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:musicstreamingapp/explore.dart';
import 'package:musicstreamingapp/playlist_screen.dart';
import 'package:musicstreamingapp/song_screen.dart';
import 'package:musicstreamingapp/songs_model.dart';
import 'package:musicstreamingapp/song_card.dart';
import 'package:musicstreamingapp/account.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


int currenIndex=0;
void onTap(int index){
setState(() {
  currenIndex=index;
  if(index==0)
  Get.toNamed('/',arguments:  HomeScreen());

  else if(index==1)
    Get.toNamed('/playlist',arguments:   PlaylistScreen());
  else if(index==2)
    Get.toNamed('/account',arguments:  Account());

});
}

  @override
int selectedindex=0;
  List<Song> songlist=Song.songs;

  int c=0;
  dynamic x=Icons.play_arrow;
  Widget build(BuildContext context) {
    return  Container(
      decoration:
     BoxDecoration(
       gradient: LinearGradient(
         colors: [Colors.blue.shade800.withAlpha(35).withOpacity(0.5),Colors.blue.shade800.withAlpha(35).withOpacity(0.5),Colors.transparent.withOpacity(0.5)],
           begin: Alignment.topLeft,
           end: Alignment.bottomRight,


       )
     ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
title: Text('Music'),
          centerTitle: true,
backgroundColor: Colors.transparent,
          elevation: 0.2,
          shadowColor: Colors.transparent,
          leading: Icon(Icons.grid_view_sharp),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Stack(
                  children:[
                  ElevatedButton(style: TextButton.styleFrom(
                      fixedSize: const Size(70, 500),
                      elevation: 0,
                      foregroundColor: Colors.transparent,
                      backgroundColor: Colors.transparent,
                      textStyle: const TextStyle(fontSize: 500)),
                    onPressed: (){
                    onTap(2);
                  }, child: CircleAvatar(backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJCsloaZ5KELcnt7DHHHVcoEuaUuR05B7XdpfRAKLUrz8C5d7aI67hEo1Pjs74hylGqdo&usqp=CAU',

                  ),
                    radius: 300,),)
                  ]
                ),
              ),
            )
          ],


        ),
        bottomNavigationBar: BottomNavigationBar(type: BottomNavigationBarType.fixed,elevation: 0,items: [BottomNavigationBarItem(icon:Icon( Icons.home_filled,),label: "Home",),BottomNavigationBarItem(icon:Icon( Icons.favorite),label: "Liked"),BottomNavigationBarItem(icon:Icon( Icons.account_circle_outlined),label: "Account"),],backgroundColor: Colors.transparent,unselectedItemColor: Colors.white,selectedItemColor:Colors.white,selectedFontSize: 17,unselectedFontSize:17 ,iconSize: 27,currentIndex: currenIndex,onTap: onTap,),
        body: SingleChildScrollView(
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextFormField(decoration: InputDecoration(
                    hintText: "Search",
                    prefixIcon: Icon(Icons.search_sharp),
                    isDense: true,
                    fillColor: Colors.blueGrey[400],
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),

                    )
                  ),

                  ),
                SizedBox(height: 25,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Recentaly Played",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22),),
                    ),
                    SizedBox(height: 25,),
                    SizedBox(
                      height: MediaQuery.of(context).size.height*0.25,
                      child: ListView.builder(scrollDirection:Axis.horizontal,itemCount:songlist.length,itemBuilder: (context,index){
                        return SongCard(songlist: songlist[index]);



                      },
        ),
                    )
                    ,


                  ],

                ),
              SizedBox(height: 25,)
              ,
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text("Recomendations ",style: TextStyle(
                          fontWeight: FontWeight.bold,fontSize: 22
                        ),),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(

                            height: MediaQuery.of(context).size.height*0.31,

                            child: ListView.builder(itemBuilder: (context,index){

                              return Container(
                                  height:55,
                                  width:MediaQuery.of(context).size.width*0.40,
                                margin:const EdgeInsets.only(bottom:10),

    decoration: BoxDecoration(
    borderRadius:BorderRadius.circular(15.0) ,
    color: Colors.blueGrey.shade900.withOpacity(0.8),
 gradient:LinearGradient(colors: [Colors.blue.shade800.withAlpha(35).withOpacity(0.5),Colors.blue.shade800.withAlpha(35).withOpacity(0.5),Colors.purple.shade600.withAlpha(40).withOpacity(0.3)],)
,backgroundBlendMode: BlendMode.darken
    ),
                                child: Padding(

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
                                      TextButton(onPressed: (){
                                        setState(() {
                                          Get.toNamed('/song',arguments:  songlist[index]);
                                        });

                                      }, child: Icon(Icons.play_arrow_rounded,color: Colors.white,size: 20,)),

                                    ],
                                  ),
                                ),


    );}, scrollDirection: Axis.vertical,physics: ScrollPhysics(),itemCount: songlist.length,shrinkWrap: true,

                            ),
                          )
                          ,
                        )

                      ],
                    ),
                  )


                ],
                

              ),


            ),

          ),


        ),

      ),
    );
  }
}

