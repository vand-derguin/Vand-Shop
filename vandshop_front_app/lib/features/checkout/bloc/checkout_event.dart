part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckoutSubmitted extends CheckoutEvent {
  final List<CartItem> items;
  CheckoutSubmitted(this.items);
}
