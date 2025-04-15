import 'package:get/get.dart';

import '../../../../common/models/order.dart';
import '../../../../utils/constants/enums.dart';
import '../../../../utils/helpers/helper_functions.dart';

class DashboardController extends GetxController {
  static DashboardController get instance => Get.find();

  ///
  final RxList<double> weeklySales = <double>[].obs;
  final RxMap<OrderStatus, int> orderStatusData = <OrderStatus, int>{}.obs;
  final RxMap<OrderStatus, double> totalAmounts = <OrderStatus, double>{}.obs;

  /// --- Orders
  final List<OrderModel> orders = [
    OrderModel(
      id: 'DT002',
      status: OrderStatus.pending,
      totalAmount: 250,
      orderDate: DateTime.now().subtract(Duration(days: 3)),
      deliveryDate: DateTime.now().add(Duration(days: 2)),
    ),
    OrderModel(
      id: 'DT002',
      status: OrderStatus.processing,
      totalAmount: 500,
      orderDate: DateTime.now().subtract(Duration(days: 10)),
      deliveryDate: DateTime.now().subtract(Duration(days: 5)),
    ),
    OrderModel(
      id: 'DT003',
      status: OrderStatus.shipped,
      totalAmount: 150,
      orderDate: DateTime.now().subtract(Duration(days: 15)),
      deliveryDate: DateTime.now().subtract(Duration(days: 10)),
    ),
    OrderModel(
      id: 'DT004',
      status: OrderStatus.delivered,
      totalAmount: 300,
      orderDate: DateTime.now().subtract(Duration(days: 2)),
      deliveryDate: DateTime.now().add(Duration(days: 5)),
    ),
    OrderModel(
      id: 'DT005',
      status: OrderStatus.cancelled,
      totalAmount: 100,
      orderDate: DateTime.now(),
      deliveryDate: DateTime.now().add(Duration(days: 3)),
    ),
  ];

  @override
  void onInit() {
    _calculatedWeeklySales();
    _calculatedOrderStatusData();
    super.onInit();
  }

  /// Call this function to calculate weekly sales
  void _calculatedWeeklySales() {
    // Reset weeklySales to zero
    weeklySales.value = List<double>.filled(7, 0.0);

    // Order processing.
    for (final order in orders) {
      // Calculates the difference between the order week and the current week.
      final orderWeekStart = THelperFunctions.getStartOfWeek(order.orderDate);

      // Ckeck if the order is within the current week
      if (orderWeekStart.isBefore(DateTime.now()) &&
          orderWeekStart.add(const Duration(days: 7)).isAfter(DateTime.now())) {
        int index = (order.orderDate.weekday - 1) % 7;

        // Ensure the index is non-negative
        index = index < 0 ? index + 7 : index;

        // Updates the observed variable.
        weeklySales[index] += order.totalAmount;
      }
    }
  }

  /// Call this function to calculate order status counts
  void _calculatedOrderStatusData() {
    // Reset status data
    orderStatusData.clear();

    // Map to store total amounts for each status
    totalAmounts.value = {for (var status in OrderStatus.values) status: 0.0};

    for (var order in orders) {
      // Count Orders
      final status = order.status;
      orderStatusData[status] = (orderStatusData[status] ?? 0) + 1;

      // Calculate total amount for each status
      totalAmounts[status] = (totalAmounts[status] ?? 0) + order.totalAmount;
    }
  }

  ///
  String getDisplayStatusName(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'Pending';
      case OrderStatus.shipped:
        return 'Shipped';
      case OrderStatus.delivered:
        return 'Delivered';
      case OrderStatus.processing:
        return 'Processing';
      case OrderStatus.cancelled:
        return 'Cancelled';
    }
  }
}
