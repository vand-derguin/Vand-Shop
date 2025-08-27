// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'productmodel.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Productmodel _$ProductmodelFromJson(Map<String, dynamic> json) {
  return _Productmodel.fromJson(json);
}

/// @nodoc
mixin _$Productmodel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get price => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get barcode => throw _privateConstructorUsedError;
  String get stock => throw _privateConstructorUsedError;
  int get categoryId => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updateAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'ProductImage')
  List<Productimage>? get productimages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductmodelCopyWith<Productmodel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductmodelCopyWith<$Res> {
  factory $ProductmodelCopyWith(
          Productmodel value, $Res Function(Productmodel) then) =
      _$ProductmodelCopyWithImpl<$Res, Productmodel>;
  @useResult
  $Res call(
      {int id,
      String name,
      String price,
      String description,
      String barcode,
      String stock,
      int categoryId,
      DateTime createdAt,
      DateTime updateAt,
      @JsonKey(name: 'ProductImage') List<Productimage>? productimages});
}

/// @nodoc
class _$ProductmodelCopyWithImpl<$Res, $Val extends Productmodel>
    implements $ProductmodelCopyWith<$Res> {
  _$ProductmodelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? description = null,
    Object? barcode = null,
    Object? stock = null,
    Object? categoryId = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? productimages = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productimages: freezed == productimages
          ? _value.productimages
          : productimages // ignore: cast_nullable_to_non_nullable
              as List<Productimage>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductmodelImplCopyWith<$Res>
    implements $ProductmodelCopyWith<$Res> {
  factory _$$ProductmodelImplCopyWith(
          _$ProductmodelImpl value, $Res Function(_$ProductmodelImpl) then) =
      __$$ProductmodelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String name,
      String price,
      String description,
      String barcode,
      String stock,
      int categoryId,
      DateTime createdAt,
      DateTime updateAt,
      @JsonKey(name: 'ProductImage') List<Productimage>? productimages});
}

/// @nodoc
class __$$ProductmodelImplCopyWithImpl<$Res>
    extends _$ProductmodelCopyWithImpl<$Res, _$ProductmodelImpl>
    implements _$$ProductmodelImplCopyWith<$Res> {
  __$$ProductmodelImplCopyWithImpl(
      _$ProductmodelImpl _value, $Res Function(_$ProductmodelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? price = null,
    Object? description = null,
    Object? barcode = null,
    Object? stock = null,
    Object? categoryId = null,
    Object? createdAt = null,
    Object? updateAt = null,
    Object? productimages = freezed,
  }) {
    return _then(_$ProductmodelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      barcode: null == barcode
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      stock: null == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as String,
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updateAt: null == updateAt
          ? _value.updateAt
          : updateAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      productimages: freezed == productimages
          ? _value._productimages
          : productimages // ignore: cast_nullable_to_non_nullable
              as List<Productimage>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductmodelImpl implements _Productmodel {
  _$ProductmodelImpl(
      {required this.id,
      required this.name,
      required this.price,
      required this.description,
      required this.barcode,
      required this.stock,
      required this.categoryId,
      required this.createdAt,
      required this.updateAt,
      @JsonKey(name: 'ProductImage') final List<Productimage>? productimages})
      : _productimages = productimages;

  factory _$ProductmodelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductmodelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String price;
  @override
  final String description;
  @override
  final String barcode;
  @override
  final String stock;
  @override
  final int categoryId;
  @override
  final DateTime createdAt;
  @override
  final DateTime updateAt;
  final List<Productimage>? _productimages;
  @override
  @JsonKey(name: 'ProductImage')
  List<Productimage>? get productimages {
    final value = _productimages;
    if (value == null) return null;
    if (_productimages is EqualUnmodifiableListView) return _productimages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Productmodel(id: $id, name: $name, price: $price, description: $description, barcode: $barcode, stock: $stock, categoryId: $categoryId, createdAt: $createdAt, updateAt: $updateAt, productimages: $productimages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductmodelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.barcode, barcode) || other.barcode == barcode) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updateAt, updateAt) ||
                other.updateAt == updateAt) &&
            const DeepCollectionEquality()
                .equals(other._productimages, _productimages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      price,
      description,
      barcode,
      stock,
      categoryId,
      createdAt,
      updateAt,
      const DeepCollectionEquality().hash(_productimages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductmodelImplCopyWith<_$ProductmodelImpl> get copyWith =>
      __$$ProductmodelImplCopyWithImpl<_$ProductmodelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductmodelImplToJson(
      this,
    );
  }
}

abstract class _Productmodel implements Productmodel {
  factory _Productmodel(
      {required final int id,
      required final String name,
      required final String price,
      required final String description,
      required final String barcode,
      required final String stock,
      required final int categoryId,
      required final DateTime createdAt,
      required final DateTime updateAt,
      @JsonKey(name: 'ProductImage')
      final List<Productimage>? productimages}) = _$ProductmodelImpl;

  factory _Productmodel.fromJson(Map<String, dynamic> json) =
      _$ProductmodelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get price;
  @override
  String get description;
  @override
  String get barcode;
  @override
  String get stock;
  @override
  int get categoryId;
  @override
  DateTime get createdAt;
  @override
  DateTime get updateAt;
  @override
  @JsonKey(name: 'ProductImage')
  List<Productimage>? get productimages;
  @override
  @JsonKey(ignore: true)
  _$$ProductmodelImplCopyWith<_$ProductmodelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
