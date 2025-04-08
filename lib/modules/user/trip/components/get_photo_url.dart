import 'package:flutter_dotenv/flutter_dotenv.dart';

String getPhotoUrl(String photoReference) {
  final String googleApiKey = dotenv.env['GOOGLE_API_KEY'] ?? '';
  final url =
      'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photoreference=$photoReference&key=$googleApiKey';
  print("url $url");
  return url;
}
