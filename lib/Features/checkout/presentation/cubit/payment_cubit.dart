import 'dart:developer';
import 'package:bloc/bloc.dart';
import 'package:checkout_app/Features/checkout/domain/use_case/payment_use_case.dart';
import 'package:meta/meta.dart';
part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit({required this.paymentUseCase}) : super(PaymentInitial());
  final PaymentUseCase paymentUseCase;
  Future makePayment({
    required int amount,
    required String currency,
    String? customerId,

  }) async {
    emit(PaymentLoading());
    var data = await paymentUseCase.execute(
      amount: amount,
      currency: currency,
      customerId: customerId,
    );
    data.fold(
      (failure) => emit(PaymentFailure(errorMess: failure.errorMess)),
      (success) => emit(PaymentSuccess()),
    );
  }

  @override
  void onChange(Change<PaymentState> change) {
    log(change.toString());
    super.onChange(change);
  }
}
