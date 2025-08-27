part of 'products_bloc.dart';

abstract class ProductsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class ProductsRequested extends ProductsEvent {
  final String? query;
  ProductsRequested({this.query});
}
