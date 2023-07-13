import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:musicstreamingapp/account.dart';
import 'package:musicstreamingapp/explore.dart';
import 'package:musicstreamingapp/song_screen.dart';
import 'package:musicstreamingapp/playlist_screen.dart';
import 'package:musicstreamingapp/home_screen.dart';
void main() {
  runApp(const Home());
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return  GetMaterialApp(
      title: 'Music',
theme: ThemeData(
  textTheme: Theme.of(context).textTheme.apply(
    bodyColor: Colors.white,
    displayColor: Colors.white
  )
),
      home:const HomeScreen(),
      getPages: [
        GetPage(name: '/', page: ()=>const HomeScreen()),
        GetPage(name: '/song', page: ()=> const SongScreen()),
        GetPage(name: '/playlist', page: ()=> const PlaylistScreen()),
        GetPage(name: '/explore', page: ()=>const Explore()),
        GetPage(name:'/account',page: ()=>const Account())
      ],


    );
  }
}

