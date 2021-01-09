import 'package:geolocator/geolocator.dart';

class GettingLocation {
  double latitude;
  double longitude;
  Future<void> gettingCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      print(position);
      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print(e);
    }
  }
}
