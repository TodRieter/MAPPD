import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/thing.dart';
import '../models/envelope.dart';

class DetaService {
  final String key = "b021g1cl_5aaxq5vPsDqbQrDfS3uSrvbmVcLbYZtP";
  final String id = "b021g1cl";
  Future<bool> postThing(Thing thing) async {
    final url = 'https://database.deta.sh/v1/$id/basicthings/items';
    final uri = Uri.parse(url);
    final envelope = Envelope(thing);
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
}
