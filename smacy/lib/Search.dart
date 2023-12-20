import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'DownloadPage.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  final CollectionReference _moviesCollection =
      FirebaseFirestore.instance.collection('movie');

  List<Map<String, dynamic>> _searchResults = [];

  bool _searched = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.blue, width: 2),
              boxShadow: [
                BoxShadow(
                  color: Colors.blue.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.blue,
                ),
                SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    controller: _searchController,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: 'Search for a movie...',
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        _searchMovies();
                      } else {
                        setState(() {
                          _searchResults = [];
                          _searched = false;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () => _fetchMoviesByCategory('Adventure'),
                child: Text('Adventure'),
              ),
              ElevatedButton(
                onPressed: () => _fetchMoviesByCategory('Horror'),
                child: Text('Horror'),
              ),
              ElevatedButton(
                onPressed: () => _fetchMoviesByCategory('Comedy'),
                child: Text('Comedy'),
              ),
            ],
          ),
          SizedBox(height: 16),
          if (_searchResults.isNotEmpty)
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: _searchResults.length,
                itemBuilder: (context, index) {
                  var movie = _searchResults[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DownloadPage(
                            movieName: movie['movieName'],
                            poster: movie['poster'],
                            time: movie['time'],
                            guide: movie['guide'],
                            year: movie['year'].toString(),
                            summary: movie['summary'],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 150,
                      
                      padding: EdgeInsets.all(15), 
                      child: Card(
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            ClipRRect(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(15),
                              ),
                              child: Image.network(
                                movie['picUrl'],
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(height: 5),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                movie['movieName'],
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          else if (_searched)
            Expanded(
              child: Center(
                child: Text(
                  "No search results",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
        ],
      ),
    );
  }

  void _searchMovies() async {
    final QuerySnapshot<Object?> snapshot = await _moviesCollection.where(
      'movieName',
      isGreaterThanOrEqualTo: _searchController.text,
    ).get();
    setState(() {
      _searchResults = snapshot.docs.map((DocumentSnapshot doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
      _searched = true;
    });
  }

  void _fetchMoviesByCategory(String category) async {
    final QuerySnapshot<Object?> snapshot = await _moviesCollection.where(
      'genre',
      isEqualTo: category,
    ).get();
    setState(() {
      _searchResults = snapshot.docs.map((DocumentSnapshot doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();
      _searched = true;
    });
  }
}
