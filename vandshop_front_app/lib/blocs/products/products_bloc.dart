import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../api/api_client.dart';
import 'products_event.dart';
import 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ApiClient apiClient;

  ProductsBloc(this.apiClient) : super(const ProductsState()) {
    on<LoadProducts>(_onLoadProducts);
  }

  Future<void> _onLoadProducts(
    LoadProducts event,
    Emitter<ProductsState> emit,
  ) async {
    emit(state.copyWith(loading: true));
    try {
      final products = await apiClient.getProducts();
      emit(state.copyWith(products: products, loading: false));
    } catch (e) {
      emit(state.copyWith(error: e.toString(), loading: false));
    }
  }
}
