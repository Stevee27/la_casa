/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'ModelProvider.dart';
import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Order type in your schema. */
@immutable
class Order extends Model {
  static const classType = const _OrderModelType();
  final String id;
  final List<OrderItem>? _OrderItems;
  final User? _User;
  final TemporalTimestamp? _time;
  final String? _orderUserId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  List<OrderItem>? get OrderItems {
    return _OrderItems;
  }
  
  User? get User {
    return _User;
  }
  
  TemporalTimestamp? get time {
    return _time;
  }
  
  String? get orderUserId {
    return _orderUserId;
  }
  
  const Order._internal({required this.id, OrderItems, User, time, orderUserId}): _OrderItems = OrderItems, _User = User, _time = time, _orderUserId = orderUserId;
  
  factory Order({String? id, List<OrderItem>? OrderItems, User? User, TemporalTimestamp? time, String? orderUserId}) {
    return Order._internal(
      id: id == null ? UUID.getUUID() : id,
      OrderItems: OrderItems != null ? List<OrderItem>.unmodifiable(OrderItems) : OrderItems,
      User: User,
      time: time,
      orderUserId: orderUserId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Order &&
      id == other.id &&
      DeepCollectionEquality().equals(_OrderItems, other._OrderItems) &&
      _User == other._User &&
      _time == other._time &&
      _orderUserId == other._orderUserId;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Order {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("time=" + (_time != null ? _time!.toString() : "null") + ", ");
    buffer.write("orderUserId=" + "$_orderUserId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Order copyWith({String? id, List<OrderItem>? OrderItems, User? User, TemporalTimestamp? time, String? orderUserId}) {
    return Order(
      id: id ?? this.id,
      OrderItems: OrderItems ?? this.OrderItems,
      User: User ?? this.User,
      time: time ?? this.time,
      orderUserId: orderUserId ?? this.orderUserId);
  }
  
  Order.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _OrderItems = json['OrderItems'] is List
        ? (json['OrderItems'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => OrderItem.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _User = json['User']?['serializedData'] != null
        ? User.fromJson(new Map<String, dynamic>.from(json['User']['serializedData']))
        : null,
      _time = json['time'] != null ? TemporalTimestamp.fromSeconds(json['time']) : null,
      _orderUserId = json['orderUserId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'OrderItems': _OrderItems?.map((OrderItem? e) => e?.toJson()).toList(), 'User': _User?.toJson(), 'time': _time?.toSeconds(), 'orderUserId': _orderUserId
  };

  static final QueryField ID = QueryField(fieldName: "order.id");
  static final QueryField ORDERITEMS = QueryField(
    fieldName: "OrderItems",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (OrderItem).toString()));
  static final QueryField USER = QueryField(
    fieldName: "User",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (User).toString()));
  static final QueryField TIME = QueryField(fieldName: "time");
  static final QueryField ORDERUSERID = QueryField(fieldName: "orderUserId");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Order";
    modelSchemaDefinition.pluralName = "Orders";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: Order.ORDERITEMS,
      isRequired: false,
      ofModelName: (OrderItem).toString(),
      associatedKey: OrderItem.ORDERID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: Order.USER,
      isRequired: false,
      ofModelName: (User).toString(),
      associatedKey: User.ID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.TIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.timestamp)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Order.ORDERUSERID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _OrderModelType extends ModelType<Order> {
  const _OrderModelType();
  
  @override
  Order fromJson(Map<String, dynamic> jsonData) {
    return Order.fromJson(jsonData);
  }
}