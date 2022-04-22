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


/** This is an auto generated class representing the User type in your schema. */
@immutable
class User extends Model {
  static const classType = const _UserModelType();
  final String id;
  final String? _userName;
  final String? _password;
  final String? _email;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get userName {
    return _userName;
  }
  
  String? get password {
    return _password;
  }
  
  String? get email {
    return _email;
  }
  
  const User._internal({required this.id, userName, password, email}): _userName = userName, _password = password, _email = email;
  
  factory User({String? id, String? userName, String? password, String? email}) {
    return User._internal(
      id: id == null ? UUID.getUUID() : id,
      userName: userName,
      password: password,
      email: email);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is User &&
      id == other.id &&
      _userName == other._userName &&
      _password == other._password &&
      _email == other._email;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("User {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userName=" + "$_userName" + ", ");
    buffer.write("password=" + "$_password" + ", ");
    buffer.write("email=" + "$_email");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  User copyWith({String? id, String? userName, String? password, String? email}) {
    return User(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      password: password ?? this.password,
      email: email ?? this.email);
  }
  
  User.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userName = json['userName'],
      _password = json['password'],
      _email = json['email'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userName': _userName, 'password': _password, 'email': _email
  };

  static final QueryField ID = QueryField(fieldName: "user.id");
  static final QueryField USERNAME = QueryField(fieldName: "userName");
  static final QueryField PASSWORD = QueryField(fieldName: "password");
  static final QueryField EMAIL = QueryField(fieldName: "email");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "User";
    modelSchemaDefinition.pluralName = "Users";
    
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
      key: User.USERNAME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.PASSWORD,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: User.EMAIL,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _UserModelType extends ModelType<User> {
  const _UserModelType();
  
  @override
  User fromJson(Map<String, dynamic> jsonData) {
    return User.fromJson(jsonData);
  }
}