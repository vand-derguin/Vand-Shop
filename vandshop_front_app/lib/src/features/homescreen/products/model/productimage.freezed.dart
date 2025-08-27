// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'productimage.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Productimage _$ProductimageFromJson(Map<String, dynamic> json) {
  return _Productimage.fromJson(json);
}

/// @nodoc
mixin _$Productimage {
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProductimageCopyWith<Productimage> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductimageCopyWith<$Res> {
  factory $ProductimageCopyWith(
          Productimage value, $Res Function(Productimage) then) =
      _$ProductimageCopyWithImpl<$Res, Productimage>;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$ProductimageCopyWithImpl<$Res, $Val extends Productimage>
    implements $ProductimageCopyWith<$Res> {
  _$ProductimageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_value.copyWith(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductimageImplCopyWith<$Res>
    implements $ProductimageCopyWith<$Res> {
  factory _$$ProductimageImplCopyWith(
          _$ProductimageImpl value, $Res Function(_$ProductimageImpl) then) =
      __$$ProductimageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String url});
}

/// @nodoc
class __$$ProductimageImplCopyWithImpl<$Res>
    extends _$ProductimageCopyWithImpl<$Res, _$ProductimageImpl>
    implements _$$ProductimageImplCopyWith<$Res> {
  __$$ProductimageImplCopyWithImpl(
      _$ProductimageImpl _value, $Res Function(_$ProductimageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
  }) {
    return _then(_$ProductimageImpl(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductimageImpl implements _Productimage {
  _$ProductimageImpl({required this.url});

  factory _$ProductimageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductimageImplFromJson(json);

  @override
  final String url;

  @override
  String toString() {
    return 'Productimage(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductimageImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductimageImplCopyWith<_$ProductimageImpl> get copyWith =>
      __$$ProductimageImplCopyWithImpl<_$ProductimageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductimageImplToJson(
      this,
    );
  }
}

abstract class _Productimage implements Productimage {
  factory _Productimage({required final String url}) = _$ProductimageImpl;

  factory _Productimage.fromJson(Map<String, dynamic> json) =
      _$ProductimageImpl.fromJson;

  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$$ProductimageImplCopyWith<_$ProductimageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
