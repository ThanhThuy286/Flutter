import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url);

  final Uri url; // Đổi kiểu dữ liệu từ String thành Uri

  Future<dynamic> getData() async {
    try {
      http.Response response = await http.get(url);

      if (response.statusCode == 200) {
        String data = response.body;
        return jsonDecode(data);
      } else {
        print('Lỗi mạng với mã lỗi: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Lỗi khi kết nối tới server: $e');
      return null;
    }
  }
}
