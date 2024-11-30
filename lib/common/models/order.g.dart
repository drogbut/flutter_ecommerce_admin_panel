// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$OrderModelImpl _$$OrderModelImplFromJson(Map<String, dynamic> json) =>
    _$OrderModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String? ?? '',
      docId: json['docId'] as String? ?? '',
      status: $enumDecode(_$OrderStatusEnumMap, json['status']),
      totalAmount: (json['totalAmount'] as num).toInt(),
      orderDate: DateTime.parse(json['orderDate'] as String),
      deliveryDate: json['deliveryDate'] == null
          ? null
          : DateTime.parse(json['deliveryDate'] as String),
    );

Map<String, dynamic> _$$OrderModelImplToJson(_$OrderModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'docId': instance.docId,
      'status': _$OrderStatusEnumMap[instance.status]!,
      'totalAmount': instance.totalAmount,
      'orderDate': instance.orderDate.toIso8601String(),
      'deliveryDate': instance.deliveryDate?.toIso8601String(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.pending: 'pending',
  OrderStatus.processing: 'processing',
  OrderStatus.shipped: 'shipped',
  OrderStatus.delivered: 'delivered',
  OrderStatus.cancelled: 'cancelled',
};
