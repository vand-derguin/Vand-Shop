import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vandshop_front_app/src/features/homescreen/products/model/productimage.dart';

part 'productmodel.freezed.dart';
part 'productmodel.g.dart';

@freezed
class Productmodel with _$Productmodel {
  factory Productmodel({
    required int id,
    required String name,
    required String price,
    required String description,
    required String barcode,
    required String stock,
    required int categoryId,
    required DateTime createdAt,
    required DateTime updateAt,
    @JsonKey(name: 'ProductImage') List<Productimage>? productimages,
  }) = _Productmodel;

  factory Productmodel.fromJson(Map<String, dynamic> json) =>
      _$ProductmodelFromJson(json);
}
