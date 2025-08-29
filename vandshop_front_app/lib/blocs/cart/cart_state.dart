import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final List<Map<String, dynamic>> items;

  const CartState({required this.items});

  /// Calculate total dynamically
  double get total {
    double sum = 0;
    for (var item in items) {
      final product = item["product"];
      final price = product["price"];
      final qty = item["quantity"] ?? 1;

      // Ensure price is treated as num/double
      final priceValue = price is String
          ? double.tryParse(price) ?? 0
          : (price ?? 0);

      sum += priceValue * qty;
    }
    return sum;
  }

  @override
  List<Object?> get props => [items];
}
