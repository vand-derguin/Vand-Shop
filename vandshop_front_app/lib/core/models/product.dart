import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class Product {
  final String id;
  final String name;
  final String? barcode;
  final double price;
  final int stock;
  Product({
    required this.id,
    required this.name,
    this.barcode,
    required this.price,
    required this.stock,
  });
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
