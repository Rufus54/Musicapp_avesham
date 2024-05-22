import 'package:avesham_music_album/list_tile_data.dart';
import 'package:avesham_music_album/pageshrinks.dart';
import 'package:flutter/material.dart';

class AveshamAlbumHome extends StatelessWidget {
  const AveshamAlbumHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                    // Define what happens when the icon is pressed
                    print('Icon pressed');
                  },
                ),
                backgroundColor: Colors.transparent,
                elevation: 0, // Make AppBar background transparent
                actions: [
                  IconButton(
                    color: Colors.white,
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Define what happens when the icon is pressed
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
                    borderRadius: BorderRadius.circular(
                      5.0,
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
                height: 10,
              ),
              Container(
                width: 300,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        '    Aavesham (Original Motion Picture Soundt...',
                        style: TextStyle(
                          fontSize: 25,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
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
                              style: TextStyle(
                                color: Colors.white,
                              ),
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
                      icon: Icon(
                        Icons.refresh,
                        size: 30,
                      ),
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
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AveshamPlayer(
                            songData: MultipleSongsList[index],
                          ),
                        ),
                      );
                    },
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
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
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
        selectedItemColor: Colors.white, // Selected item color set to white
        unselectedItemColor:
            Colors.white54, // Unselected item color set to grey
        backgroundColor: Colors
            .black, // Background color of the BottomNavigationBar set to black
        selectedLabelStyle:
            TextStyle(color: Colors.black), // Selected label color set to white
        unselectedLabelStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
