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

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the StoreHours type in your schema. */
@immutable
class StoreHours extends Model {
  static const classType = const _StoreHoursModelType();
  final String id;
  final int? _order;
  final String? _dayOfWeek;
  final String? _from;
  final String? _to;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  int? get order {
    return _order;
  }
  
  String? get dayOfWeek {
    return _dayOfWeek;
  }
  
  String? get from {
    return _from;
  }
  
  String? get to {
    return _to;
  }
  
  const StoreHours._internal({required this.id, order, dayOfWeek, from, to}): _order = order, _dayOfWeek = dayOfWeek, _from = from, _to = to;
  
  factory StoreHours({String? id, int? order, String? dayOfWeek, String? from, String? to}) {
    return StoreHours._internal(
      id: id == null ? UUID.getUUID() : id,
      order: order,
      dayOfWeek: dayOfWeek,
      from: from,
      to: to);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is StoreHours &&
      id == other.id &&
      _order == other._order &&
      _dayOfWeek == other._dayOfWeek &&
      _from == other._from &&
      _to == other._to;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("StoreHours {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("order=" + (_order != null ? _order!.toString() : "null") + ", ");
    buffer.write("dayOfWeek=" + "$_dayOfWeek" + ", ");
    buffer.write("from=" + "$_from" + ", ");
    buffer.write("to=" + "$_to");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  StoreHours copyWith({String? id, int? order, String? dayOfWeek, String? from, String? to}) {
    return StoreHours(
      id: id ?? this.id,
      order: order ?? this.order,
      dayOfWeek: dayOfWeek ?? this.dayOfWeek,
      from: from ?? this.from,
      to: to ?? this.to);
  }
  
  StoreHours.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _order = (json['order'] as num?)?.toInt(),
      _dayOfWeek = json['dayOfWeek'],
      _from = json['from'],
      _to = json['to'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'order': _order, 'dayOfWeek': _dayOfWeek, 'from': _from, 'to': _to
  };

  static final QueryField ID = QueryField(fieldName: "storeHours.id");
  static final QueryField ORDER = QueryField(fieldName: "order");
  static final QueryField DAYOFWEEK = QueryField(fieldName: "dayOfWeek");
  static final QueryField FROM = QueryField(fieldName: "from");
  static final QueryField TO = QueryField(fieldName: "to");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "StoreHours";
    modelSchemaDefinition.pluralName = "StoreHours";
    
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
      key: StoreHours.ORDER,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.int)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StoreHours.DAYOFWEEK,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StoreHours.FROM,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: StoreHours.TO,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _StoreHoursModelType extends ModelType<StoreHours> {
  const _StoreHoursModelType();
  
  @override
  StoreHours fromJson(Map<String, dynamic> jsonData) {
    return StoreHours.fromJson(jsonData);
  }
}