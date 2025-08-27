import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../cart/bloc/cart_cubit.dart';
import '../data/checkout_repository.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final CheckoutRepository repo;
  CheckoutBloc(this.repo) : super(CheckoutInitial()) {
    on<CheckoutSubmitted>((e, emit) async {
      emit(CheckoutLoading());
      try {
        final payload = e.items
            .map((it) => {'productId': it.product.id, 'quantity': it.qty})
            .toList();
        final res = await repo.checkout(payload);
        emit(CheckoutSuccess(res));
      } catch (_) {
        emit(CheckoutFailure('Payment failed'));
      }
    });
  }
}
