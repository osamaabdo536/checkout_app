import 'package:checkout_app/Features/checkout/domain/repos/check_out_repo.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';

class PaymentUseCase {
  final CheckOutRepo checkOutRepo;
  PaymentUseCase({required this.checkOutRepo});

  Future<Either<Failure, void>> execute({
    required int amount,
    required String currency,
    String? customerId,

  }) async {
    try {
      await checkOutRepo.makePayment(
        amount: amount,
        currency: currency,
        customerId: customerId,
      );
      return Right(null);
    } catch (e) {
      return Left(ServiceFailure(errorMess: e.toString()));
    }
  }
}
