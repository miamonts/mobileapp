import 'package:http/http.dart' as http;
//import 'package:new_post/quizpage.dart';

signup(username, password, score) async {
  var posturl = 'https://flutter-database.herokuapp.com/users';
  var response = await http.post(Uri.parse(posturl), body: {
    "username": username,
    "password": password,
    "score": score,
  });
  print(response.body);
}
//"score": finalScore
