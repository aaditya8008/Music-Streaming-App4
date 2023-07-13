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

import 'package:flutter/cupertino.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade800.withAlpha(35).withOpacity(0.5),Colors.blue.shade800.withAlpha(35).withOpacity(0.5),Colors.transparent.withOpacity(0.5)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,


        )



      ),

child: Scaffold(
  backgroundColor: Colors.transparent,
  appBar: AppBar(title: Text('My Profile'),centerTitle: true,backgroundColor: Colors.transparent,),

  body: Container(

    child:Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,

            children:[SizedBox(height: 250,),CircleAvatar(radius: 80,backgroundImage: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQJCsloaZ5KELcnt7DHHHVcoEuaUuR05B7XdpfRAKLUrz8C5d7aI67hEo1Pjs74hylGqdo&usqp=CAU'

          ),


  ),]),
        ), Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.account_circle,size: 35,color: Colors.white,),SizedBox(width: 10,),Text("Profile",style: TextStyle(color: Colors.white),)
          ],
        ),
        SizedBox(height: 80,),
        Container(
          height: 55,
          width: 700,

          decoration: BoxDecoration( borderRadius: BorderRadius.circular(15),gradient:LinearGradient(colors: [Colors.blue.shade900.withAlpha(35).withOpacity(0.7),Colors.blue.shade800.withAlpha(35).withOpacity(0.5),Colors.transparent.withOpacity(0.5)],)
              ,backgroundBlendMode: BlendMode.dstATop,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("UserName :",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),),Text("Yamoshi",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30),),],
          ),
        ),  SizedBox(height: 20,),
        Container( height: 55,
          decoration: BoxDecoration( borderRadius: BorderRadius.circular(15),gradient:LinearGradient(colors: [Colors.blue.shade900.withAlpha(35).withOpacity(0.7),Colors.blue.shade800.withAlpha(35).withOpacity(0.5),Colors.transparent.withOpacity(0.5)],)
            ,backgroundBlendMode: BlendMode.dstATop,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("Id :",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),),Text("Ux0023",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30),),],
          ),
        ), SizedBox(height: 20,),

        Container( height: 55,
          decoration: BoxDecoration( borderRadius: BorderRadius.circular(15),gradient:LinearGradient(colors: [Colors.blue.shade900.withAlpha(35).withOpacity(0.7),Colors.blue.shade800.withAlpha(35).withOpacity(0.5),Colors.transparent.withAlpha(40).withOpacity(0.3)],)
            ,backgroundBlendMode: BlendMode.dstATop,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("Plan :",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),),Text("Premium",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30),),],
          ),
        ),
        SizedBox(height: 20,),
        Container( height: 55,
          decoration: BoxDecoration( borderRadius: BorderRadius.circular(15),gradient:LinearGradient(colors: [Colors.blue.shade900.withAlpha(35).withOpacity(0.7),Colors.blue.shade800.withAlpha(35).withOpacity(0.5),Colors.transparent.withAlpha(40).withOpacity(0.3)],)
            ,backgroundBlendMode: BlendMode.dstATop,),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [Text("Plan Expires :",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 30),),Text("12/10/25",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 30),),],
          ),
        )
,



      ],
    )



),
),);
  }
}
