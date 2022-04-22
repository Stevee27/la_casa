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
  final List<Option>? _Options;
  final MenuType? _menuTy;
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
  
  List<Option>? get Options {
    return _Options;
  }
  
  MenuType? get menuTy {
    return _menuTy;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const MenuItem._internal({required this.id, name, smallPrice, price, Options, menuTy, createdAt, updatedAt}): _name = name, _smallPrice = smallPrice, _price = price, _Options = Options, _menuTy = menuTy, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory MenuItem({String? id, String? name, String? smallPrice, String? price, List<Option>? Options, MenuType? menuTy}) {
    return MenuItem._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      smallPrice: smallPrice,
      price: price,
      Options: Options != null ? List<Option>.unmodifiable(Options) : Options,
      menuTy: menuTy);
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
      DeepCollectionEquality().equals(_Options, other._Options) &&
      _menuTy == other._menuTy;
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
    buffer.write("menuTy=" + (_menuTy != null ? enumToString(_menuTy)! : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MenuItem copyWith({String? id, String? name, String? smallPrice, String? price, List<Option>? Options, MenuType? menuTy}) {
    return MenuItem._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      smallPrice: smallPrice ?? this.smallPrice,
      price: price ?? this.price,
      Options: Options ?? this.Options,
      menuTy: menuTy ?? this.menuTy);
  }
  
  MenuItem.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _smallPrice = json['smallPrice'],
      _price = json['price'],
      _Options = json['Options'] is List
        ? (json['Options'] as List)
          .where((e) => e?['serializedData'] != null)
          .map((e) => Option.fromJson(new Map<String, dynamic>.from(e['serializedData'])))
          .toList()
        : null,
      _menuTy = enumFromString<MenuType>(json['menuTy'], MenuType.values),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'smallPrice': _smallPrice, 'price': _price, 'Options': _Options?.map((Option? e) => e?.toJson()).toList(), 'menuTy': enumToString(_menuTy), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "menuItem.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField SMALLPRICE = QueryField(fieldName: "smallPrice");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField OPTIONS = QueryField(
    fieldName: "Options",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Option).toString()));
  static final QueryField MENUTY = QueryField(fieldName: "menuTy");
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
    
    modelSchemaDefinition.addField(ModelFieldDefinition.hasMany(
      key: MenuItem.OPTIONS,
      isRequired: false,
      ofModelName: (Option).toString(),
      associatedKey: Option.MENUITEMID
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: MenuItem.MENUTY,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
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