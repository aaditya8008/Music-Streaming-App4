
class Song{
  String title;
  String description;
  String url;
  String coverUrl;
Song({
  required this. title,
  required this. description,
  required this. url,
  required this. coverUrl,
});
static List<Song>songs=[
  Song(title: "Blanko", description: "King", url:'assets/songs/blanko.mp3' , coverUrl: 'assets/images/blanko.png'),
  Song(title: "On Top", description: "Karan Aujla", url: 'assets/songs/On Top.mp3', coverUrl: 'assets/images/on top.png'),
  Song(title: "Carnival", description: "King", url: 'assets/songs/carnival.mp3', coverUrl: 'assets/images/carnival.png'),
  Song(title: "295", description: "Sidhu", url: 'assets/songs/295.mp3', coverUrl: 'assets/images/295.png'),
  Song(title: "Open Letter", description: "Talah Anjum", url: 'assets/songs/ys.mp3', coverUrl: 'assets/images/ys.png'),
  Song(title: "Been a While", description: "Krsna", url: 'assets/songs/Been a While.mp3', coverUrl: 'assets/images/Been a While.png'),
  Song(title: "No China", description: "Raftaar", url: 'assets/songs/No China.mp3', coverUrl: 'assets/images/No china.png')
];
  static List<Song>play=[
    Song(title: "Carnival", description: "King", url: 'assets/songs/carnival.mp3', coverUrl: 'assets/images/carnival.png'),
    Song(title: "295", description: "Sidhu", url: 'assets/songs/295.mp3', coverUrl: 'assets/images/295.png'),
    Song(title: "Open Letter", description: "Talah Anjum", url: 'assets/songs/ys.mp3', coverUrl: 'assets/images/ys.png'),



  ];
}

