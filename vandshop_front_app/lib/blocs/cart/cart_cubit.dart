import 'package:flutter_bloc/flutter_bloc.dart';

class CartState {
  final Map<String, int> items; // productId → qty
  CartState(this.items);

  double get total => items.values.fold(
    0,
    (sum, qty) => sum + qty * 1000,
  ); // replace with price
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartState({}));

  void add(String id) {
    final updated = Map<String, int>.from(state.items);
    updated[id] = (updated[id] ?? 0) + 1;
    emit(CartState(updated));
  }

  void remove(String id) {
    final updated = Map<String, int>.from(state.items);
    if (updated.containsKey(id)) {
      updated.remove(id);
    }
    emit(CartState(updated));
  }

  void updateQty(String id, int qty) {
    final updated = Map<String, int>.from(state.items);
    if (qty <= 0) {
      updated.remove(id);
    } else {
      updated[id] = qty;
    }
    emit(CartState(updated));
  }

  void clear() => emit(CartState({}));
}
