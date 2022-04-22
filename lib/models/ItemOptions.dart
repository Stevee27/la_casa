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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the ItemOptions type in your schema. */
@immutable
class ItemOptions extends Model {
  static const classType = const _ItemOptionsModelType();
  final String id;
  final String? _name;
  final String? _menuitemID;
  final OptionType? _untitledfield;
  final String? _orderitemID;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get name {
    return _name;
  }
  
  String get menuitemID {
    try {
      return _menuitemID!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  OptionType? get untitledfield {
    return _untitledfield;
  }
  
  String get orderitemID {
    try {
      return _orderitemID!;
    } catch(e) {
      throw new DataStoreException(
          DataStoreExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            DataStoreExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  const ItemOptions._internal({required this.id, name, required menuitemID, untitledfield, required orderitemID}): _name = name, _menuitemID = menuitemID, _untitledfield = untitledfield, _orderitemID = orderitemID;
  
  factory ItemOptions({String? id, String? name, required String menuitemID, OptionType? untitledfield, required String orderitemID}) {
    return ItemOptions._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      menuitemID: menuitemID,
      untitledfield: untitledfield,
      orderitemID: orderitemID);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is ItemOptions &&
      id == other.id &&
      _name == other._name &&
      _menuitemID == other._menuitemID &&
      _untitledfield == other._untitledfield &&
      _orderitemID == other._orderitemID;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("ItemOptions {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("menuitemID=" + "$_menuitemID" + ", ");
    buffer.write("untitledfield=" + (_untitledfield != null ? enumToString(_untitledfield)! : "null") + ", ");
    buffer.write("orderitemID=" + "$_orderitemID");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  ItemOptions copyWith({String? id, String? name, String? menuitemID, OptionType? untitledfield, String? orderitemID}) {
    return ItemOptions(
      id: id ?? this.id,
      name: name ?? this.name,
      menuitemID: menuitemID ?? this.menuitemID,
      untitledfield: untitledfield ?? this.untitledfield,
      orderitemID: orderitemID ?? this.orderitemID);
  }
  
  ItemOptions.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _menuitemID = json['menuitemID'],
      _untitledfield = enumFromString<OptionType>(json['untitledfield'], OptionType.values),
      _orderitemID = json['orderitemID'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'menuitemID': _menuitemID, 'untitledfield': enumToString(_untitledfield), 'orderitemID': _orderitemID
  };

  static final QueryField ID = QueryField(fieldName: "itemOptions.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField MENUITEMID = QueryField(fieldName: "menuitemID");
  static final QueryField UNTITLEDFIELD = QueryField(fieldName: "untitledfield");
  static final QueryField ORDERITEMID = QueryField(fieldName: "orderitemID");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "ItemOptions";
    modelSchemaDefinition.pluralName = "ItemOptions";
    
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
      key: ItemOptions.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ItemOptions.MENUITEMID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ItemOptions.UNTITLEDFIELD,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: ItemOptions.ORDERITEMID,
      isRequired: true,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _ItemOptionsModelType extends ModelType<ItemOptions> {
  const _ItemOptionsModelType();
  
  @override
  ItemOptions fromJson(Map<String, dynamic> jsonData) {
    return ItemOptions.fromJson(jsonData);
  }
}