import 'package:equatable/equatable.dart';

class ProductsState extends Equatable {
  final bool loading;
  final List<Map<String, dynamic>> products;
  final String? error;

  const ProductsState({
    this.loading = false,
    this.products = const [],
    this.error,
  });

  ProductsState copyWith({
    bool? loading,
    List<Map<String, dynamic>>? products,
    String? error,
  }) {
    return ProductsState(
      loading: loading ?? this.loading,
      products: products ?? this.products,
      error: error,
    );
  }

  @override
  List<Object?> get props => [loading, products, error ?? ""];
}
