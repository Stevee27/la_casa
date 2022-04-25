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


/** This is an auto generated class representing the MenuItemOption type in your schema. */
@immutable
class MenuItemOption extends Model {
  static const classType = const _MenuItemOptionModelType();
  final String id;
  final Option? _option;
  final MenuItem? _menuItem;
  final TemporalDateTime? _createdAt;
  final TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  Option get option {
    try {
      return _option!;
    } catch(e) {
      throw new AmplifyCodeGenModelException(
          AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  MenuItem get menuItem {
    try {
      return _menuItem!;
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
  
  const MenuItemOption._internal({required this.id, required option, required menuItem, createdAt, updatedAt}): _option = option, _menuItem = menuItem, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory MenuItemOption({String? id, required Option option, required MenuItem menuItem}) {
    return MenuItemOption._internal(
      id: id == null ? UUID.getUUID() : id,
      option: option,
      menuItem: menuItem);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is MenuItemOption &&
      id == other.id &&
      _option == other._option &&
      _menuItem == other._menuItem;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("MenuItemOption {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("option=" + (_option != null ? _option!.toString() : "null") + ", ");
    buffer.write("menuItem=" + (_menuItem != null ? _menuItem!.toString() : "null") + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  MenuItemOption copyWith({String? id, Option? option, MenuItem? menuItem}) {
    return MenuItemOption._internal(
      id: id ?? this.id,
      option: option ?? this.option,
      menuItem: menuItem ?? this.menuItem);
  }
  
  MenuItemOption.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _option = json['option']?['serializedData'] != null
        ? Option.fromJson(new Map<String, dynamic>.from(json['option']['serializedData']))
        : null,
      _menuItem = json['menuItem']?['serializedData'] != null
        ? MenuItem.fromJson(new Map<String, dynamic>.from(json['menuItem']['serializedData']))
        : null,
      _createdAt = json['createdAt'] != null ? TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'option': _option?.toJson(), 'menuItem': _menuItem?.toJson(), 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };

  static final QueryField ID = QueryField(fieldName: "menuItemOption.id");
  static final QueryField OPTION = QueryField(
    fieldName: "option",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (Option).toString()));
  static final QueryField MENUITEM = QueryField(
    fieldName: "menuItem",
    fieldType: ModelFieldType(ModelFieldTypeEnum.model, ofModelName: (MenuItem).toString()));
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "MenuItemOption";
    modelSchemaDefinition.pluralName = "MenuItemOptions";
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: MenuItemOption.OPTION,
      isRequired: true,
      targetName: "optionID",
      ofModelName: (Option).toString()
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.belongsTo(
      key: MenuItemOption.MENUITEM,
      isRequired: true,
      targetName: "menuItemID",
      ofModelName: (MenuItem).toString()
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

class _MenuItemOptionModelType extends ModelType<MenuItemOption> {
  const _MenuItemOptionModelType();
  
  @override
  MenuItemOption fromJson(Map<String, dynamic> jsonData) {
    return MenuItemOption.fromJson(jsonData);
  }
}