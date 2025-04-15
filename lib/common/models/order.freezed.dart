// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'order.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OrderModel {
  String get id;
  String get userId;
  String get docId;
  OrderStatus get status;
  int get totalAmount;
  DateTime get orderDate;
  DateTime? get deliveryDate;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OrderModelCopyWith<OrderModel> get copyWith =>
      _$OrderModelCopyWithImpl<OrderModel>(this as OrderModel, _$identity);

  /// Serializes this OrderModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, docId, status,
      totalAmount, orderDate, deliveryDate);

  @override
  String toString() {
    return 'OrderModel(id: $id, userId: $userId, docId: $docId, status: $status, totalAmount: $totalAmount, orderDate: $orderDate, deliveryDate: $deliveryDate)';
  }
}

/// @nodoc
abstract mixin class $OrderModelCopyWith<$Res> {
  factory $OrderModelCopyWith(
          OrderModel value, $Res Function(OrderModel) _then) =
      _$OrderModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String docId,
      OrderStatus status,
      int totalAmount,
      DateTime orderDate,
      DateTime? deliveryDate});
}

/// @nodoc
class _$OrderModelCopyWithImpl<$Res> implements $OrderModelCopyWith<$Res> {
  _$OrderModelCopyWithImpl(this._self, this._then);

  final OrderModel _self;
  final $Res Function(OrderModel) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? docId = null,
    Object? status = null,
    Object? totalAmount = null,
    Object? orderDate = null,
    Object? deliveryDate = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      docId: null == docId
          ? _self.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: null == orderDate
          ? _self.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: freezed == deliveryDate
          ? _self.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _OrderModel extends OrderModel {
  const _OrderModel(
      {required this.id,
      this.userId = '',
      this.docId = '',
      required this.status,
      required this.totalAmount,
      required this.orderDate,
      required this.deliveryDate})
      : super._();
  factory _OrderModel.fromJson(Map<String, dynamic> json) =>
      _$OrderModelFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String userId;
  @override
  @JsonKey()
  final String docId;
  @override
  final OrderStatus status;
  @override
  final int totalAmount;
  @override
  final DateTime orderDate;
  @override
  final DateTime? deliveryDate;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OrderModelCopyWith<_OrderModel> get copyWith =>
      __$OrderModelCopyWithImpl<_OrderModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OrderModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OrderModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.docId, docId) || other.docId == docId) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.orderDate, orderDate) ||
                other.orderDate == orderDate) &&
            (identical(other.deliveryDate, deliveryDate) ||
                other.deliveryDate == deliveryDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, docId, status,
      totalAmount, orderDate, deliveryDate);

  @override
  String toString() {
    return 'OrderModel(id: $id, userId: $userId, docId: $docId, status: $status, totalAmount: $totalAmount, orderDate: $orderDate, deliveryDate: $deliveryDate)';
  }
}

/// @nodoc
abstract mixin class _$OrderModelCopyWith<$Res>
    implements $OrderModelCopyWith<$Res> {
  factory _$OrderModelCopyWith(
          _OrderModel value, $Res Function(_OrderModel) _then) =
      __$OrderModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String docId,
      OrderStatus status,
      int totalAmount,
      DateTime orderDate,
      DateTime? deliveryDate});
}

/// @nodoc
class __$OrderModelCopyWithImpl<$Res> implements _$OrderModelCopyWith<$Res> {
  __$OrderModelCopyWithImpl(this._self, this._then);

  final _OrderModel _self;
  final $Res Function(_OrderModel) _then;

  /// Create a copy of OrderModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? docId = null,
    Object? status = null,
    Object? totalAmount = null,
    Object? orderDate = null,
    Object? deliveryDate = freezed,
  }) {
    return _then(_OrderModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      docId: null == docId
          ? _self.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as OrderStatus,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as int,
      orderDate: null == orderDate
          ? _self.orderDate
          : orderDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      deliveryDate: freezed == deliveryDate
          ? _self.deliveryDate
          : deliveryDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
