import 'package:flutter/material.dart';

class CatWidgets extends StatelessWidget {
  const CatWidgets({super.key, required this.title,required this.color});


  final String title;
 final Color color ;


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.all(10),
      decoration:  BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(Radius.circular(10))),
      child:  Center(
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
