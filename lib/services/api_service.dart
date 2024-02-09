import 'dart:convert';
import 'package:ghibli_studio/model/post_model.dart';
import 'package:http/http.dart' as http;

//Service
Future<List<Post>> fetchPost() async {
  final response =
      await http.get(Uri.parse('https://ghibliapi.vercel.app/films'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();

    //Mapping To List
    return parsed.map<Post>((json) => Post.fromMap(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

//More Service
List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));
