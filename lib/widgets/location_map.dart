import 'dart:convert';

import 'package:http/http.dart' as http;

const GOOGLE_API_KEY = 'AIzaSyAeoBRNEW_2WDXj-3pYXO4C9tUl4xLbDCc';

class LocationMap {
  static String generateLocationPreviewImage({
    double latitude,
    double longitude,
  }) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$latitude,$longitude&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng) async {
    final url =
        'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY';
    final response = await http.get(url);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }

  static String generateLocationPreviewImagebyAddress(String address) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=&$address&zoom=17&size=600x600&maptype=roadmap&markers=color:red%7Clabel:A%7C$address&key=$GOOGLE_API_KEY';
  }
}