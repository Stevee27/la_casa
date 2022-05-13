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
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Option type in your schema. */
@immutable
class Option extends Model {
  static const classType = const _OptionModelType();
  final String id;
  final String? _name;
  final String? _price;
  final MenuType? _menuType;
  final int? _sortOrder;
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
  
  String? get price {
    return _price;
  }
  
  MenuType? get menuType {
    return _menuType;
  }
  
  int? get sortOrder {
    return _sortOrder;
  }
  
  TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const Option._internal({required this.id, name, price, menuType, sortOrder, createdAt, updatedAt}): _name = name, _price = price, _menuType = menuType, _sortOrder = sortOrder, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory Option({String? id, String? name, String? price, MenuType? menuType, int? sortOrder}) {
    return Option._internal(
      id: id == null ? UUID.getUUID() : id,
      name: name,
      price: price,
      menuType: menuType,
      sortOrder: sortOrder);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Option &&
      id == other.id &&
      _name == other._name &&
      _price == other._price &&
      _menuType == other._menuType &&
      _sortOrder == other._sortOrder;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Option {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("name=" + "$_name" + ", ");
    buffer.write("price=" + "$_price" + ", ");
    buffer.write("menuType=" + (_menuType != null ? enumToString(_menuType)! : "null") + ", ");
    buffer.write("sortOrder=" + (_sortOrder != null ? _sortOrder!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Option copyWith({String? id, String? name, String? price, MenuType? menuType, int? sortOrder}) {
    return Option._internal(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      menuType: menuType ?? this.menuType,
      sortOrder: sortOrder ?? this.sortOrder);
  }
  
  Option.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _name = json['name'],
      _price = json['price'],
      _menuType = enumFromString<MenuType>(json['menuType'], MenuType.values),
      _sortOrder = (json['sortOrder'] as num?)?.toInt(),
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'name': _name, 'price': _price, 'menuType': enumToString(_menuType), 'sortOrder': _sortOrder, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "option.id");
  static final QueryField NAME = QueryField(fieldName: "name");
  static final QueryField PRICE = QueryField(fieldName: "price");
  static final QueryField MENUTYPE = QueryField(fieldName: "menuType");
  static final QueryField SORTORDER = QueryField(fieldName: "sortOrder");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Option";
    modelSchemaDefinition.pluralName = "Options";
    
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
      key: Option.NAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Option.PRICE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Option.MENUTYPE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.enumeration)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Option.SORTORDER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
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

class _OptionModelType extends ModelType<Option> {
  const _OptionModelType();
  
  @override
  Option fromJson(Map<String, dynamic> jsonData) {
    return Option.fromJson(jsonData);
  }
}