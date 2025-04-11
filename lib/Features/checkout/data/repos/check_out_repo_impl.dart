import 'package:checkout_app/Features/checkout/data/data_source/payment_data_source.dart';
import 'package:checkout_app/Features/checkout/domain/repos/check_out_repo.dart';
import 'package:checkout_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

class CheckOutRepoImpl implements CheckOutRepo {
  final PaymentDataSource dataSource;
  CheckOutRepoImpl({required this.dataSource});
  @override
  Future<Either<Failure, void>> makePayment({
    required int amount,
    required String currency,
    String? customerId,
  }) async {
    try {
       await dataSource.makePayment(
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
