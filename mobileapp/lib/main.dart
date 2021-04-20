import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:http/http.dart' as http;
import 'quizpage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String username;
  String password;

  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();

  signup(email, password) async {
    var posturl = 'https://flutter-database.herokuapp.com/users';
    var response = await http.post(Uri.parse(posturl),
        body: {"username": username, "password": password});
    print(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Math Trivia Question",
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(),
          body: Stack(
            children: [
              new Container(
                padding: EdgeInsets.all(20),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Colors.orange[300],
                    Colors.orange[200],
                  ],
                )),
                child: Form(
                  key: _formKey,
                  child: new Column(
                    children: <Widget>[
                      Text('Math Trivia Questions',
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      SizedBox(
                        height: 100,
                      ),
                      new TextFormField(
                          controller: usernameController,
                          validator: (value) {
                            return value.isNotEmpty
                                ? null
                                : "Email should not be empty.";
                          },
                          onChanged: (value) {
                            username = value;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            hintText: "Enter Email",
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.person),
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            filled: true,
                            fillColor: Colors.white70.withOpacity(0.5),
                          )),
                      SizedBox(height: 20),
                      new TextFormField(
                        controller: passwordController,
                        validator: (value) {
                          return value.isNotEmpty
                              ? null
                              : "Password should not be empty.";
                        },
                        onChanged: (value) {
                          password = value;
                        },
                        obscureText: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          filled: true,
                          fillColor: Colors.white70.withOpacity(0.5),
                          hintText: 'Enter Password',
                          prefixIcon: Icon(Icons.lock),
                          labelText: 'Password',
                          labelStyle: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.all(5),
                        // height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.orange,
                        ),

                        child: TextButton(
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              print(username);
                              print(password);
                              username = usernameController.text;
                              password = passwordController.text;
                              //signup(username, password);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Math(
                                            username: username,
                                            password: password,
                                          )));
                            }
                          },
                          child: Text(
                            "Start Game",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.black),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
