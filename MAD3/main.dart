import 'package:flutter/material.dart';

void main() {
  runApp(MyWidgetsApp());
}

class MyWidgetsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Common Widgets Demo"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(
              "Welcome User",
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.home, size: 40),
                Icon(Icons.star, size: 40),
                Icon(Icons.person, size: 40),
              ],
            ),

            SizedBox(height: 25),

            Container(
              width: double.infinity,
              padding: EdgeInsets.all(18),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "This is a Container widget",
                style: TextStyle(fontSize: 18),
              ),
            ),

            SizedBox(height: 25),

            Card(
              elevation: 4,
              child: ListTile(
                leading: Icon(Icons.account_circle, size: 40),
                title: Text("Student Name"),
                subtitle: Text("Roll No: 123"),
              ),
            ),

            SizedBox(height: 30),

            Center(
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Click Me"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
