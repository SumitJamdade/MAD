import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(CrudApp());
}

class CrudApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CrudScreen(),
    );
  }
}

class CrudScreen extends StatefulWidget {
  @override
  State<CrudScreen> createState() => _CrudScreenState();
}

class _CrudScreenState extends State<CrudScreen> {
  final nameCtrl = TextEditingController();
  final db = FirebaseDatabase.instance.ref("users");

  String displayData = "";

  @override
  void initState() {
    super.initState();

    db.onValue.listen((event) {
      final data = event.snapshot.value;
      setState(() {
        displayData = data.toString();
      });
    });
  }

  // CREATE & UPDATE
  void saveUser() {
    if (nameCtrl.text.trim().isEmpty) return;

    db.set({
      "name": nameCtrl.text.trim(),
    });

    nameCtrl.clear();
  }

  // DELETE
  void deleteUser() {
    db.remove();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Firebase CRUD"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameCtrl,
              decoration: InputDecoration(
                labelText: "Enter Name",
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: saveUser,
                  child: Text("Save / Update"),
                ),
                ElevatedButton(
                  onPressed: deleteUser,
                  child: Text("Delete"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                  ),
                ),
              ],
            ),

            SizedBox(height: 30),

            Text(
              "Database Output:",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            SizedBox(height: 10),

            Text(
              displayData,
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
