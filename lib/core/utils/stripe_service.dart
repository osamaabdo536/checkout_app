import 'package:checkout_app/Features/checkout/data/models/ephemeral_key_model/ephemeral_key_model.dart';
import 'package:checkout_app/Features/checkout/data/models/payment_intent_model/Payment_intent_model.dart';
import 'package:checkout_app/core/utils/api_keys.dart';
import 'package:checkout_app/core/utils/api_service.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

class StripeService {
  ApiService apiService = ApiService();
  Future<PaymentIntentModel> createPaymentIntent({
    required int amount,
    required String currency,
    String? customerId,
  }) async {
    var response = await apiService.post(
      url: "https://api.stripe.com/v1/payment_intents",
      body: {'amount': amount, 'currency': currency, "customer": customerId},
      token: ApiKeys.secretKey,
    );
    var paymentIntentModel = PaymentIntentModel.fromJson(response.data);

    return paymentIntentModel;
  }

  Future<EphemeralKeyModel> createEphemeralKey({
    required String customerId,
  }) async {
    var response = await apiService.post(
      url: "https://api.stripe.com/v1/ephemeral_keys",
      body: {"customer": customerId},
      token: ApiKeys.secretKey,
      headers: {
        "Authorization": "Bearer ${ApiKeys.secretKey}",
        "Stripe-Version": "2025-03-31.basil",
      },
    );
    var ephemeralKeyModel = EphemeralKeyModel.fromJson(response.data);

    return ephemeralKeyModel;
  }

  Future initPaymentSheet({
    required String paymentIntentClientSecret,
    String? customerId,
    String? ephemeralKey,
  }) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: paymentIntentClientSecret,
        merchantDisplayName: "Osama Abdelrahman",
        customerId: customerId,
        customerEphemeralKeySecret: ephemeralKey,
      ),
    );
  }

  Future displayPaymentSheet() async {
    await Stripe.instance.presentPaymentSheet();
  }

  Future makePayment({
    required int amount,
    required String currency,
    String? customerId,
  }) async {
    var paymentIntentModel = await createPaymentIntent(
      amount: amount,
      currency: currency,
      customerId: customerId,
    );
    var ephemeralKey = await createEphemeralKey(customerId: customerId!);
    await initPaymentSheet(
      paymentIntentClientSecret: paymentIntentModel.clientSecret!,
      customerId: customerId,
      ephemeralKey: ephemeralKey.secret,
    );
    await displayPaymentSheet();
  }
}
