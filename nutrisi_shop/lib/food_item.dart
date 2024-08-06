import 'package:intl/intl.dart';

String formatRupiah(double amount) {
  return NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0)
      .format(amount * 1000);
}
final List<Map<String, String>> foodItems = [
  {
    'imgPath': 'assets/plate1.png',
    'foodName': 'Salmon bowl',
    'price': formatRupiah(24.00),
    'bahan': 'Salmon, rice, vegetables, lemon, herbs',
  },
  {
    'imgPath': 'assets/plate2.png',
    'foodName': 'Spring bowl',
    'price': formatRupiah(22.00),
    'bahan': 'Spring rolls, rice noodles, vegetables, sauce',
  },
  {
    'imgPath': 'assets/plate6.png',
    'foodName': 'Avocado bowl',
    'price': formatRupiah(26.00),
    'bahan': 'Avocado, quinoa, tomatoes, cucumber, dressing',
  },
  {
    'imgPath': 'assets/plate5.png',
    'foodName': 'Berry bowl',
    'price': formatRupiah(24.00),
    'bahan': 'Mixed berries, yogurt, honey, granola',
  },
];
