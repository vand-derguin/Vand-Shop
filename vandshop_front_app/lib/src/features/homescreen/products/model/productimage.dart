import 'package:freezed_annotation/freezed_annotation.dart';

part 'productimage.freezed.dart';
part 'productimage.g.dart';

@freezed
class Productimage with _$Productimage {
  factory Productimage({required String url}) = _Productimage;

  factory Productimage.fromJson(Map<String, dynamic> json) =>
      _$ProductimageFromJson(json);
}
