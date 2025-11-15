import 'package:flutter/material.dart';

void main() {
  runApp(GridApp());
}

class GridApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GridDemo(),
    );
  }
}

class GridDemo extends StatelessWidget {
  final items = [
    "Home", "Profile", "Books", "Music",
    "Photos", "Videos", "Notes", "Settings"
  ];

  final icons = [
    Icons.home,
    Icons.person,
    Icons.book,
    Icons.music_note,
    Icons.image,
    Icons.videocam,
    Icons.note,
    Icons.settings
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GridView Example"),
      ),
      body: Padding(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
          ),
          itemBuilder: (context, index) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(icons[index], size: 40),
                  SizedBox(height: 10),
                  Text(
                    items[index],
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
