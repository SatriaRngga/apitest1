class GoldPrice {
  final String usdOunce;
  final String usdGram;
  final String usdKg;
  final String idrOunce;
  final String idrGram;
  final String idrKg;
  final String updateGoldPrice;

  GoldPrice({
    required this.usdOunce,
    required this.usdGram,
    required this.usdKg,
    required this.idrOunce,
    required this.idrGram,
    required this.idrKg,
    required this.updateGoldPrice,
  });

  factory GoldPrice.fromJson(Map<String, dynamic> json) {
    return GoldPrice(
      usdOunce: json['usd']['oz'],
      usdGram: json['usd']['gr'],
      usdKg: json['usd']['kg'],
      idrOunce: json['idr']['oz'],
      idrGram: json['idr']['gr'],
      idrKg: json['idr']['kg'],
      updateGoldPrice: json['update_gold_price'],
    );
  }
}
