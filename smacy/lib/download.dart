import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smacy/DownloadPage.dart';
import 'movie.dart';
import 'DownloadPage.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:carousel_slider/carousel_slider.dart';

class download extends StatefulWidget {
  const download({super.key});

  @override
  State<download> createState() => _downloadState();
}

class _downloadState extends State<download> {
  final firestore = FirebaseFirestore.instance.collection('movie').snapshots();


  List imageList = [
    "picture/notime.jpeg",
    "picture/1917.jpg",
    "picture/gang.jpg",
    "picture/mission.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        title: Text("Smacy"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Color.fromRGBO(173, 225, 0, 1),
            height: 1.0,
          ),
        ),
        automaticallyImplyLeading: false,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
            child: Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 130,
            ),
            CarouselSlider(
              items: imageList
                  .map((item) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            image: AssetImage('$item'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ))
                  .toList(),
              options: CarouselOptions(
                height: 200.0,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 1200),
              ),
            ),
            StreamBuilder<QuerySnapshot>(
              stream: firestore,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  // Separate movies by genre
                  List<Map<String, dynamic>> adventureMovies = [];
                  List<Map<String, dynamic>> comedyMovies = [];
                  List<Map<String, dynamic>> horrorMovies = [];

                  for (var doc in snapshot.data!.docs) {
                    if (doc['genre'] == 'Adventure') {
                      adventureMovies.add(doc.data() as Map<String, dynamic>);
                    } else if (doc['genre'] == 'Comedy') {
                      comedyMovies.add(doc.data() as Map<String, dynamic>);
                    } else if (doc['genre'] == 'Horror') {
                      horrorMovies.add(doc.data() as Map<String, dynamic>);
                    }
                  }

                  return Column(
                    children: [
                      _buildGenreRow('Adventure', adventureMovies),
                      _buildGenreRow('Comedy', comedyMovies),
                      _buildGenreRow('Horror', horrorMovies),
                    ],
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGenreRow(String genre, List<Map<String, dynamic>> movies) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                genre,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              GestureDetector(
                onTap: () {
                 
                  print('See All tapped for $genre');
                },
                child: Text(
                  'See All',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color.fromRGBO(173, 225, 0, 1), 
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 150, 
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: movies.length,
            itemBuilder: (context, index) {
              var movie = movies[index];
              return GestureDetector(
                onTap: () {
                 
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DownloadPage(
                        movieName: movie['movieName'].toString(),
                        poster: movie['poster'].toString(),
                        time: movie['time'].toString(),
                        guide: movie['guide'].toString(),
                        year: movie['year'].toString(),
                        summary: movie['summary'].toString(),
                      ),
                    ),
                  );
                },
                child: Container(
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: <Widget>[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: Image.network(
                          movie['picUrl'].toString(),
                          width: 100,
                          height: 100,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        movie['movieName'].toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
