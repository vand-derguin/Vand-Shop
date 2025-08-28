import 'package:equatable/equatable.dart';

abstract class CartEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class AddToCart extends CartEvent {
  final Map<String, dynamic> product;

  AddToCart(this.product);

  @override
  List<Object?> get props => [product];
}

class RemoveFromCart extends CartEvent {
  final Map<String, dynamic> product;

  RemoveFromCart(this.product);

  @override
  List<Object?> get props => [product];
}

class ClearCart extends CartEvent {}
