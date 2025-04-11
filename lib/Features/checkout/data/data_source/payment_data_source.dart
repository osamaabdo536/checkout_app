import 'package:checkout_app/core/utils/stripe_service.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

abstract class PaymentDataSource {
  Future<Either<Failure, void>> makePayment({
    required int amount,
    required String currency,
    String? customerId,
  });
}

class PaymentDataSourceImpl extends PaymentDataSource {
  final StripeService service;
  PaymentDataSourceImpl({required this.service});
  @override
  Future<Either<Failure, void>> makePayment({
    required int amount,
    required String currency,
    String? customerId,
  }) async {
    try {
      await service.makePayment(
        amount: amount,
        currency: currency,
        customerId: customerId,
      );
      return right(null);
    } catch (e) {
      return left(ServiceFailure(errorMess: e.toString()));
    }
  }
}
