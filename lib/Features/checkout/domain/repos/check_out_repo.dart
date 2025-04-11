import 'package:checkout_app/Features/checkout/domain/entity/payment_entity.dart';
import 'package:checkout_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class CheckOutRepo {
  Future<Either<Failure, void>> makePayment({
    required int amount,
    required String currency,
    String? customerId,
  });
}
