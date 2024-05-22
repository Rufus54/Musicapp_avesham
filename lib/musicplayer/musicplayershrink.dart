import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import '../list_tile_class.dart';

class AveshamMPlayer extends StatefulWidget {
  final list_tile_dat songData;
  final bool isExpanded;
  final VoidCallback onCollapse;

  const AveshamMPlayer({
    Key? key,
    required this.songData,
    required this.isExpanded,
    required this.onCollapse,
  }) : super(key: key);

  @override
  _AveshamMPlayerState createState() => _AveshamMPlayerState();
}

class _AveshamMPlayerState extends State<AveshamMPlayer> {
  late AudioPlayer _audioPlayer;
  Duration _currentPosition = Duration.zero;
  Duration _bufferedPosition = Duration.zero;
  Duration _totalDuration = Duration.zero;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _initAudioPlayer();
  }

  @override
  void didUpdateWidget(covariant AveshamMPlayer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.songData.Song != widget.songData.Song) {
      _initAudioPlayer();
    }
  }

  Future<void> _initAudioPlayer() async {
    try {
      await _audioPlayer.setAsset(widget.songData.Song);
      _audioPlayer.positionStream.listen((position) {
        setState(() {
          _currentPosition = position;
        });
      });
      _audioPlayer.bufferedPositionStream.listen((bufferedPosition) {
        setState(() {
          _bufferedPosition = bufferedPosition;
        });
      });
      _audioPlayer.durationStream.listen((totalDuration) {
        setState(() {
          _totalDuration = totalDuration ?? Duration.zero;
        });
      });
      _audioPlayer.play();
    } catch (e) {
      print("Error loading audio: $e");
    }
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.grey[900]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child:
            widget.isExpanded ? buildExpandedPlayer() : buildCollapsedPlayer(),
      ),
    );
  }

  Widget buildExpandedPlayer() {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Column(
            children: [
              AppBar(
                leading: IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  onPressed: widget.onCollapse,
                ),
                backgroundColor: Colors.black,
                elevation: 0,
                actions: [
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.cast_outlined),
                    onPressed: () {
                      print('Icon pressed');
                    },
                  ),
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.more_vert_rounded),
                    onPressed: () {
                      print('Icon pressed');
                    },
                  ),
                ],
              ),
              SizedBox(height: 15),
              Center(
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/avesham_image.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.songData.SongName,
                        style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Sushin Shyam & Nazriya Nazim',
                        style: TextStyle(fontSize: 15, color: Colors.white54),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Container(
                          height: 25,
                          child: Image.asset('assets/ico/like.png')),
                      Text(
                        '22k',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                    ],
                  ),
                  Container(
                      height: 25, child: Image.asset('assets/ico/thumbs.png')),
                  IconButton(
                    color: Colors.white,
                    onPressed: () {},
                    icon: Icon(Icons.comment),
                  ),
                  Container(
                      height: 25, child: Image.asset('assets/ico/share.png')),
                ],
              ),
              SizedBox(height: 10),
              Container(
                width: 300,
                child: ProgressBar(
                  progress: _currentPosition,
                  buffered: _bufferedPosition,
                  total: _totalDuration,
                  onSeek: (duration) {
                    _audioPlayer.seek(duration);
                  },
                  progressBarColor: Colors.white,
                  baseBarColor: Colors.grey,
                  bufferedBarColor: Colors.white54,
                  thumbColor: Colors.white,
                  thumbRadius: 6,
                  timeLabelTextStyle: TextStyle(color: Colors.white),
                  barHeight: 2,
                  timeLabelPadding: 7,
                ),
              ),
              Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                        height: 25,
                        child: Image.asset('assets/ico/shuffle.png')),
                    IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(Icons.skip_previous, size: 40),
                    ),
                    IconButton(
                      color: Colors.white,
                      onPressed: () {
                        if (_audioPlayer.playing) {
                          _audioPlayer.pause();
                        } else {
                          _audioPlayer.play();
                        }
                      },
                      icon: Icon(
                        _audioPlayer.playing
                            ? Icons.pause_circle_filled_sharp
                            : Icons.play_circle_fill_sharp,
                        size: 80,
                      ),
                    ),
                    IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(Icons.skip_next, size: 40),
                    ),
                    Container(
                        height: 24,
                        child: Image.asset('assets/ico/repeat.png')),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildCollapsedPlayer() {
    return Container(
      color: Colors.black,
      child: ListTile(
        leading: Container(
            height: 60, child: Image.asset('assets/avesham_image.jpg')),
        title: Text(widget.songData.SongName,
            style: TextStyle(color: Colors.white)),
        subtitle: Text('Sushin Shyam & Nazriya Nazim',
            style: TextStyle(color: Colors.white54)),
        trailing: IconButton(
          icon: Icon(
            _audioPlayer.playing
                ? Icons.pause_circle_filled_sharp
                : Icons.play_circle_fill_sharp,
            color: Colors.white,
            size: 40,
          ),
          onPressed: () {
            if (_audioPlayer.playing) {
              _audioPlayer.pause();
            } else {
              _audioPlayer.play();
            }
          },
        ),
        onTap: widget.onCollapse,
      ),
    );
  }
}
