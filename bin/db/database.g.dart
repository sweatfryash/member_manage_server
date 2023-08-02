// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _usernameMeta =
      const VerificationMeta('username');
  @override
  late final GeneratedColumn<String> username = GeneratedColumn<String>(
      'username', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _passwordMeta =
      const VerificationMeta('password');
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
      'password', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, username, password, phone];
  @override
  String get aliasedName => _alias ?? 'users';
  @override
  String get actualTableName => 'users';
  @override
  VerificationContext validateIntegrity(Insertable<User> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('username')) {
      context.handle(_usernameMeta,
          username.isAcceptableOrUnknown(data['username']!, _usernameMeta));
    } else if (isInserting) {
      context.missing(_usernameMeta);
    }
    if (data.containsKey('password')) {
      context.handle(_passwordMeta,
          password.isAcceptableOrUnknown(data['password']!, _passwordMeta));
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      username: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}username'])!,
      password: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}password'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String username;
  final String password;
  final String? phone;
  const User(
      {required this.id,
      required this.username,
      required this.password,
      this.phone});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['username'] = Variable<String>(username);
    map['password'] = Variable<String>(password);
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      username: Value(username),
      password: Value(password),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
    );
  }

  factory User.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      username: serializer.fromJson<String>(json['username']),
      password: serializer.fromJson<String>(json['password']),
      phone: serializer.fromJson<String?>(json['phone']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'username': serializer.toJson<String>(username),
      'password': serializer.toJson<String>(password),
      'phone': serializer.toJson<String?>(phone),
    };
  }

  User copyWith(
          {int? id,
          String? username,
          String? password,
          Value<String?> phone = const Value.absent()}) =>
      User(
        id: id ?? this.id,
        username: username ?? this.username,
        password: password ?? this.password,
        phone: phone.present ? phone.value : this.phone,
      );
  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('phone: $phone')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, username, password, phone);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.username == this.username &&
          other.password == this.password &&
          other.phone == this.phone);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> username;
  final Value<String> password;
  final Value<String?> phone;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.username = const Value.absent(),
    this.password = const Value.absent(),
    this.phone = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String username,
    required String password,
    this.phone = const Value.absent(),
  })  : username = Value(username),
        password = Value(password);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? username,
    Expression<String>? password,
    Expression<String>? phone,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (username != null) 'username': username,
      if (password != null) 'password': password,
      if (phone != null) 'phone': phone,
    });
  }

  UsersCompanion copyWith(
      {Value<int>? id,
      Value<String>? username,
      Value<String>? password,
      Value<String?>? phone}) {
    return UsersCompanion(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      phone: phone ?? this.phone,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (username.present) {
      map['username'] = Variable<String>(username.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('username: $username, ')
          ..write('password: $password, ')
          ..write('phone: $phone')
          ..write(')'))
        .toString();
  }
}

class $MembersTable extends Members with TableInfo<$MembersTable, Member> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MembersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _moneyMeta = const VerificationMeta('money');
  @override
  late final GeneratedColumn<double> money = GeneratedColumn<double>(
      'money', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _discountMeta =
      const VerificationMeta('discount');
  @override
  late final GeneratedColumn<int> discount = GeneratedColumn<int>(
      'discount', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(90));
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<String> createTime = GeneratedColumn<String>(
      'create_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, phone, money, discount, createTime];
  @override
  String get aliasedName => _alias ?? 'members';
  @override
  String get actualTableName => 'members';
  @override
  VerificationContext validateIntegrity(Insertable<Member> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    } else if (isInserting) {
      context.missing(_phoneMeta);
    }
    if (data.containsKey('money')) {
      context.handle(
          _moneyMeta, money.isAcceptableOrUnknown(data['money']!, _moneyMeta));
    }
    if (data.containsKey('discount')) {
      context.handle(_discountMeta,
          discount.isAcceptableOrUnknown(data['discount']!, _discountMeta));
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    } else if (isInserting) {
      context.missing(_createTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Member map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Member(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone'])!,
      money: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}money'])!,
      discount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}discount'])!,
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}create_time'])!,
    );
  }

  @override
  $MembersTable createAlias(String alias) {
    return $MembersTable(attachedDatabase, alias);
  }
}

class Member extends DataClass implements Insertable<Member> {
  final int id;
  final String name;
  final String phone;
  final double money;
  final int discount;
  final String createTime;
  const Member(
      {required this.id,
      required this.name,
      required this.phone,
      required this.money,
      required this.discount,
      required this.createTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['phone'] = Variable<String>(phone);
    map['money'] = Variable<double>(money);
    map['discount'] = Variable<int>(discount);
    map['create_time'] = Variable<String>(createTime);
    return map;
  }

  MembersCompanion toCompanion(bool nullToAbsent) {
    return MembersCompanion(
      id: Value(id),
      name: Value(name),
      phone: Value(phone),
      money: Value(money),
      discount: Value(discount),
      createTime: Value(createTime),
    );
  }

  factory Member.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Member(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      phone: serializer.fromJson<String>(json['phone']),
      money: serializer.fromJson<double>(json['money']),
      discount: serializer.fromJson<int>(json['discount']),
      createTime: serializer.fromJson<String>(json['createTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'phone': serializer.toJson<String>(phone),
      'money': serializer.toJson<double>(money),
      'discount': serializer.toJson<int>(discount),
      'createTime': serializer.toJson<String>(createTime),
    };
  }

  Member copyWith(
          {int? id,
          String? name,
          String? phone,
          double? money,
          int? discount,
          String? createTime}) =>
      Member(
        id: id ?? this.id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        money: money ?? this.money,
        discount: discount ?? this.discount,
        createTime: createTime ?? this.createTime,
      );
  @override
  String toString() {
    return (StringBuffer('Member(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('money: $money, ')
          ..write('discount: $discount, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, phone, money, discount, createTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Member &&
          other.id == this.id &&
          other.name == this.name &&
          other.phone == this.phone &&
          other.money == this.money &&
          other.discount == this.discount &&
          other.createTime == this.createTime);
}

class MembersCompanion extends UpdateCompanion<Member> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> phone;
  final Value<double> money;
  final Value<int> discount;
  final Value<String> createTime;
  const MembersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.phone = const Value.absent(),
    this.money = const Value.absent(),
    this.discount = const Value.absent(),
    this.createTime = const Value.absent(),
  });
  MembersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String phone,
    this.money = const Value.absent(),
    this.discount = const Value.absent(),
    required String createTime,
  })  : name = Value(name),
        phone = Value(phone),
        createTime = Value(createTime);
  static Insertable<Member> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? phone,
    Expression<double>? money,
    Expression<int>? discount,
    Expression<String>? createTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (phone != null) 'phone': phone,
      if (money != null) 'money': money,
      if (discount != null) 'discount': discount,
      if (createTime != null) 'create_time': createTime,
    });
  }

  MembersCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? phone,
      Value<double>? money,
      Value<int>? discount,
      Value<String>? createTime}) {
    return MembersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      money: money ?? this.money,
      discount: discount ?? this.discount,
      createTime: createTime ?? this.createTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (money.present) {
      map['money'] = Variable<double>(money.value);
    }
    if (discount.present) {
      map['discount'] = Variable<int>(discount.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<String>(createTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MembersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('phone: $phone, ')
          ..write('money: $money, ')
          ..write('discount: $discount, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }
}

class $CardsTable extends Cards with TableInfo<$CardsTable, Card> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _memberIdMeta =
      const VerificationMeta('memberId');
  @override
  late final GeneratedColumn<int> memberId = GeneratedColumn<int>(
      'member_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _usedMeta = const VerificationMeta('used');
  @override
  late final GeneratedColumn<int> used = GeneratedColumn<int>(
      'used', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _totalMeta = const VerificationMeta('total');
  @override
  late final GeneratedColumn<int> total = GeneratedColumn<int>(
      'total', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _typeIdMeta = const VerificationMeta('typeId');
  @override
  late final GeneratedColumn<String> typeId = GeneratedColumn<String>(
      'type_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<String> createTime = GeneratedColumn<String>(
      'create_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, memberId, used, total, typeId, createTime];
  @override
  String get aliasedName => _alias ?? 'cards';
  @override
  String get actualTableName => 'cards';
  @override
  VerificationContext validateIntegrity(Insertable<Card> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('member_id')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('used')) {
      context.handle(
          _usedMeta, used.isAcceptableOrUnknown(data['used']!, _usedMeta));
    } else if (isInserting) {
      context.missing(_usedMeta);
    }
    if (data.containsKey('total')) {
      context.handle(
          _totalMeta, total.isAcceptableOrUnknown(data['total']!, _totalMeta));
    } else if (isInserting) {
      context.missing(_totalMeta);
    }
    if (data.containsKey('type_id')) {
      context.handle(_typeIdMeta,
          typeId.isAcceptableOrUnknown(data['type_id']!, _typeIdMeta));
    } else if (isInserting) {
      context.missing(_typeIdMeta);
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    } else if (isInserting) {
      context.missing(_createTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Card map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Card(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      memberId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}member_id'])!,
      used: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}used'])!,
      total: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}total'])!,
      typeId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type_id'])!,
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}create_time'])!,
    );
  }

  @override
  $CardsTable createAlias(String alias) {
    return $CardsTable(attachedDatabase, alias);
  }
}

class Card extends DataClass implements Insertable<Card> {
  final int id;
  final int memberId;
  final int used;
  final int total;
  final String typeId;
  final String createTime;
  const Card(
      {required this.id,
      required this.memberId,
      required this.used,
      required this.total,
      required this.typeId,
      required this.createTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['member_id'] = Variable<int>(memberId);
    map['used'] = Variable<int>(used);
    map['total'] = Variable<int>(total);
    map['type_id'] = Variable<String>(typeId);
    map['create_time'] = Variable<String>(createTime);
    return map;
  }

  CardsCompanion toCompanion(bool nullToAbsent) {
    return CardsCompanion(
      id: Value(id),
      memberId: Value(memberId),
      used: Value(used),
      total: Value(total),
      typeId: Value(typeId),
      createTime: Value(createTime),
    );
  }

  factory Card.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Card(
      id: serializer.fromJson<int>(json['id']),
      memberId: serializer.fromJson<int>(json['memberId']),
      used: serializer.fromJson<int>(json['used']),
      total: serializer.fromJson<int>(json['total']),
      typeId: serializer.fromJson<String>(json['typeId']),
      createTime: serializer.fromJson<String>(json['createTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'memberId': serializer.toJson<int>(memberId),
      'used': serializer.toJson<int>(used),
      'total': serializer.toJson<int>(total),
      'typeId': serializer.toJson<String>(typeId),
      'createTime': serializer.toJson<String>(createTime),
    };
  }

  Card copyWith(
          {int? id,
          int? memberId,
          int? used,
          int? total,
          String? typeId,
          String? createTime}) =>
      Card(
        id: id ?? this.id,
        memberId: memberId ?? this.memberId,
        used: used ?? this.used,
        total: total ?? this.total,
        typeId: typeId ?? this.typeId,
        createTime: createTime ?? this.createTime,
      );
  @override
  String toString() {
    return (StringBuffer('Card(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('used: $used, ')
          ..write('total: $total, ')
          ..write('typeId: $typeId, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, memberId, used, total, typeId, createTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Card &&
          other.id == this.id &&
          other.memberId == this.memberId &&
          other.used == this.used &&
          other.total == this.total &&
          other.typeId == this.typeId &&
          other.createTime == this.createTime);
}

class CardsCompanion extends UpdateCompanion<Card> {
  final Value<int> id;
  final Value<int> memberId;
  final Value<int> used;
  final Value<int> total;
  final Value<String> typeId;
  final Value<String> createTime;
  const CardsCompanion({
    this.id = const Value.absent(),
    this.memberId = const Value.absent(),
    this.used = const Value.absent(),
    this.total = const Value.absent(),
    this.typeId = const Value.absent(),
    this.createTime = const Value.absent(),
  });
  CardsCompanion.insert({
    this.id = const Value.absent(),
    required int memberId,
    required int used,
    required int total,
    required String typeId,
    required String createTime,
  })  : memberId = Value(memberId),
        used = Value(used),
        total = Value(total),
        typeId = Value(typeId),
        createTime = Value(createTime);
  static Insertable<Card> custom({
    Expression<int>? id,
    Expression<int>? memberId,
    Expression<int>? used,
    Expression<int>? total,
    Expression<String>? typeId,
    Expression<String>? createTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (memberId != null) 'member_id': memberId,
      if (used != null) 'used': used,
      if (total != null) 'total': total,
      if (typeId != null) 'type_id': typeId,
      if (createTime != null) 'create_time': createTime,
    });
  }

  CardsCompanion copyWith(
      {Value<int>? id,
      Value<int>? memberId,
      Value<int>? used,
      Value<int>? total,
      Value<String>? typeId,
      Value<String>? createTime}) {
    return CardsCompanion(
      id: id ?? this.id,
      memberId: memberId ?? this.memberId,
      used: used ?? this.used,
      total: total ?? this.total,
      typeId: typeId ?? this.typeId,
      createTime: createTime ?? this.createTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<int>(memberId.value);
    }
    if (used.present) {
      map['used'] = Variable<int>(used.value);
    }
    if (total.present) {
      map['total'] = Variable<int>(total.value);
    }
    if (typeId.present) {
      map['type_id'] = Variable<String>(typeId.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<String>(createTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardsCompanion(')
          ..write('id: $id, ')
          ..write('memberId: $memberId, ')
          ..write('used: $used, ')
          ..write('total: $total, ')
          ..write('typeId: $typeId, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }
}

class $AppOptionsTable extends AppOptions
    with TableInfo<$AppOptionsTable, AppOption> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppOptionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
      'value', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<String> createTime = GeneratedColumn<String>(
      'create_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, name, value, type, createTime];
  @override
  String get aliasedName => _alias ?? 'app_options';
  @override
  String get actualTableName => 'app_options';
  @override
  VerificationContext validateIntegrity(Insertable<AppOption> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    } else if (isInserting) {
      context.missing(_createTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AppOption map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppOption(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}value'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}create_time'])!,
    );
  }

  @override
  $AppOptionsTable createAlias(String alias) {
    return $AppOptionsTable(attachedDatabase, alias);
  }
}

class AppOption extends DataClass implements Insertable<AppOption> {
  final int id;
  final String name;
  final String value;
  final String type;
  final String createTime;
  const AppOption(
      {required this.id,
      required this.name,
      required this.value,
      required this.type,
      required this.createTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['value'] = Variable<String>(value);
    map['type'] = Variable<String>(type);
    map['create_time'] = Variable<String>(createTime);
    return map;
  }

  AppOptionsCompanion toCompanion(bool nullToAbsent) {
    return AppOptionsCompanion(
      id: Value(id),
      name: Value(name),
      value: Value(value),
      type: Value(type),
      createTime: Value(createTime),
    );
  }

  factory AppOption.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppOption(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      value: serializer.fromJson<String>(json['value']),
      type: serializer.fromJson<String>(json['type']),
      createTime: serializer.fromJson<String>(json['createTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'value': serializer.toJson<String>(value),
      'type': serializer.toJson<String>(type),
      'createTime': serializer.toJson<String>(createTime),
    };
  }

  AppOption copyWith(
          {int? id,
          String? name,
          String? value,
          String? type,
          String? createTime}) =>
      AppOption(
        id: id ?? this.id,
        name: name ?? this.name,
        value: value ?? this.value,
        type: type ?? this.type,
        createTime: createTime ?? this.createTime,
      );
  @override
  String toString() {
    return (StringBuffer('AppOption(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value: $value, ')
          ..write('type: $type, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, value, type, createTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppOption &&
          other.id == this.id &&
          other.name == this.name &&
          other.value == this.value &&
          other.type == this.type &&
          other.createTime == this.createTime);
}

class AppOptionsCompanion extends UpdateCompanion<AppOption> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> value;
  final Value<String> type;
  final Value<String> createTime;
  const AppOptionsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.value = const Value.absent(),
    this.type = const Value.absent(),
    this.createTime = const Value.absent(),
  });
  AppOptionsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String value,
    required String type,
    required String createTime,
  })  : name = Value(name),
        value = Value(value),
        type = Value(type),
        createTime = Value(createTime);
  static Insertable<AppOption> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? value,
    Expression<String>? type,
    Expression<String>? createTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (value != null) 'value': value,
      if (type != null) 'type': type,
      if (createTime != null) 'create_time': createTime,
    });
  }

  AppOptionsCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<String>? value,
      Value<String>? type,
      Value<String>? createTime}) {
    return AppOptionsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
      type: type ?? this.type,
      createTime: createTime ?? this.createTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<String>(createTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppOptionsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value: $value, ')
          ..write('type: $type, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }
}

class $CashRecordsTable extends CashRecords
    with TableInfo<$CashRecordsTable, CashRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CashRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _expenseMeta =
      const VerificationMeta('expense');
  @override
  late final GeneratedColumn<double> expense = GeneratedColumn<double>(
      'expense', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<String> createTime = GeneratedColumn<String>(
      'create_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, expense, notes, createTime];
  @override
  String get aliasedName => _alias ?? 'cash_records';
  @override
  String get actualTableName => 'cash_records';
  @override
  VerificationContext validateIntegrity(Insertable<CashRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('expense')) {
      context.handle(_expenseMeta,
          expense.isAcceptableOrUnknown(data['expense']!, _expenseMeta));
    } else if (isInserting) {
      context.missing(_expenseMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    } else if (isInserting) {
      context.missing(_createTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CashRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CashRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      expense: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}expense'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}create_time'])!,
    );
  }

  @override
  $CashRecordsTable createAlias(String alias) {
    return $CashRecordsTable(attachedDatabase, alias);
  }
}

class CashRecord extends DataClass implements Insertable<CashRecord> {
  final int id;
  final int userId;
  final double expense;
  final String? notes;
  final String createTime;
  const CashRecord(
      {required this.id,
      required this.userId,
      required this.expense,
      this.notes,
      required this.createTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['expense'] = Variable<double>(expense);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['create_time'] = Variable<String>(createTime);
    return map;
  }

  CashRecordsCompanion toCompanion(bool nullToAbsent) {
    return CashRecordsCompanion(
      id: Value(id),
      userId: Value(userId),
      expense: Value(expense),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createTime: Value(createTime),
    );
  }

  factory CashRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CashRecord(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      expense: serializer.fromJson<double>(json['expense']),
      notes: serializer.fromJson<String?>(json['notes']),
      createTime: serializer.fromJson<String>(json['createTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'expense': serializer.toJson<double>(expense),
      'notes': serializer.toJson<String?>(notes),
      'createTime': serializer.toJson<String>(createTime),
    };
  }

  CashRecord copyWith(
          {int? id,
          int? userId,
          double? expense,
          Value<String?> notes = const Value.absent(),
          String? createTime}) =>
      CashRecord(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        expense: expense ?? this.expense,
        notes: notes.present ? notes.value : this.notes,
        createTime: createTime ?? this.createTime,
      );
  @override
  String toString() {
    return (StringBuffer('CashRecord(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('expense: $expense, ')
          ..write('notes: $notes, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, expense, notes, createTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CashRecord &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.expense == this.expense &&
          other.notes == this.notes &&
          other.createTime == this.createTime);
}

class CashRecordsCompanion extends UpdateCompanion<CashRecord> {
  final Value<int> id;
  final Value<int> userId;
  final Value<double> expense;
  final Value<String?> notes;
  final Value<String> createTime;
  const CashRecordsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.expense = const Value.absent(),
    this.notes = const Value.absent(),
    this.createTime = const Value.absent(),
  });
  CashRecordsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required double expense,
    this.notes = const Value.absent(),
    required String createTime,
  })  : userId = Value(userId),
        expense = Value(expense),
        createTime = Value(createTime);
  static Insertable<CashRecord> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<double>? expense,
    Expression<String>? notes,
    Expression<String>? createTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (expense != null) 'expense': expense,
      if (notes != null) 'notes': notes,
      if (createTime != null) 'create_time': createTime,
    });
  }

  CashRecordsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<double>? expense,
      Value<String?>? notes,
      Value<String>? createTime}) {
    return CashRecordsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      expense: expense ?? this.expense,
      notes: notes ?? this.notes,
      createTime: createTime ?? this.createTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (expense.present) {
      map['expense'] = Variable<double>(expense.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<String>(createTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CashRecordsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('expense: $expense, ')
          ..write('notes: $notes, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }
}

class $MemberRecordsTable extends MemberRecords
    with TableInfo<$MemberRecordsTable, MemberRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MemberRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _memberIdMeta =
      const VerificationMeta('memberId');
  @override
  late final GeneratedColumn<int> memberId = GeneratedColumn<int>(
      'member_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _expenseMeta =
      const VerificationMeta('expense');
  @override
  late final GeneratedColumn<double> expense = GeneratedColumn<double>(
      'expense', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _preMoneyMeta =
      const VerificationMeta('preMoney');
  @override
  late final GeneratedColumn<double> preMoney = GeneratedColumn<double>(
      'pre_money', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _afterMoneyMeta =
      const VerificationMeta('afterMoney');
  @override
  late final GeneratedColumn<double> afterMoney = GeneratedColumn<double>(
      'after_money', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<String> createTime = GeneratedColumn<String>(
      'create_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, memberId, expense, preMoney, afterMoney, notes, createTime];
  @override
  String get aliasedName => _alias ?? 'member_records';
  @override
  String get actualTableName => 'member_records';
  @override
  VerificationContext validateIntegrity(Insertable<MemberRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('member_id')) {
      context.handle(_memberIdMeta,
          memberId.isAcceptableOrUnknown(data['member_id']!, _memberIdMeta));
    } else if (isInserting) {
      context.missing(_memberIdMeta);
    }
    if (data.containsKey('expense')) {
      context.handle(_expenseMeta,
          expense.isAcceptableOrUnknown(data['expense']!, _expenseMeta));
    } else if (isInserting) {
      context.missing(_expenseMeta);
    }
    if (data.containsKey('pre_money')) {
      context.handle(_preMoneyMeta,
          preMoney.isAcceptableOrUnknown(data['pre_money']!, _preMoneyMeta));
    } else if (isInserting) {
      context.missing(_preMoneyMeta);
    }
    if (data.containsKey('after_money')) {
      context.handle(
          _afterMoneyMeta,
          afterMoney.isAcceptableOrUnknown(
              data['after_money']!, _afterMoneyMeta));
    } else if (isInserting) {
      context.missing(_afterMoneyMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    } else if (isInserting) {
      context.missing(_createTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MemberRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MemberRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      memberId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}member_id'])!,
      expense: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}expense'])!,
      preMoney: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}pre_money'])!,
      afterMoney: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}after_money'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}create_time'])!,
    );
  }

  @override
  $MemberRecordsTable createAlias(String alias) {
    return $MemberRecordsTable(attachedDatabase, alias);
  }
}

class MemberRecord extends DataClass implements Insertable<MemberRecord> {
  final int id;
  final int userId;
  final int memberId;
  final double expense;
  final double preMoney;
  final double afterMoney;
  final String? notes;
  final String createTime;
  const MemberRecord(
      {required this.id,
      required this.userId,
      required this.memberId,
      required this.expense,
      required this.preMoney,
      required this.afterMoney,
      this.notes,
      required this.createTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['member_id'] = Variable<int>(memberId);
    map['expense'] = Variable<double>(expense);
    map['pre_money'] = Variable<double>(preMoney);
    map['after_money'] = Variable<double>(afterMoney);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['create_time'] = Variable<String>(createTime);
    return map;
  }

  MemberRecordsCompanion toCompanion(bool nullToAbsent) {
    return MemberRecordsCompanion(
      id: Value(id),
      userId: Value(userId),
      memberId: Value(memberId),
      expense: Value(expense),
      preMoney: Value(preMoney),
      afterMoney: Value(afterMoney),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createTime: Value(createTime),
    );
  }

  factory MemberRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MemberRecord(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      memberId: serializer.fromJson<int>(json['memberId']),
      expense: serializer.fromJson<double>(json['expense']),
      preMoney: serializer.fromJson<double>(json['preMoney']),
      afterMoney: serializer.fromJson<double>(json['afterMoney']),
      notes: serializer.fromJson<String?>(json['notes']),
      createTime: serializer.fromJson<String>(json['createTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'memberId': serializer.toJson<int>(memberId),
      'expense': serializer.toJson<double>(expense),
      'preMoney': serializer.toJson<double>(preMoney),
      'afterMoney': serializer.toJson<double>(afterMoney),
      'notes': serializer.toJson<String?>(notes),
      'createTime': serializer.toJson<String>(createTime),
    };
  }

  MemberRecord copyWith(
          {int? id,
          int? userId,
          int? memberId,
          double? expense,
          double? preMoney,
          double? afterMoney,
          Value<String?> notes = const Value.absent(),
          String? createTime}) =>
      MemberRecord(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        memberId: memberId ?? this.memberId,
        expense: expense ?? this.expense,
        preMoney: preMoney ?? this.preMoney,
        afterMoney: afterMoney ?? this.afterMoney,
        notes: notes.present ? notes.value : this.notes,
        createTime: createTime ?? this.createTime,
      );
  @override
  String toString() {
    return (StringBuffer('MemberRecord(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('memberId: $memberId, ')
          ..write('expense: $expense, ')
          ..write('preMoney: $preMoney, ')
          ..write('afterMoney: $afterMoney, ')
          ..write('notes: $notes, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, userId, memberId, expense, preMoney, afterMoney, notes, createTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MemberRecord &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.memberId == this.memberId &&
          other.expense == this.expense &&
          other.preMoney == this.preMoney &&
          other.afterMoney == this.afterMoney &&
          other.notes == this.notes &&
          other.createTime == this.createTime);
}

class MemberRecordsCompanion extends UpdateCompanion<MemberRecord> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> memberId;
  final Value<double> expense;
  final Value<double> preMoney;
  final Value<double> afterMoney;
  final Value<String?> notes;
  final Value<String> createTime;
  const MemberRecordsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.memberId = const Value.absent(),
    this.expense = const Value.absent(),
    this.preMoney = const Value.absent(),
    this.afterMoney = const Value.absent(),
    this.notes = const Value.absent(),
    this.createTime = const Value.absent(),
  });
  MemberRecordsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int memberId,
    required double expense,
    required double preMoney,
    required double afterMoney,
    this.notes = const Value.absent(),
    required String createTime,
  })  : userId = Value(userId),
        memberId = Value(memberId),
        expense = Value(expense),
        preMoney = Value(preMoney),
        afterMoney = Value(afterMoney),
        createTime = Value(createTime);
  static Insertable<MemberRecord> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? memberId,
    Expression<double>? expense,
    Expression<double>? preMoney,
    Expression<double>? afterMoney,
    Expression<String>? notes,
    Expression<String>? createTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (memberId != null) 'member_id': memberId,
      if (expense != null) 'expense': expense,
      if (preMoney != null) 'pre_money': preMoney,
      if (afterMoney != null) 'after_money': afterMoney,
      if (notes != null) 'notes': notes,
      if (createTime != null) 'create_time': createTime,
    });
  }

  MemberRecordsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int>? memberId,
      Value<double>? expense,
      Value<double>? preMoney,
      Value<double>? afterMoney,
      Value<String?>? notes,
      Value<String>? createTime}) {
    return MemberRecordsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      memberId: memberId ?? this.memberId,
      expense: expense ?? this.expense,
      preMoney: preMoney ?? this.preMoney,
      afterMoney: afterMoney ?? this.afterMoney,
      notes: notes ?? this.notes,
      createTime: createTime ?? this.createTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (memberId.present) {
      map['member_id'] = Variable<int>(memberId.value);
    }
    if (expense.present) {
      map['expense'] = Variable<double>(expense.value);
    }
    if (preMoney.present) {
      map['pre_money'] = Variable<double>(preMoney.value);
    }
    if (afterMoney.present) {
      map['after_money'] = Variable<double>(afterMoney.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<String>(createTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MemberRecordsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('memberId: $memberId, ')
          ..write('expense: $expense, ')
          ..write('preMoney: $preMoney, ')
          ..write('afterMoney: $afterMoney, ')
          ..write('notes: $notes, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }
}

class $CardRecordsTable extends CardRecords
    with TableInfo<$CardRecordsTable, CardRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CardRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
      'user_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _cardIdMeta = const VerificationMeta('cardId');
  @override
  late final GeneratedColumn<int> cardId = GeneratedColumn<int>(
      'card_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _preTimesMeta =
      const VerificationMeta('preTimes');
  @override
  late final GeneratedColumn<int> preTimes = GeneratedColumn<int>(
      'pre_times', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createTimeMeta =
      const VerificationMeta('createTime');
  @override
  late final GeneratedColumn<String> createTime = GeneratedColumn<String>(
      'create_time', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, userId, cardId, preTimes, notes, createTime];
  @override
  String get aliasedName => _alias ?? 'card_records';
  @override
  String get actualTableName => 'card_records';
  @override
  VerificationContext validateIntegrity(Insertable<CardRecord> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(_userIdMeta,
          userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta));
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('card_id')) {
      context.handle(_cardIdMeta,
          cardId.isAcceptableOrUnknown(data['card_id']!, _cardIdMeta));
    } else if (isInserting) {
      context.missing(_cardIdMeta);
    }
    if (data.containsKey('pre_times')) {
      context.handle(_preTimesMeta,
          preTimes.isAcceptableOrUnknown(data['pre_times']!, _preTimesMeta));
    } else if (isInserting) {
      context.missing(_preTimesMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('create_time')) {
      context.handle(
          _createTimeMeta,
          createTime.isAcceptableOrUnknown(
              data['create_time']!, _createTimeMeta));
    } else if (isInserting) {
      context.missing(_createTimeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CardRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CardRecord(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      userId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}user_id'])!,
      cardId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}card_id'])!,
      preTimes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}pre_times'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      createTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}create_time'])!,
    );
  }

  @override
  $CardRecordsTable createAlias(String alias) {
    return $CardRecordsTable(attachedDatabase, alias);
  }
}

class CardRecord extends DataClass implements Insertable<CardRecord> {
  final int id;
  final int userId;
  final int cardId;
  final int preTimes;
  final String? notes;
  final String createTime;
  const CardRecord(
      {required this.id,
      required this.userId,
      required this.cardId,
      required this.preTimes,
      this.notes,
      required this.createTime});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['card_id'] = Variable<int>(cardId);
    map['pre_times'] = Variable<int>(preTimes);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['create_time'] = Variable<String>(createTime);
    return map;
  }

  CardRecordsCompanion toCompanion(bool nullToAbsent) {
    return CardRecordsCompanion(
      id: Value(id),
      userId: Value(userId),
      cardId: Value(cardId),
      preTimes: Value(preTimes),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      createTime: Value(createTime),
    );
  }

  factory CardRecord.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CardRecord(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      cardId: serializer.fromJson<int>(json['cardId']),
      preTimes: serializer.fromJson<int>(json['preTimes']),
      notes: serializer.fromJson<String?>(json['notes']),
      createTime: serializer.fromJson<String>(json['createTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'cardId': serializer.toJson<int>(cardId),
      'preTimes': serializer.toJson<int>(preTimes),
      'notes': serializer.toJson<String?>(notes),
      'createTime': serializer.toJson<String>(createTime),
    };
  }

  CardRecord copyWith(
          {int? id,
          int? userId,
          int? cardId,
          int? preTimes,
          Value<String?> notes = const Value.absent(),
          String? createTime}) =>
      CardRecord(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        cardId: cardId ?? this.cardId,
        preTimes: preTimes ?? this.preTimes,
        notes: notes.present ? notes.value : this.notes,
        createTime: createTime ?? this.createTime,
      );
  @override
  String toString() {
    return (StringBuffer('CardRecord(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('cardId: $cardId, ')
          ..write('preTimes: $preTimes, ')
          ..write('notes: $notes, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, userId, cardId, preTimes, notes, createTime);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CardRecord &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.cardId == this.cardId &&
          other.preTimes == this.preTimes &&
          other.notes == this.notes &&
          other.createTime == this.createTime);
}

class CardRecordsCompanion extends UpdateCompanion<CardRecord> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> cardId;
  final Value<int> preTimes;
  final Value<String?> notes;
  final Value<String> createTime;
  const CardRecordsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.cardId = const Value.absent(),
    this.preTimes = const Value.absent(),
    this.notes = const Value.absent(),
    this.createTime = const Value.absent(),
  });
  CardRecordsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int cardId,
    required int preTimes,
    this.notes = const Value.absent(),
    required String createTime,
  })  : userId = Value(userId),
        cardId = Value(cardId),
        preTimes = Value(preTimes),
        createTime = Value(createTime);
  static Insertable<CardRecord> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? cardId,
    Expression<int>? preTimes,
    Expression<String>? notes,
    Expression<String>? createTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (cardId != null) 'card_id': cardId,
      if (preTimes != null) 'pre_times': preTimes,
      if (notes != null) 'notes': notes,
      if (createTime != null) 'create_time': createTime,
    });
  }

  CardRecordsCompanion copyWith(
      {Value<int>? id,
      Value<int>? userId,
      Value<int>? cardId,
      Value<int>? preTimes,
      Value<String?>? notes,
      Value<String>? createTime}) {
    return CardRecordsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      cardId: cardId ?? this.cardId,
      preTimes: preTimes ?? this.preTimes,
      notes: notes ?? this.notes,
      createTime: createTime ?? this.createTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (cardId.present) {
      map['card_id'] = Variable<int>(cardId.value);
    }
    if (preTimes.present) {
      map['pre_times'] = Variable<int>(preTimes.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (createTime.present) {
      map['create_time'] = Variable<String>(createTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CardRecordsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('cardId: $cardId, ')
          ..write('preTimes: $preTimes, ')
          ..write('notes: $notes, ')
          ..write('createTime: $createTime')
          ..write(')'))
        .toString();
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final $UsersTable users = $UsersTable(this);
  late final $MembersTable members = $MembersTable(this);
  late final $CardsTable cards = $CardsTable(this);
  late final $AppOptionsTable appOptions = $AppOptionsTable(this);
  late final $CashRecordsTable cashRecords = $CashRecordsTable(this);
  late final $MemberRecordsTable memberRecords = $MemberRecordsTable(this);
  late final $CardRecordsTable cardRecords = $CardRecordsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        users,
        members,
        cards,
        appOptions,
        cashRecords,
        memberRecords,
        cardRecords
      ];
}
