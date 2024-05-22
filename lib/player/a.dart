import 'package:flutter/material.dart';

import '../list_tile_class.dart';
import '../musicplayer/musicplayershrink.dart';

List<list_tile_dat> MultipleSongsList = [
  list_tile_dat(
      SongIndex: "1",
      SongName: "Mathapithakale",
      SingersName: "Sushin Shyam,Malayali Monkeys",
      Song: 'assets/ad.mp3'),
  list_tile_dat(
      SongName: "Adholokam",
      SingersName: "Sushin Shyam & Vipin Raveendran",
      SongIndex: '2',
      Song: 'assets/Matha.mp3'),
  list_tile_dat(
      SongName: "Thurupu Cheetu",
      SingersName: "Sushin Shyam & Munz TDT",
      SongIndex: '3',
      Song: 'assets/Matha.mp3'),
  list_tile_dat(
      SongName: "Galatta",
      SingersName: "Sushin Shyam & Paal Dabba",
      SongIndex: '4',
      Song: 'assets/Matha.mp3'),
  list_tile_dat(
      SongName: "The Last Dance",
      SingersName: "Sushin Shyam & Hanumankind",
      SongIndex: '5',
      Song: 'assets/Matha.mp3'),
  list_tile_dat(
      SongName: "Odimaga",
      SingersName: "Sushin Shyam & Nazriya",
      SongIndex: '6',
      Song: 'assets/Odimaga.mp3'),
  list_tile_dat(
      SongName: "Jaada",
      SingersName: "Sushin Shyam & Sreenath Bhasi",
      SongIndex: '7',
      Song: 'assets/Jaada.mp3'),
  list_tile_dat(
      SongName: "Armadham",
      SingersName: "Sushin Shyam & Pranavam Sasi",
      SongIndex: '8',
      Song: 'assets/Matha.mp3'),
  list_tile_dat(
      SongName: "Illuminati",
      SingersName: "Sushin Shyam & Dabzee",
      SongIndex: '9',
      Song: 'assets/Illuminati.mp3'),
];

class AveshAlbum extends StatefulWidget {
  @override
  _AveshAlbumState createState() => _AveshAlbumState();
}

class _AveshAlbumState extends State<AveshAlbum> {
  bool isPlayerExpanded = false;
  list_tile_dat? currentSongData;

  void expandPlayer(list_tile_dat songData) {
    setState(() {
      currentSongData = songData;
      isPlayerExpanded = true;
    });
  }

  void collapsePlayer() {
    setState(() {
      isPlayerExpanded = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
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
                      icon: Icon(Icons.arrow_back),
                      onPressed: () {
                        print('Icon pressed');
                      },
                    ),
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    actions: [
                      IconButton(
                        color: Colors.white,
                        icon: Icon(Icons.search),
                        onPressed: () {
                          print('Icon pressed');
                        },
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.0),
                        image: DecorationImage(
                          image: AssetImage('assets/avesham_image.jpg'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: 300,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            'Aavesham (Original Motion Picture Soundtrack)',
                            style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          RichText(
                            text: TextSpan(
                              text:
                                  "Aavesham is the soundtrack to the 2024 film of the same name directed by Jithu Madha... ",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey,
                              ),
                              children: [
                                TextSpan(
                                  text: 'More',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    width: 300,
                    child: Row(
                      children: [
                        IconButton(
                          color: Colors.white,
                          onPressed: () {},
                          icon: Icon(Icons.refresh, size: 30),
                        ),
                        IconButton(
                          color: Colors.white,
                          onPressed: () {},
                          icon: Icon(Icons.add_box_outlined, size: 30),
                        ),
                        IconButton(
                          color: Colors.white,
                          onPressed: () {},
                          icon: Icon(Icons.play_circle_fill_sharp, size: 80),
                        ),
                        IconButton(
                          color: Colors.white,
                          onPressed: () {},
                          icon: Icon(Icons.share, size: 30),
                        ),
                        IconButton(
                          color: Colors.white,
                          onPressed: () {},
                          icon: Icon(Icons.more_vert_rounded, size: 30),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: MultipleSongsList.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        leading: Text(
                          MultipleSongsList[index].SongIndex,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        title: Text(
                          MultipleSongsList[index].SongName,
                          style: TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          MultipleSongsList[index].SingersName,
                          style: TextStyle(color: Colors.white54),
                        ),
                        trailing: Icon(
                          Icons.more_vert_rounded,
                          color: Colors.white,
                        ),
                        onTap: () {
                          expandPlayer(MultipleSongsList[index]);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          if (currentSongData != null)
            AnimatedPositioned(
              duration: Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              top: isPlayerExpanded
                  ? 0
                  : MediaQuery.of(context).size.height - 139,
              left: 0,
              right: 0,
              height:
                  isPlayerExpanded ? MediaQuery.of(context).size.height : 80,
              child: GestureDetector(
                onVerticalDragUpdate: (details) {
                  if (details.primaryDelta! > 10) {
                    collapsePlayer();
                  }
                },
                child: AveshamMPlayer(
                  songData: currentSongData!,
                  isExpanded: isPlayerExpanded,
                  onCollapse: () {
                    if (isPlayerExpanded) {
                      collapsePlayer();
                    } else {
                      expandPlayer(currentSongData!);
                    }
                  },
                ),
              ),
            ),
        ],
      ),
      bottomNavigationBar: isPlayerExpanded
          ? BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.queue_music),
                  label: 'UP NEXT',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.music_note),
                  label: 'LYRICS',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_music),
                  label: 'RELATED',
                ),
              ],
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white54,
              backgroundColor: Colors.black,
              selectedLabelStyle: TextStyle(color: Colors.white),
              unselectedLabelStyle: TextStyle(color: Colors.white54),
            )
          : BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.explore),
                  label: 'Explore',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.library_music),
                  label: 'Library',
                ),
              ],
              selectedItemColor: Colors.white,
              unselectedItemColor: Colors.white54,
              backgroundColor: Colors.black,
              selectedLabelStyle: TextStyle(color: Colors.white),
              unselectedLabelStyle: TextStyle(color: Colors.white54),
            ),
    );
  }
}
