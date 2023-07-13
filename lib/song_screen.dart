import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:musicstreamingapp/playlist_screen.dart';
import 'package:musicstreamingapp/home_screen.dart';
import 'package:musicstreamingapp/songs_model.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicstreamingapp/eekbar.dart';
import 'package:rxdart/rxdart.dart'as rxdart;
import 'package:musicstreamingapp/playlist_screen.dart';


import 'widgets.dart';
class SongScreen extends StatefulWidget {
  const SongScreen({super.key});

  @override
  State<SongScreen> createState() => _SongScreenState();
}

class _SongScreenState extends State<SongScreen> {

  AudioPlayer audioPlayer=AudioPlayer();

  Song song=Get.arguments??Song.songs[0];
dynamic x;
int count=0;
  @override

  void initState(){
super.initState();
audioPlayer.setAudioSource(ConcatenatingAudioSource(children: [
  AudioSource.uri(Uri.parse('asset:///${song.url}'),),


]



  ,),);



  }
  void dispose(){
    audioPlayer.dispose();
    super.dispose();
  }
  Stream<SeekBarData> get _seekBarDataStream=>
  rxdart.Rx.combineLatest2<Duration,Duration?,SeekBarData>(
    audioPlayer.positionStream,
    audioPlayer.durationStream,
      (Duration position,Duration? duration){
      return SeekBarData(position, duration??Duration.zero);
      }
  );
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
backgroundColor: Colors.blue.shade900.withOpacity(0.645),
          elevation: 0,




      ),
body:
Stack(


  children: [
Image.asset(song.coverUrl,
fit:BoxFit.cover),
    _BackgroundFilter(),
MusicPlayer(
    song:song,
    seekBarDataStream: _seekBarDataStream, audioPlayer: audioPlayer)

  ],
),

    );
  }
}

class MusicPlayer extends StatefulWidget {
  const MusicPlayer({
    Key? key,
    required this.song,
    required Stream<SeekBarData> seekBarDataStream,
    required this.audioPlayer,
  }) : _seekBarDataStream = seekBarDataStream;
                  //error can be
final Song song;

  final Stream<SeekBarData> _seekBarDataStream;
  final AudioPlayer audioPlayer;

  @override

  State<MusicPlayer> createState() => _MusicPlayerState();
}

class _MusicPlayerState extends State<MusicPlayer> {
int count=1;
dynamic x=Icons.playlist_add_outlined;

  @override
  Widget build(BuildContext context) {

    return     Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end
        ,crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.song.title,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
              TextButton(onPressed: (){
                setState(() {
                  if(count%2!=0) {
                    x=Icons.playlist_add_check;
                    Song.play.insert(0, widget.song);
                  }
                  else{
                    x=Icons.playlist_add_outlined;
                    Song.play.remove( widget.song);
                  }
                  count++;

                });

              }, child: Icon(x,color: Colors.white,size: 30,))
            ],
          ), const SizedBox(height: 10,),

              Text(
            widget.song.description,
            maxLines: 2,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(color:Colors.white),

          ),

          StreamBuilder<SeekBarData>(stream: widget._seekBarDataStream,

              builder:(context,snapshot){

          final positionData=snapshot.data;



            return SeekBar(position: positionData?.position??Duration.zero,

                duration: positionData?.duration??Duration.zero

            ,onChangedEnd:   widget.audioPlayer.seek,

            );

              }),
          PlayerButtons(audioPlayer: widget.audioPlayer)
        ],
      ),
    );
  }
}



class _BackgroundFilter extends StatelessWidget {
  const _BackgroundFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(shaderCallback: (rect){
      return LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [Colors.white,Colors.white.withOpacity(.3),Colors.white.withOpacity(0.2)],
        stops: [0.53,0.5,0.6],



      ).createShader(rect);

    },

      blendMode: BlendMode.dstOut,
      child: Container(

        decoration:
        BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.black,Colors.blue.shade900,],

              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,


            )
        ),
      ),
    );
  }
}






















