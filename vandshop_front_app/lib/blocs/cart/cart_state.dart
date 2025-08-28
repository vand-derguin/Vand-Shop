import 'package:equatable/equatable.dart';

class CartState extends Equatable {
  final List<Map<String, dynamic>> items;

  const CartState({this.items = const []});

  CartState copyWith({List<Map<String, dynamic>>? items}) {
    return CartState(items: items ?? this.items);
  }

  @override
  List<Object?> get props => [items];
}
