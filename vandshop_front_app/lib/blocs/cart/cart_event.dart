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
  final String productId;

  RemoveFromCart(this.productId);

  @override
  List<Object?> get props => [productId];
}

class ClearCart extends CartEvent {}

/// NEW EVENTS
class IncrementQuantity extends CartEvent {
  final String productId;

  IncrementQuantity(this.productId);

  @override
  List<Object?> get props => [productId];
}

class DecrementQuantity extends CartEvent {
  final String productId;

  DecrementQuantity(this.productId);

  @override
  List<Object?> get props => [productId];
}
