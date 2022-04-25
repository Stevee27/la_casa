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
import 'package:amplify_core/amplify_core.dart';
import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the MenuItem type in your schema. */
@immutable
class MenuItem extends Model {
  static const classType = const _MenuItemModelType();
  final String id;
  final String? _name;
  final String? _smallPrice;
  final String? _price;
  final MenuType? _menuType;
  final String? _description;
  final List<MenuItemOption>? _Options;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get name {
    return _name;
  }
  
  String? get smallPrice {
    return _smallPrice;
  }
  
  String? get price {
    return _price;
  }
  
  MenuType? get menuType {
    return _menuType;
  }
  
  String? get description {
    return _description;
  }
  
  List<MenuItemOption>? get Options {
    return _Options;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const MenuItem._internal({required this.id, name, smallPrice, price, menuType, description, Options, createdAt, updatedAt}): _name = name, _smallPrice = smallPrice, _price = price, _menuType = menuType, _description = description, _Options = Options, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory MenuItem({String? id, String? name, String? smallPrice, String? price, MenuType? menuType, String? description, List<MenuItemOption>? Options}) {
    return MenuItem._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      smallPrice: smallPrice,
      price: price,
      menuType: menuType,
      description: description,
      Options: Options != null ? List<MenuItemOption>.unmodifiable(Options) : Options);
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
      _smallPrice == other._smallPrice &&
      _price == other._price &&
      _menuType == other._menuType &&
      _description == other._description &&
      DeepCollectionEquality().equals(_Options, other._Options);
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MenuItem {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("smallPrice=" + "$_smallPrice" + ", ");
    buffer.write("price=" + "$_price" + ", ");
    buffer.write("menuType=" + (_menuType != null ? enumToString(_menuType)! : "null") + ", ");
    buffer.write("description=" + "$_description" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MenuItem copyWith({String? id, String? name, String? smallPrice, String? price, MenuType? menuType, String? description, List<MenuItemOption>? Options}) {
    return MenuItem._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      smallPrice: smallPrice ?? this.smallPrice,
      price: price ?? this.price,
      menuType: menuType ?? this.menuType,
      description: description ?? this.description,
      Options: Options ?? this.Options);
  }
  
  MenuItem.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _smallPrice = json['smallPrice'],
      _price = json['price'],
      _menuType = enumFromString<MenuType>(json['menuType'], MenuType.values),
      _description = json['description'],
      _Options = json['Options'] is List
        ? (json['Options'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => MenuItemOption.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'smallPrice': _smallPrice, 'price': _price, 'menuType': enumToString(_menuType), 'description': _description, 'Options': _Options?.map((MenuItemOption? e) => e?.toJson()).toList(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "menuItem.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField SMALLPRICE = QueryField(fieldName: "smallPrice");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField MENUTYPE = QueryField(fieldName: "menuType");
  static final QueryField DESCRIPTION = QueryField(fieldName: "description");
  static final QueryField OPTIONS = QueryField(
    fieldName: "Options",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (MenuItemOption).toString()));
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
      key: MenuItem.SMALLPRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MenuItem.PRICE,
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: MenuItem.OPTIONS,
      isRequired: false,
      ofModelName: (MenuItemOption).toString(),
      associatedKey: MenuItemOption.MENUITEM
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

class _MenuItemModelType extends ModelType<MenuItem> {
  const _MenuItemModelType();
  
  @override
  MenuItem fromJson(Map<String, dynamic> jsonData) {
    return MenuItem.fromJson(jsonData);
  }
}