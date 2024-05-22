import 'package:flutter/material.dart';

import '../list_tile_class.dart';
import '../list_tile_data.dart';
import 'musicplayershrink.dart';

class AveshamAlbum extends StatefulWidget {
  @override
  _AveshamAlbumState createState() => _AveshamAlbumState();
}

class _AveshamAlbumState extends State<AveshamAlbum> {
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
                          image: AssetImage('assets/av.jpeg'),
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
                            '       Aavesham (Original Motion Picture Soundtrack)',
                            style: TextStyle(
                              fontSize: 22,
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                            height: 22,
                            child: Image.asset('assets/ico/download.png')),
                        Container(
                            height: 27,
                            child: Image.asset('assets/ico/add.png')),
                        IconButton(
                          color: Colors.white,
                          onPressed: () {},
                          icon: Icon(Icons.play_circle_fill_sharp, size: 80),
                        ),
                        Container(
                            height: 25,
                            child: Image.asset('assets/ico/share.png')),
                        IconButton(
                            onPressed: () {},
                            icon: Container(
                                height: 30,
                                child: Image.asset('assets/ico/more.png'))),
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
                        trailing: Container(
                            height: 30,
                            child: Image.asset('assets/ico/more.png')),
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
      bottomNavigationBar: BottomNavigationBar(
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
