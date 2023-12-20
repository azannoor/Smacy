import 'package:flutter/material.dart';

import '../downloadPage.dart';

class Poster extends StatefulWidget {
  final String poster;
  final int id;
  const Poster({super.key, required this.poster, required this.id});

  @override
  State<Poster> createState() => _PosterState();
}

class _PosterState extends State<Poster> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      width: 115,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Image.asset(
        widget.poster,
        fit: BoxFit.cover,
      ),
    );
  }
}
