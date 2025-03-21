import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final Uri url; // Chuyển thành kiểu dữ liệu `Uri` theo chuẩn mới

  Future getData() async {
    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        print('Error: ${response.statusCode}');
        return null; // Trả về null nếu xảy ra lỗi
      }
    } catch (e) {
      print('Failed to fetch data: $e');
      return null;
    }
  }
}
