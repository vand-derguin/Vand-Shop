import 'package:equatable/equatable.dart';

class ProductsState extends Equatable {
  final List<dynamic> products;
  final bool loading;
  final String? error;

  const ProductsState({
    this.products = const [],
    this.loading = false,
    this.error,
  });

  ProductsState copyWith({
    List<dynamic>? products,
    bool? loading,
    String? error,
  }) {
    return ProductsState(
      products: products ?? this.products,
      loading: loading ?? this.loading,
      error: error,
    );
  }

  @override
  List<Object?> get props => [products, loading, error];
}
