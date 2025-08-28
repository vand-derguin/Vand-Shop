import 'package:equatable/equatable.dart';

abstract class ProductsEvent extends Equatable {
  const ProductsEvent();

  @override
  List<Object?> get props => [];
}

class LoadProducts extends ProductsEvent {
  final String query;

  const LoadProducts({this.query = ''});

  @override
  List<Object?> get props => [query];
}
