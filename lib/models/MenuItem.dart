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


/** This is an auto generated class representing the MenuItem type in your schema. */
@immutable
class MenuItem extends Model {
  static const classType = const _MenuItemModelType();
  final String id;
  final String? _name;
  final MenuType? _menuType;
  final String? _description;
  final String? _smallPrice;
  final String? _price;
  final List<ItemOptions>? _ItemOptions;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get name {
    return _name;
  }
  
  MenuType? get menuType {
    return _menuType;
  }
  
  String? get description {
    return _description;
  }
  
  String? get smallPrice {
    return _smallPrice;
  }
  
  String? get price {
    return _price;
  }
  
  List<ItemOptions>? get ItemOptions {
    return _ItemOptions;
  }
  
  const MenuItem._internal({required this.id, name, menuType, description, smallPrice, price, ItemOptions}): _name = name, _menuType = menuType, _description = description, _smallPrice = smallPrice, _price = price, _ItemOptions = ItemOptions;
  
  factory MenuItem({String? id, String? name, MenuType? menuType, String? description, String? smallPrice, String? price, List<ItemOptions>? ItemOptions}) {
    return MenuItem._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      menuType: menuType,
      description: description,
      smallPrice: smallPrice,
      price: price,
      ItemOptions: ItemOptions != null ? List<ItemOptions>.unmodifiable(ItemOptions) : ItemOptions);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuItem &&
      id == other.id &&
      _name == other._name &&
      _menuType == other._menuType &&
      _description == other._description &&
      _smallPrice == other._smallPrice &&
      _price == other._price &&
      DeepCollectionEquality().equals(_ItemOptions, other._ItemOptions);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MenuItem {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("menuType=" + (_menuType != null ? enumToString(_menuType)! : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("smallPrice=" + "$_smallPrice" + ", ");
    buffer.write("price=" + "$_price");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MenuItem copyWith({String? id, String? name, MenuType? menuType, String? description, String? smallPrice, String? price, List<ItemOptions>? ItemOptions}) {
    return MenuItem(
      id: id ?? this.id,
      name: name ?? this.name,
      menuType: menuType ?? this.menuType,
      description: description ?? this.description,
      smallPrice: smallPrice ?? this.smallPrice,
      price: price ?? this.price,
      ItemOptions: ItemOptions ?? this.ItemOptions);
  }
  
  MenuItem.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _menuType = enumFromString<MenuType>(json['menuType'], MenuType.values),
      _description = json['description'],
      _smallPrice = json['smallPrice'],
      _price = json['price'],
      _ItemOptions = json['ItemOptions'] is List
        ? (json['ItemOptions'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => ItemOptions.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'menuType': enumToString(_menuType), 'description': _description, 'smallPrice': _smallPrice, 'price': _price, 'ItemOptions': _ItemOptions?.map((ItemOptions? e) => e?.toJson()).toList()
  };

  static final QueryField ID = QueryField(fieldName: "menuItem.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField MENUTYPE = QueryField(fieldName: "menuType");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField SMALLPRICE = QueryField(fieldName: "smallPrice");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField ITEMOPTIONS = QueryField(
    fieldName: "ItemOptions",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (ItemOptions).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MenuItem";
    modelSchemaDefinition.pluralName = "MenuItems";
    
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
      key: MenuItem.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MenuItem.MENUTYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MenuItem.DESCRIPTION,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MenuItem.SMALLPRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MenuItem.PRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: MenuItem.ITEMOPTIONS,
      isRequired: false,
      ofModelName: (ItemOptions).toString(),
      associatedKey: ItemOptions.MENUITEMID
    ));
  });
}

class _MenuItemModelType extends ModelType<MenuItem> {
  const _MenuItemModelType();
  
  @override
  MenuItem fromJson(Map<String, dynamic> jsonData) {
    return MenuItem.fromJson(jsonData);
  }
}