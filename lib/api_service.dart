// The following code was taken and adjusted from a ChatGPT conversation
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.1.9:8000';

  static Future<List<dynamic>> getVouchers(int userId) async {
    final response = await http.get(
      Uri.parse('$baseUrl/voucher'),
      headers: {
        // Placeholder for future auth if needed
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return data['voucher'] ?? [];
    } else {
      throw Exception('Failed to load vouchers');
    }
  }
}

