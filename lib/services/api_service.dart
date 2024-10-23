import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/gold_price.dart';

Future<GoldPrice> fetchGoldPrice() async {
  final response =
      await http.get(Uri.parse('https://gold-price.vercel.app/api'));

  if (response.statusCode == 200) {
    return GoldPrice.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load gold price');
  }
}
