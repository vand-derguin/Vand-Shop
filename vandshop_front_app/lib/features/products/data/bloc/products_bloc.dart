import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../core/models/product.dart';
import '../data/products_repository.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent, ProductsState> {
  final ProductsRepository repo;
  ProductsBloc(this.repo) : super(ProductsLoading()) {
    on<ProductsRequested>((e, emit) async {
      emit(ProductsLoading());
      try {
        final items = await repo.list(q: e.query);
        emit(ProductsLoaded(items));
      } catch (_) {
        emit(ProductsError());
      }
    });
  }
}
