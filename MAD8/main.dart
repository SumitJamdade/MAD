import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(FirebaseAppDemo());
}

class FirebaseAppDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final db = FirebaseDatabase.instance.ref("students");
  final nameController = TextEditingController();

  String liveData = "";

  @override
  void initState() {
    super.initState();

    // Listen to live updates from Firebase
    db.onValue.listen((event) {
      final data = event.snapshot.value;
      setState(() {
        liveData = data.toString();
      });
    });
  }

  void saveData() {
    final name = nameController.text.trim();
    if (name.isEmpty) return;

    db.set({"name": name});
    nameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase Realtime DB"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Enter Name",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: saveData,
              child: Text("Save to Firebase"),
            ),

            SizedBox(height: 30),

            Text(
              "Live Data:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text(
              liveData,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }
}
