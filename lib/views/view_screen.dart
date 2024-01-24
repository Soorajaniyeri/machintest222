import 'package:flutter/material.dart';

class ViewScreen extends StatefulWidget {
  const ViewScreen({super.key, required this.title, required this.post});

  final String title;
  final String post;

  @override
  State<ViewScreen> createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            ListTile(
              title: Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(widget.post),
                ],
              ),
            )
          ],
        ));
  }
}
