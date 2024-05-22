import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:avesham_music_album/list_tile_class.dart';
import 'package:flutter/material.dart';

class AveshamMusicPlayer extends StatelessWidget {
  final list_tile_dat songData;
  const AveshamMusicPlayer({Key? key, required this.songData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.black,
              Colors.grey[900]!,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              leading: IconButton(
                color: Colors.white,
                icon: Icon(Icons.keyboard_arrow_down_sharp),
                onPressed: () {
                  // Define what happens when the icon is pressed
                  print('Icon pressed');
                },
              ),
              backgroundColor: Colors.transparent,
              elevation: 0, // Make AppBar background transparent
              actions: [
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.cast_outlined),
                  onPressed: () {
                    // Define what happens when the icon is pressed
                    print('Icon pressed');
                  },
                ),
                IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.more_vert_rounded),
                  onPressed: () {
                    // Define what happens when the icon is pressed
                    print('Icon pressed');
                  },
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Center(
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    10.0,
                  ), // Adjust the radius as needed
                  image: DecorationImage(
                    image: AssetImage('assets/avesham_image.jpg'),
                    fit: BoxFit
                        .cover, // Adjust how the image should fit the container
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      songData.SongName,
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
                    IconButton(
                      color: Colors.white,
                      onPressed: () {},
                      icon: Icon(Icons.thumb_up),
                    ),
                    Text(
                      '22k',
                      style: TextStyle(color: Colors.white, fontSize: 17),
                    ),
                  ],
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.thumb_down),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.comment),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.share),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 300,
              child: ProgressBar(
                progress: Duration(milliseconds: 0000),
                buffered: Duration(milliseconds: 1000),
                total: Duration(milliseconds: 5000),
                progressBarColor: Colors.white, // Color of the progress bar
                baseBarColor:
                    Colors.white, // Background color of the progress bar
                bufferedBarColor: Colors.white, // Buffered bar color
                thumbColor: Colors.white,
                timeLabelTextStyle:
                    TextStyle(color: Colors.white), // Timer text color

                onSeek: (duration) {
                  print('User selected a new time: $duration');
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.shuffle),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_previous,
                    size: 40,
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.play_circle_fill_sharp, size: 80),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(
                    Icons.skip_next,
                    size: 40,
                  ),
                ),
                IconButton(
                  color: Colors.white,
                  onPressed: () {},
                  icon: Icon(Icons.repeat),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "UP NEXT",
                  style: TextStyle(color: Colors.white70),
                ),
                Text("LYRICS", style: TextStyle(color: Colors.white54)),
                Text("RELATED", style: TextStyle(color: Colors.white54)),
              ],
            )
          ],
        ),
      ),
    );
  }
}
