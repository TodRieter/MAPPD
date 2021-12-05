import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/envelope.dart';
import '../models/post.dart';

class DetaService {
  final String key = "b021g1cl_5aaxq5vPsDqbQrDfS3uSrvbmVcLbYZtP";
  final String id = "b021g1cl";

  Future<bool> postPost(Post post) async {
    final url = 'https://database.deta.sh/v1/$id/posts/items'; //b0nwc6hd
    final uri = Uri.parse(url);
    final envelope = Envelope(post);
    final string = jsonEncode(envelope);
    await http
        .post(
      uri,
      headers: {
        'X-API-Key': key, //'b0nwc6hd_tWSS1TeWchacsya99DTFe8hPPVxNq1HA',
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

  Future<Post> fetch(int postKey) async {
    final url = 'https://database.deta.sh/v1/$id/posts/items/$postKey';
    final uri = Uri.parse(url);
    return await http.get(uri, headers: {'X-API-Key': key}).then((response) {
      Map<String, dynamic> fetchedPostJson = Envelope(response.body).toJson();

      Post fetchedPost = Post.fromJson(fetchedPostJson);
      return fetchedPost; //'b0nwc6hd_tWSS1TeWchacsya99DTFe8hPPVxNq1HA',
    });
  }

  void delete(Post item) {
    String? itemKey = item.key;
    final url = 'https://database.deta.sh/v1/$id/posts/items/$itemKey';
    http.delete(Uri.parse(url), headers: {'X-API-Key': key});
  }

  //not fully implemented
  void patch(Post item) {
    String? itemKey = item.key;
    String body = item.body;
    final url = 'https://database.deta.sh/v1/$id/posts/items/$itemKey';
    http.patch(Uri.parse(url), headers: {'X-API-Key': key, 'body': body});
  }
}
