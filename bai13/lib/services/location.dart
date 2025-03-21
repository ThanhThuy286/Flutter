import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.deniedForever) {
          // Xử lý khi người dùng từ chối quyền vĩnh viễn
          print('Location permissions are permanently denied.');
          return;
        }

        if (permission == LocationPermission.denied) {
          // Xử lý khi người dùng từ chối quyền tạm thời
          print('Location permissions are denied.');
          return;
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('Error retrieving location: $e');
    }
  }
}
