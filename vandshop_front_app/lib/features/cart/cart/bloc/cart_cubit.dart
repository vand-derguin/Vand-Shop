import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/models/product.dart';

class CartItem extends Equatable {
  final Product product;
  final int qty;
  const CartItem(this.product, this.qty);
  CartItem copyWith({int? qty}) => CartItem(product, qty ?? this.qty);
  @override
  List<Object?> get props => [product.id, qty];
}

class CartState extends Equatable {
  final List<CartItem> items;
  const CartState(this.items);
  double get total => items.fold(0, (a, it) => a + it.product.price * it.qty);
  @override
  List<Object?> get props => [items, total];
}

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(const CartState([]));
  void add(Product p) {
    final idx = state.items.indexWhere((e) => e.product.id == p.id);
    if (idx == -1)
      emit(CartState([...state.items, CartItem(p, 1)]));
    else
      _setQty(p.id, state.items[idx].qty + 1);
  }

  void remove(String productId) => emit(
    CartState(state.items.where((e) => e.product.id != productId).toList()),
  );
  void _setQty(String id, int q) => emit(
    CartState(
      state.items
          .map((e) => e.product.id == id ? e.copyWith(qty: q) : e)
          .toList(),
    ),
  );
  void dec(String id) {
    final it = state.items.firstWhere((e) => e.product.id == id);
    final q = it.qty - 1;
    if (q <= 0)
      remove(id);
    else
      _setQty(id, q);
  }

  void inc(String id) {
    final it = state.items.firstWhere((e) => e.product.id == id);
    _setQty(id, it.qty + 1);
  }

  void clear() => emit(const CartState([]));
}
