import 'package:flutter/material.dart';

void main() {
  runApp(FormApp());
}

class FormApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: UserForm(),
    );
  }
}

class UserForm extends StatefulWidget {
  @override
  State<UserForm> createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  final formKey = GlobalKey<FormState>();

  String name = "";
  String email = "";
  String pass = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interactive Form"),
      ),

      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            children: [

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value!.isEmpty) return "Enter name";
                  return null;
                },
                onSaved: (value) => name = value!,
              ),

              SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || !value.contains("@")) {
                    return "Enter valid email";
                  }
                  return null;
                },
                onSaved: (value) => email = value!,
              ),

              SizedBox(height: 20),

              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value!.length < 6) {
                    return "Min 6 characters required";
                  }
                  return null;
                },
                onSaved: (value) => pass = value!,
              ),

              SizedBox(height: 30),

              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Saved: $name, $email",
                        ),
                      ),
                    );
                  }
                },
                child: Text("Submit"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
