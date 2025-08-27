part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {
  @override
  List<Object?> get props => [];
}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoading extends CheckoutState {}

class CheckoutSuccess extends CheckoutState {
  final Map<String, dynamic> sale;
  CheckoutSuccess(this.sale);
}

class CheckoutFailure extends CheckoutState {
  final String message;
  CheckoutFailure(this.message);
}
