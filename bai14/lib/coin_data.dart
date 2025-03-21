import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD', 'BRL', 'CAD', 'CNY', 'EUR', 'GBP', 'HKD',
  'IDR', 'ILS', 'INR', 'JPY', 'MXN', 'NOK', 'NZD',
  'PLN', 'RON', 'RUB', 'SEK', 'SGD', 'USD', 'ZAR'
];

const List<String> cryptoList = [
  'BTC', 'ETH', 'LTC',
];

class CoinData {
  static const String _apiBaseUrl = "https://rest.coinapi.io/v1/exchangerate";
  static const String _apiKey = "43803e77-a09f-4ec1-9047-b72cb3522746";

  Future<Map<String, String>> getExchangeRates(String currency) async {
    if (!(await _isConnected())) {
      print('❗Không có kết nối Internet');
      return {};
    }

    final Map<String, String> rates = {};

    for (String crypto in cryptoList) {
      try {
        final Uri url = Uri.parse("$_apiBaseUrl/$crypto/$currency?apikey=$_apiKey");
        final http.Response res = await http.get(url);

        if (res.statusCode == 200) {
          final data = jsonDecode(res.body);
          final rate = data["rate"];
          rates[crypto] = (rate != null) ? rate.toStringAsFixed(2) : "N/A";
        } else {
          print("❗Error ${res.statusCode}: No exchange rates found for $crypto");
        }
      } catch (e) {
        print("❗Error fetching $crypto data: $e");
      }
    }

    return rates;
  }

  // Kiểm tra kết nối mạng
  Future<bool> _isConnected() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } catch (_) {
      return false;
    }
  }
}
