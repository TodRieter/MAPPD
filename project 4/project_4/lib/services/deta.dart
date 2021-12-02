import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/envelope.dart';
import '../models/post.dart';

class DetaService {
  final String key = "b021g1cl_5aaxq5vPsDqbQrDfS3uSrvbmVcLbYZtP";
  final String id = "b021g1cl";
  Future<bool> postPost(Post post) async {
    final url = 'https://database.deta.sh/v1/$id/posts/items';
    final uri = Uri.parse(url);
    final envelope = Envelope(post);
    final string = jsonEncode(envelope);
    await http
        .post(
      uri,
      headers: {
        'X-API-KEY': key,
        'content-type': 'application/json',
      },
      body: string,
    )
        .then((response) {
      if (response.statusCode < 300) {
        return true;
      }
    });
    return !true;
  }

  Future<dynamic> fetchPost() async {
    final url = 'https://database.deta.sh/v1/$id/posts/items/';
    final uri = Uri.parse(url);
    await http.get(
      uri,
      headers: {
        'X-API-KEY': key,
        'content-type': 'application/json',
      },
    ).then((response) {
      print(response.body.toString());
      if (response.statusCode < 300) {
        final json = jsonDecode(response.body);
        Post p = Post.fromJson(json);
        print(p);
        print("string: ${json["username"]}");
        return p;
      }
    });
    print("FAILED TO FETCH POST!");
    return "FAILED TO FETCH POST!";
  }
}
