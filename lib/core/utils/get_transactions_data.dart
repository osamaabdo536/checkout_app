import '../../Features/checkout/data/models/paypal_model/amount_model.dart';
import '../../Features/checkout/data/models/paypal_model/item_list_model.dart';

({AmountModel amount, ItemListModel itemList}) getTransactionsData() {
  var amount = AmountModel(
    total: "100",
    currency: "USD",
    details: Details(shipping: "0", shippingDiscount: 0, subtotal: "100"),
  );
  List<OrderItemModel> orders = [
    OrderItemModel(currency: "USD", name: "Apple", price: "5", quantity: 10),
    OrderItemModel(
      currency: "USD",
      name: "Pineapple",
      price: "10",
      quantity: 5,
    ),
  ];
  var itemList = ItemListModel(orders: orders);

  return (amount: amount, itemList: itemList);
}