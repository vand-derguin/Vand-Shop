part of 'products_bloc.dart';

abstract class ProductsState extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductsLoading extends ProductsState {}

class ProductsLoaded extends ProductsState {
  final List<Product> items;
  ProductsLoaded(this.items);
}

class ProductsError extends ProductsState {}
