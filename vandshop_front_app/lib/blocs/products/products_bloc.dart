import 'package:flutter_bloc/flutter_bloc.dart';
import 'products_event.dart';
import 'products_state.dart';
import '../../api/api_client.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ApiClient apiClient;

  ProductsBloc(this.apiClient) : super(const ProductsState()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(loading: true, error: null));
    try {
      final products = await apiClient.getProducts(query: event.query);
      emit(state.copyWith(loading: false, products: products));
    } catch (e) {
      emit(state.copyWith(loading: false, error: e.toString()));
    }
  }
}
