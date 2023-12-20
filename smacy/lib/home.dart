

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'dart:ui';
import 'package:smacy/DownloadPage.dart';
import 'package:smacy/widget/poster.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import 'models/movie_models.dart';

class Home extends StatefulWidget {
  

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  List<String> posterList = [];

  List<MovieModel>? movieModel;

  @override
  void initState() {
    posterList.add("picture/notime.jpeg");
    posterList.add("picture/1917.jpg");
    posterList.add("picture/john.jpg");
    posterList.add("picture/mission.jpg");
    

    super.initState();
  }

  final controller = PageController();

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
        bottom: PreferredSize(preferredSize: Size.fromHeight(1.0),
        
        child: Container(color:  Color.fromRGBO(173, 225, 0, 1),height: 1.0,),),
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
      onPressed: () {
        
      })],
      ),
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
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
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          "Smacy - ",
                          style: TextStyle(
                            color: const Color.fromRGBO(173, 225, 0, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Action",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 200,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 150,
                    child: ListView.separated(
                      
                      padding: EdgeInsets.all(4),
                      scrollDirection: Axis.horizontal,
                      itemCount: posterList.length,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {
                            
                          },
                          child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0), 
                          child: Poster(
                            
                            poster: posterList[index],
                            id: 0,
                          ),
                        ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 12,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    child: Row(
                      children: [
                        Text(
                          "Smacy - ",
                          style: TextStyle(
                            color: const Color.fromRGBO(173, 225, 0, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "Advanture",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        Expanded(
                          child: SizedBox(
                            width: 200,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See All",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  SizedBox(
                    
                    height: 150,
                    child: ListView.separated(
                      
                      padding: EdgeInsets.all(4),
                      scrollDirection: Axis.horizontal,
                      itemCount: posterList.length,
                      
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0), 
                          child: Poster(
                            poster: posterList[index],
                            id: 0,
                          ),
                        ));
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 12,
                        );
                      },
                    ),
                  ),
                ],
              ),
              
              
            ],
            
          ),
        ),
        
      ),
      
    );
  }
}
