import 'package:flutter/material.dart';
import '../models/gold_price.dart';
import '../services/api_service.dart';

class GoldPricePage extends StatefulWidget {
  const GoldPricePage({super.key});

  @override
  _GoldPricePageState createState() => _GoldPricePageState();
}

class _GoldPricePageState extends State<GoldPricePage> {
  late Future<GoldPrice> futureGoldPrice;

  @override
  void initState() {
    super.initState();
    futureGoldPrice = fetchGoldPrice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Informasi Harga Emas'),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: FutureBuilder<GoldPrice>(
          future: futureGoldPrice,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildPriceCard(
                      title: 'Harga Emas (USD)',
                      valueOunce: snapshot.data!.usdOunce,
                      valueGram: snapshot.data!.usdGram,
                      valueKg: snapshot.data!.usdKg,
                    ),
                    const SizedBox(height: 20),
                    _buildPriceCard(
                      title: 'Harga Emas (IDR)',
                      valueOunce: snapshot.data!.idrOunce,
                      valueGram: snapshot.data!.idrGram,
                      valueKg: snapshot.data!.idrKg,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Terakhir Diperbarui: ${snapshot.data!.updateGoldPrice}',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildPriceCard({
    required String title,
    required String valueOunce,
    required String valueGram,
    required String valueKg,
  }) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text('Ounce: $valueOunce', style: const TextStyle(fontSize: 18)),
            Text('Gram: $valueGram', style: const TextStyle(fontSize: 18)),
            Text('Kilogram: $valueKg', style: const TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
