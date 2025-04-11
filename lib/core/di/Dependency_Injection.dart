import 'package:checkout_app/Features/checkout/data/data_source/payment_data_source.dart';
import 'package:checkout_app/Features/checkout/data/repos/check_out_repo_impl.dart';
import 'package:checkout_app/Features/checkout/domain/repos/check_out_repo.dart';
import 'package:checkout_app/Features/checkout/domain/use_case/payment_use_case.dart';
import 'package:checkout_app/Features/checkout/presentation/cubit/payment_cubit.dart';
import 'package:checkout_app/core/utils/stripe_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance ;

void intl(){
  sl.registerLazySingleton(() => StripeService());
  sl.registerLazySingleton<PaymentDataSource>(() => PaymentDataSourceImpl(service: sl<StripeService>()));
  sl.registerLazySingleton<CheckOutRepo>(() => CheckOutRepoImpl(dataSource: sl<PaymentDataSource>()));
  sl.registerLazySingleton<PaymentUseCase>(() => PaymentUseCase(checkOutRepo: sl<CheckOutRepo>()));
  sl.registerLazySingleton<PaymentCubit>(() => PaymentCubit(paymentUseCase: sl<PaymentUseCase>()));
}

