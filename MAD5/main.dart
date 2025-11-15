import 'package:flutter/material.dart';

void main() {
  runApp(ListApp());
}

class ListApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentsList(),
    );
  }
}

class StudentsList extends StatelessWidget {
  final students = [
    "Aarav",
    "Sumit",
    "Rohan",
    "Ishika",
    "Neha",
    "Manav",
    "Prachi"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student List"),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: ListTile(
              leading: CircleAvatar(
                child: Text(students[index][0]),
              ),
              title: Text(students[index]),
              subtitle: Text("Roll No: ${index + 1}"),
            ),
          );
        },
      ),
    );
  }
}
