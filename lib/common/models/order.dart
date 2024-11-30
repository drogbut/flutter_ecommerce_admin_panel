import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_ecommerce_admin_panel/utils/helpers/helper_functions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../utils/constants/enums.dart';

part 'order.freezed.dart';
part 'order.g.dart';

@freezed
class OrderModel with _$OrderModel {
  const OrderModel._();

  const factory OrderModel({
    required String id,
    @Default('') String userId,
    @Default('') String docId,
    required OrderStatus status,
    required int totalAmount,
    required DateTime orderDate,
    required DateTime? deliveryDate,
  }) = _OrderModel;

  /// Helper function to format the order date.
  String get formattedOrderDate => THelperFunctions.getFormattedDate(orderDate);

  /// Helper function to format the delivery date.
  String get formattedDeliveryDate => deliveryDate != null ? THelperFunctions.getFormattedDate(orderDate) : '';

  String get orderStatus => status == OrderStatus.delivered
      ? 'Delivered'
      : status == OrderStatus.shipped
          ? 'Shipment on the way'
          : 'Processing';

  /// Static function to create an empty user
  factory OrderModel.empty() => OrderModel(
        id: '',
        userId: '',
        docId: '',
        status: OrderStatus.pending,
        totalAmount: 0,
        orderDate: DateTime.fromMillisecondsSinceEpoch(0),
        deliveryDate: DateTime.fromMillisecondsSinceEpoch(0),
      );

  factory OrderModel.fromJson(Map<String, Object?> json) => _$OrderModelFromJson(json);

  /// factory method to create a user model base on Firebase document snapshot.
  factory OrderModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data();

    if (data == null) {
      return OrderModel.empty();
    }

    return OrderModel(
      id: document.id,
      userId: data['userId'] ?? '',
      docId: data['docId'] ?? '',
      status: OrderStatus.values.firstWhere(
        (e) => e.toString() == 'OrderStatus.${data['status'] ?? 'pending'}',
        orElse: () => OrderStatus.pending,
      ),
      totalAmount: data['totalAmount'] ?? 0,
      orderDate: _parseTimestamp(data['orderDate']),
      deliveryDate: _parseTimestamp(data['deliveryDate']),
    );
  }

  /// Function for parsing a Timestamp field
  static DateTime _parseTimestamp(dynamic timestamp) {
    if (timestamp is Timestamp) {
      return timestamp.toDate();
    } else if (timestamp is String) {
      // If it's a string, try parsing it like ISO 8601
      return DateTime.tryParse(timestamp) ?? DateTime.fromMillisecondsSinceEpoch(0);
    } else {
      return DateTime.fromMillisecondsSinceEpoch(0);
    }
  }
}
