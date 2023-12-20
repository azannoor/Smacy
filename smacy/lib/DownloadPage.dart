

import 'package:flutter/material.dart';

class DownloadPage extends StatefulWidget {
  final String movieName;
  final String poster;
  final String time;
  final String year;
  final String guide;
  final String summary;
  const DownloadPage(
      {super.key,
      required this.movieName,
      required this.poster,
      required this.time,
      required this.year,
      required this.guide,
      required this.summary});

  @override
  State<DownloadPage> createState() => _DownloadPageState();
}

class _DownloadPageState extends State<DownloadPage> {
  bool isVisible = false;
  bool text = false;
  int views = 0; // Added views variable

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: Colors.white),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: 200,
              child: ClipRRect(
                child: Image.network(
                  '${widget.poster}',
                  width: 1000,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              width: 500,
              height: 210,
              margin: EdgeInsets.only(top: 0),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black,
                    Colors.black.withOpacity(0.1),
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
            Column(
              children: [
                SizedBox(height: 220),
                Container(
                  alignment: Alignment.topLeft,
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    '${widget.movieName}',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      fontFamily: 'Archivo',
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      child: Text(
                        '${widget.year}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: Colors.grey[800],
                      ),
                      padding: EdgeInsets.all(4),
                      child: Text(
                        '${widget.guide}',
                        style: TextStyle(color: Colors.white, fontSize: 13),
                      ),
                    ),
                    SizedBox(width: 5),
                    Container(
                      child: Text(
                        '${widget.time}',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    '${widget.summary}',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.4,
                        fontWeight: FontWeight.w300),
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  padding: EdgeInsets.only(right: 150),
                  child: Row(
                    children: [
                      Text(
                        "Cast: Daniel Craig, Rami...",
                        style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 15.4,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 5),
                Container(
                    padding: EdgeInsets.only(right: 200),
                    child: Text(
                      "Director: Cary Joji Fukunaga",
                      style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 15.4,
                          fontWeight: FontWeight.w400),
                    )),
                SizedBox(height: 5),
                Container(
                  padding: EdgeInsets.only(right: 330),
                  child: Text(
                    "Views: $views", // Show views count
                    style: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 15.4,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                SizedBox(height: 90),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      elevation: 3,
                      side: BorderSide(
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.fromLTRB(140, 10, 140, 10)),
                  onPressed: () {
                    setState(() {
                      views++; 
                    });
                    
                  },
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(
                          width: 17,
                        ),
                        Icon(
                          Icons.play_arrow,
                          color: Colors.black,
                          size: 20,
                        ),
                        Text(
                          'Play',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Archivo',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[850],
                      elevation: 3,
                      side: BorderSide(
                        width: 1,
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.fromLTRB(140, 10, 140, 10)),
                  onPressed: () {
                    
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.download,
                        color: Colors.black,
                        size: 20,
                      ),
                      Text(
                        'Download',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Archivo',
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
