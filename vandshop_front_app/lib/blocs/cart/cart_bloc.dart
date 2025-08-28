import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    // Add item to cart
    on<AddToCart>((event, emit) {
      final updatedItems = List<Map<String, dynamic>>.from(state.items)
        ..add(event.product);
      emit(state.copyWith(items: updatedItems));
    });

    // Remove item from cart
    on<RemoveFromCart>((event, emit) {
      final updatedItems = List<Map<String, dynamic>>.from(state.items)
        ..remove(event.product);
      emit(state.copyWith(items: updatedItems));
    });

    // Clear cart
    on<ClearCart>((event, emit) {
      emit(const CartState(items: []));
    });
  }
}
