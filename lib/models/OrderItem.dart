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

import 'package:amplify_core/amplify_core.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the OrderItem type in your schema. */
@immutable
class OrderItem extends Model {
  static const classType = const _OrderItemModelType();
  final String id;
  final int? _quantity;
  final String? _orderID;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  int? get quantity {
    return _quantity;
  }
  
  String get orderID {
    try {
      return _orderID!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const OrderItem._internal({required this.id, quantity, required orderID, createdAt, updatedAt}): _quantity = quantity, _orderID = orderID, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory OrderItem({String? id, int? quantity, required String orderID}) {
    return OrderItem._internal(
      id: id == null ? UUID.getUUID() : id,
      quantity: quantity,
      orderID: orderID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderItem &&
      id == other.id &&
      _quantity == other._quantity &&
      _orderID == other._orderID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("OrderItem {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("quantity=" + (_quantity != null ? _quantity!.toString() : "null") + ", ");
    buffer.write("orderID=" + "$_orderID" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  OrderItem copyWith({String? id, int? quantity, String? orderID}) {
    return OrderItem._internal(
      id: id ?? this.id,
      quantity: quantity ?? this.quantity,
      orderID: orderID ?? this.orderID);
  }
  
  OrderItem.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _quantity = (json['quantity'] as num?)?.toInt(),
      _orderID = json['orderID'],
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'quantity': _quantity, 'orderID': _orderID, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "orderItem.id");
  static final QueryField QUANTITY = QueryField(fieldName: "quantity");
  static final QueryField ORDERID = QueryField(fieldName: "orderID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "OrderItem";
    modelSchemaDefinition.pluralName = "OrderItems";
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderItem.QUANTITY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderItem.ORDERID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _OrderItemModelType extends ModelType<OrderItem> {
  const _OrderItemModelType();
  
  @override
  OrderItem fromJson(Map<String, dynamic> jsonData) {
    return OrderItem.fromJson(jsonData);
  }
}