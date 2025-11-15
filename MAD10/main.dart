import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(ApiApp());
}

class ApiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ApiScreen(),
    );
  }
}

class ApiScreen extends StatefulWidget {
  @override
  State<ApiScreen> createState() => _ApiScreenState();
}

class _ApiScreenState extends State<ApiScreen> {
  List posts = [];
  bool loading = false;

  Future<void> fetchPosts() async {
    setState(() {
      loading = true;
    });

    final url =
        Uri.parse("https://jsonplaceholder.typicode.com/posts");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      posts = jsonDecode(response.body);
    }

    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API Data Example"),
      ),
      body: loading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final item = posts[index];
                return Card(
                  margin: EdgeInsets.all(12),
                  child: ListTile(
                    title: Text(item["title"]),
                    subtitle: Text(item["body"]),
                  ),
                );
              },
            ),
    );
  }
}
