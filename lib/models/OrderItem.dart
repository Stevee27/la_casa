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


/** This is an auto generated class representing the OrderItem type in your schema. */
@immutable
class OrderItem extends Model {
  static const classType = const _OrderItemModelType();
  final String id;
  final List<ItemOptions>? _ItemOptions;
  final MenuItem? _MenuItem;
  final int? _quantity;
  final String? _orderID;
  final String? _orderItemMenuItemId;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  List<ItemOptions>? get ItemOptions {
    return _ItemOptions;
  }
  
  MenuItem? get MenuItem {
    return _MenuItem;
  }
  
  int? get quantity {
    return _quantity;
  }
  
  String get orderID {
    try {
      return _orderID!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get orderItemMenuItemId {
    return _orderItemMenuItemId;
  }
  
  const OrderItem._internal({required this.id, ItemOptions, MenuItem, quantity, required orderID, orderItemMenuItemId}): _ItemOptions = ItemOptions, _MenuItem = MenuItem, _quantity = quantity, _orderID = orderID, _orderItemMenuItemId = orderItemMenuItemId;
  
  factory OrderItem({String? id, List<ItemOptions>? ItemOptions, MenuItem? MenuItem, int? quantity, required String orderID, String? orderItemMenuItemId}) {
    return OrderItem._internal(
      id: id == null ? UUID.getUUID() : id,
      ItemOptions: ItemOptions != null ? List<ItemOptions>.unmodifiable(ItemOptions) : ItemOptions,
      MenuItem: MenuItem,
      quantity: quantity,
      orderID: orderID,
      orderItemMenuItemId: orderItemMenuItemId);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is OrderItem &&
      id == other.id &&
      DeepCollectionEquality().equals(_ItemOptions, other._ItemOptions) &&
      _MenuItem == other._MenuItem &&
      _quantity == other._quantity &&
      _orderID == other._orderID &&
      _orderItemMenuItemId == other._orderItemMenuItemId;
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
    buffer.write("orderItemMenuItemId=" + "$_orderItemMenuItemId");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  OrderItem copyWith({String? id, List<ItemOptions>? ItemOptions, MenuItem? MenuItem, int? quantity, String? orderID, String? orderItemMenuItemId}) {
    return OrderItem(
      id: id ?? this.id,
      ItemOptions: ItemOptions ?? this.ItemOptions,
      MenuItem: MenuItem ?? this.MenuItem,
      quantity: quantity ?? this.quantity,
      orderID: orderID ?? this.orderID,
      orderItemMenuItemId: orderItemMenuItemId ?? this.orderItemMenuItemId);
  }
  
  OrderItem.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _ItemOptions = json['ItemOptions'] is List
        ? (json['ItemOptions'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => ItemOptions.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _MenuItem = json['MenuItem']?['serializedData'] != null
        ? MenuItem.fromJson(new Map<String, dynamic>.from(json['MenuItem']['serializedData']))
        : null,
      _quantity = (json['quantity'] as num?)?.toInt(),
      _orderID = json['orderID'],
      _orderItemMenuItemId = json['orderItemMenuItemId'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'ItemOptions': _ItemOptions?.map((ItemOptions? e) => e?.toJson()).toList(), 'MenuItem': _MenuItem?.toJson(), 'quantity': _quantity, 'orderID': _orderID, 'orderItemMenuItemId': _orderItemMenuItemId
  };

  static final QueryField ID = QueryField(fieldName: "orderItem.id");
  static final QueryField ITEMOPTIONS = QueryField(
    fieldName: "ItemOptions",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (ItemOptions).toString()));
  static final QueryField MENUITEM = QueryField(
    fieldName: "MenuItem",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (MenuItem).toString()));
  static final QueryField QUANTITY = QueryField(fieldName: "quantity");
  static final QueryField ORDERID = QueryField(fieldName: "orderID");
  static final QueryField ORDERITEMMENUITEMID = QueryField(fieldName: "orderItemMenuItemId");
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: OrderItem.ITEMOPTIONS,
      isRequired: false,
      ofModelName: (ItemOptions).toString(),
      associatedKey: ItemOptions.ORDERITEMID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasOne(
      key: OrderItem.MENUITEM,
      isRequired: false,
      ofModelName: (MenuItem).toString(),
      associatedKey: MenuItem.ID
    ));
    
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: OrderItem.ORDERITEMMENUITEMID,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
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