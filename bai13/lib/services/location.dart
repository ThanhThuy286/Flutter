import 'package:geolocator/geolocator.dart';

class Location {
  double? latitude;
  double? longitude;

  Future<void> getCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          print('Quyền truy cập vị trí bị từ chối.');
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        print('Quyền truy cập vị trí bị từ chối vĩnh viễn.');
        return;
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
      );

      latitude = position.latitude;
      longitude = position.longitude;
    } catch (e) {
      print('Lỗi khi lấy vị trí: $e');
    }
  }
}
