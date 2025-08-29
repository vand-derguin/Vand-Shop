import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_event.dart';
import 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState(items: [])) {
    on<AddToCart>((event, emit) {
      final items = List<Map<String, dynamic>>.from(state.items);
      final index = items.indexWhere(
        (item) => item['product']['id'] == event.product['id'],
      );

      if (index >= 0) {
        // Increment quantity if already in cart
        final item = items[index];
        final qty = (item['quantity'] ?? 1) + 1;
        items[index] = {...item, 'quantity': qty};
      } else {
        // Add new product
        items.add({'product': event.product, 'quantity': 1});
      }

      emit(CartState(items: items));
    });

    on<IncrementQuantity>((event, emit) {
      final items = state.items.map((item) {
        if (item['product']['id'].toString() == event.productId) {
          final qty = (item['quantity'] ?? 1) + 1;
          return {...item, 'quantity': qty};
        }
        return item;
      }).toList();

      emit(CartState(items: items));
    });

    on<DecrementQuantity>((event, emit) {
      final items = state.items.map((item) {
        if (item['product']['id'].toString() == event.productId) {
          final qty = (item['quantity'] ?? 1) - 1;
          return {...item, 'quantity': qty < 1 ? 1 : qty};
        }
        return item;
      }).toList();

      emit(CartState(items: items));
    });

    on<RemoveFromCart>((event, emit) {
      final items = state.items
          .where((item) => item['product']['id'].toString() != event.productId)
          .toList();

      emit(CartState(items: items));
    });
  }
}
