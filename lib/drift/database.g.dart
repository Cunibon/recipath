// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $RecipeTableTable extends RecipeTable
    with TableInfo<$RecipeTableTable, RecipeTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageNameMeta = const VerificationMeta(
    'imageName',
  );
  @override
  late final GeneratedColumn<String> imageName = GeneratedColumn<String>(
    'image_name',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, imageName];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('image_name')) {
      context.handle(
        _imageNameMeta,
        imageName.isAcceptableOrUnknown(data['image_name']!, _imageNameMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      imageName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_name'],
      ),
    );
  }

  @override
  $RecipeTableTable createAlias(String alias) {
    return $RecipeTableTable(attachedDatabase, alias);
  }
}

class RecipeTableData extends DataClass implements Insertable<RecipeTableData> {
  final String id;
  final String title;
  final String? imageName;
  const RecipeTableData({
    required this.id,
    required this.title,
    this.imageName,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || imageName != null) {
      map['image_name'] = Variable<String>(imageName);
    }
    return map;
  }

  RecipeTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeTableCompanion(
      id: Value(id),
      title: Value(title),
      imageName: imageName == null && nullToAbsent
          ? const Value.absent()
          : Value(imageName),
    );
  }

  factory RecipeTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      imageName: serializer.fromJson<String?>(json['imageName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'imageName': serializer.toJson<String?>(imageName),
    };
  }

  RecipeTableData copyWith({
    String? id,
    String? title,
    Value<String?> imageName = const Value.absent(),
  }) => RecipeTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    imageName: imageName.present ? imageName.value : this.imageName,
  );
  RecipeTableData copyWithCompanion(RecipeTableCompanion data) {
    return RecipeTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      imageName: data.imageName.present ? data.imageName.value : this.imageName,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('imageName: $imageName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, imageName);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.imageName == this.imageName);
}

class RecipeTableCompanion extends UpdateCompanion<RecipeTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String?> imageName;
  final Value<int> rowid;
  const RecipeTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.imageName = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeTableCompanion.insert({
    required String id,
    required String title,
    this.imageName = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title);
  static Insertable<RecipeTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? imageName,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (imageName != null) 'image_name': imageName,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String?>? imageName,
    Value<int>? rowid,
  }) {
    return RecipeTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      imageName: imageName ?? this.imageName,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (imageName.present) {
      map['image_name'] = Variable<String>(imageName.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('imageName: $imageName, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipeStepTableTable extends RecipeStepTable
    with TableInfo<$RecipeStepTableTable, RecipeStepTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeStepTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
    'index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _recipeIdMeta = const VerificationMeta(
    'recipeId',
  );
  @override
  late final GeneratedColumn<String> recipeId = GeneratedColumn<String>(
    'recipe_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipe_table (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, description, index, recipeId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_step_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeStepTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('index')) {
      context.handle(
        _indexMeta,
        index.isAcceptableOrUnknown(data['index']!, _indexMeta),
      );
    } else if (isInserting) {
      context.missing(_indexMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeStepTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeStepTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      index: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}index'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_id'],
      )!,
    );
  }

  @override
  $RecipeStepTableTable createAlias(String alias) {
    return $RecipeStepTableTable(attachedDatabase, alias);
  }
}

class RecipeStepTableData extends DataClass
    implements Insertable<RecipeStepTableData> {
  final String id;
  final String description;
  final int index;
  final String recipeId;
  const RecipeStepTableData({
    required this.id,
    required this.description,
    required this.index,
    required this.recipeId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['description'] = Variable<String>(description);
    map['index'] = Variable<int>(index);
    map['recipe_id'] = Variable<String>(recipeId);
    return map;
  }

  RecipeStepTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeStepTableCompanion(
      id: Value(id),
      description: Value(description),
      index: Value(index),
      recipeId: Value(recipeId),
    );
  }

  factory RecipeStepTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeStepTableData(
      id: serializer.fromJson<String>(json['id']),
      description: serializer.fromJson<String>(json['description']),
      index: serializer.fromJson<int>(json['index']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'description': serializer.toJson<String>(description),
      'index': serializer.toJson<int>(index),
      'recipeId': serializer.toJson<String>(recipeId),
    };
  }

  RecipeStepTableData copyWith({
    String? id,
    String? description,
    int? index,
    String? recipeId,
  }) => RecipeStepTableData(
    id: id ?? this.id,
    description: description ?? this.description,
    index: index ?? this.index,
    recipeId: recipeId ?? this.recipeId,
  );
  RecipeStepTableData copyWithCompanion(RecipeStepTableCompanion data) {
    return RecipeStepTableData(
      id: data.id.present ? data.id.value : this.id,
      description: data.description.present
          ? data.description.value
          : this.description,
      index: data.index.present ? data.index.value : this.index,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeStepTableData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('index: $index, ')
          ..write('recipeId: $recipeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, index, recipeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeStepTableData &&
          other.id == this.id &&
          other.description == this.description &&
          other.index == this.index &&
          other.recipeId == this.recipeId);
}

class RecipeStepTableCompanion extends UpdateCompanion<RecipeStepTableData> {
  final Value<String> id;
  final Value<String> description;
  final Value<int> index;
  final Value<String> recipeId;
  final Value<int> rowid;
  const RecipeStepTableCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.index = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeStepTableCompanion.insert({
    required String id,
    required String description,
    required int index,
    required String recipeId,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       description = Value(description),
       index = Value(index),
       recipeId = Value(recipeId);
  static Insertable<RecipeStepTableData> custom({
    Expression<String>? id,
    Expression<String>? description,
    Expression<int>? index,
    Expression<String>? recipeId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (index != null) 'index': index,
      if (recipeId != null) 'recipe_id': recipeId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeStepTableCompanion copyWith({
    Value<String>? id,
    Value<String>? description,
    Value<int>? index,
    Value<String>? recipeId,
    Value<int>? rowid,
  }) {
    return RecipeStepTableCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      index: index ?? this.index,
      recipeId: recipeId ?? this.recipeId,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeStepTableCompanion(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('index: $index, ')
          ..write('recipeId: $recipeId, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $GroceryTableTable extends GroceryTable
    with TableInfo<$GroceryTableTable, GroceryTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GroceryTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _normalAmountMeta = const VerificationMeta(
    'normalAmount',
  );
  @override
  late final GeneratedColumn<double> normalAmount = GeneratedColumn<double>(
    'normal_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conversionAmountMeta = const VerificationMeta(
    'conversionAmount',
  );
  @override
  late final GeneratedColumn<double> conversionAmount = GeneratedColumn<double>(
    'conversion_amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _conversionUnitMeta = const VerificationMeta(
    'conversionUnit',
  );
  @override
  late final GeneratedColumn<String> conversionUnit = GeneratedColumn<String>(
    'conversion_unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    normalAmount,
    unit,
    conversionAmount,
    conversionUnit,
    name,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'grocery_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<GroceryTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('normal_amount')) {
      context.handle(
        _normalAmountMeta,
        normalAmount.isAcceptableOrUnknown(
          data['normal_amount']!,
          _normalAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_normalAmountMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('conversion_amount')) {
      context.handle(
        _conversionAmountMeta,
        conversionAmount.isAcceptableOrUnknown(
          data['conversion_amount']!,
          _conversionAmountMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conversionAmountMeta);
    }
    if (data.containsKey('conversion_unit')) {
      context.handle(
        _conversionUnitMeta,
        conversionUnit.isAcceptableOrUnknown(
          data['conversion_unit']!,
          _conversionUnitMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_conversionUnitMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  GroceryTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return GroceryTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      normalAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}normal_amount'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      conversionAmount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}conversion_amount'],
      )!,
      conversionUnit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}conversion_unit'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
    );
  }

  @override
  $GroceryTableTable createAlias(String alias) {
    return $GroceryTableTable(attachedDatabase, alias);
  }
}

class GroceryTableData extends DataClass
    implements Insertable<GroceryTableData> {
  final String id;
  final double normalAmount;
  final String unit;
  final double conversionAmount;
  final String conversionUnit;
  final String name;
  const GroceryTableData({
    required this.id,
    required this.normalAmount,
    required this.unit,
    required this.conversionAmount,
    required this.conversionUnit,
    required this.name,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['normal_amount'] = Variable<double>(normalAmount);
    map['unit'] = Variable<String>(unit);
    map['conversion_amount'] = Variable<double>(conversionAmount);
    map['conversion_unit'] = Variable<String>(conversionUnit);
    map['name'] = Variable<String>(name);
    return map;
  }

  GroceryTableCompanion toCompanion(bool nullToAbsent) {
    return GroceryTableCompanion(
      id: Value(id),
      normalAmount: Value(normalAmount),
      unit: Value(unit),
      conversionAmount: Value(conversionAmount),
      conversionUnit: Value(conversionUnit),
      name: Value(name),
    );
  }

  factory GroceryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroceryTableData(
      id: serializer.fromJson<String>(json['id']),
      normalAmount: serializer.fromJson<double>(json['normalAmount']),
      unit: serializer.fromJson<String>(json['unit']),
      conversionAmount: serializer.fromJson<double>(json['conversionAmount']),
      conversionUnit: serializer.fromJson<String>(json['conversionUnit']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'normalAmount': serializer.toJson<double>(normalAmount),
      'unit': serializer.toJson<String>(unit),
      'conversionAmount': serializer.toJson<double>(conversionAmount),
      'conversionUnit': serializer.toJson<String>(conversionUnit),
      'name': serializer.toJson<String>(name),
    };
  }

  GroceryTableData copyWith({
    String? id,
    double? normalAmount,
    String? unit,
    double? conversionAmount,
    String? conversionUnit,
    String? name,
  }) => GroceryTableData(
    id: id ?? this.id,
    normalAmount: normalAmount ?? this.normalAmount,
    unit: unit ?? this.unit,
    conversionAmount: conversionAmount ?? this.conversionAmount,
    conversionUnit: conversionUnit ?? this.conversionUnit,
    name: name ?? this.name,
  );
  GroceryTableData copyWithCompanion(GroceryTableCompanion data) {
    return GroceryTableData(
      id: data.id.present ? data.id.value : this.id,
      normalAmount: data.normalAmount.present
          ? data.normalAmount.value
          : this.normalAmount,
      unit: data.unit.present ? data.unit.value : this.unit,
      conversionAmount: data.conversionAmount.present
          ? data.conversionAmount.value
          : this.conversionAmount,
      conversionUnit: data.conversionUnit.present
          ? data.conversionUnit.value
          : this.conversionUnit,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroceryTableData(')
          ..write('id: $id, ')
          ..write('normalAmount: $normalAmount, ')
          ..write('unit: $unit, ')
          ..write('conversionAmount: $conversionAmount, ')
          ..write('conversionUnit: $conversionUnit, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    normalAmount,
    unit,
    conversionAmount,
    conversionUnit,
    name,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroceryTableData &&
          other.id == this.id &&
          other.normalAmount == this.normalAmount &&
          other.unit == this.unit &&
          other.conversionAmount == this.conversionAmount &&
          other.conversionUnit == this.conversionUnit &&
          other.name == this.name);
}

class GroceryTableCompanion extends UpdateCompanion<GroceryTableData> {
  final Value<String> id;
  final Value<double> normalAmount;
  final Value<String> unit;
  final Value<double> conversionAmount;
  final Value<String> conversionUnit;
  final Value<String> name;
  final Value<int> rowid;
  const GroceryTableCompanion({
    this.id = const Value.absent(),
    this.normalAmount = const Value.absent(),
    this.unit = const Value.absent(),
    this.conversionAmount = const Value.absent(),
    this.conversionUnit = const Value.absent(),
    this.name = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroceryTableCompanion.insert({
    required String id,
    required double normalAmount,
    required String unit,
    required double conversionAmount,
    required String conversionUnit,
    required String name,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       normalAmount = Value(normalAmount),
       unit = Value(unit),
       conversionAmount = Value(conversionAmount),
       conversionUnit = Value(conversionUnit),
       name = Value(name);
  static Insertable<GroceryTableData> custom({
    Expression<String>? id,
    Expression<double>? normalAmount,
    Expression<String>? unit,
    Expression<double>? conversionAmount,
    Expression<String>? conversionUnit,
    Expression<String>? name,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (normalAmount != null) 'normal_amount': normalAmount,
      if (unit != null) 'unit': unit,
      if (conversionAmount != null) 'conversion_amount': conversionAmount,
      if (conversionUnit != null) 'conversion_unit': conversionUnit,
      if (name != null) 'name': name,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroceryTableCompanion copyWith({
    Value<String>? id,
    Value<double>? normalAmount,
    Value<String>? unit,
    Value<double>? conversionAmount,
    Value<String>? conversionUnit,
    Value<String>? name,
    Value<int>? rowid,
  }) {
    return GroceryTableCompanion(
      id: id ?? this.id,
      normalAmount: normalAmount ?? this.normalAmount,
      unit: unit ?? this.unit,
      conversionAmount: conversionAmount ?? this.conversionAmount,
      conversionUnit: conversionUnit ?? this.conversionUnit,
      name: name ?? this.name,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (normalAmount.present) {
      map['normal_amount'] = Variable<double>(normalAmount.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (conversionAmount.present) {
      map['conversion_amount'] = Variable<double>(conversionAmount.value);
    }
    if (conversionUnit.present) {
      map['conversion_unit'] = Variable<String>(conversionUnit.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GroceryTableCompanion(')
          ..write('id: $id, ')
          ..write('normalAmount: $normalAmount, ')
          ..write('unit: $unit, ')
          ..write('conversionAmount: $conversionAmount, ')
          ..write('conversionUnit: $conversionUnit, ')
          ..write('name: $name, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $IngredientTableTable extends IngredientTable
    with TableInfo<$IngredientTableTable, IngredientTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IngredientTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
    'unit',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _groceryIdMeta = const VerificationMeta(
    'groceryId',
  );
  @override
  late final GeneratedColumn<String> groceryId = GeneratedColumn<String>(
    'grocery_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES grocery_table (id)',
    ),
  );
  static const VerificationMeta _recipeStepIdMeta = const VerificationMeta(
    'recipeStepId',
  );
  @override
  late final GeneratedColumn<String> recipeStepId = GeneratedColumn<String>(
    'recipe_step_id',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipe_step_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _indexMeta = const VerificationMeta('index');
  @override
  late final GeneratedColumn<int> index = GeneratedColumn<int>(
    'index',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    amount,
    unit,
    groceryId,
    recipeStepId,
    index,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'ingredient_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<IngredientTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('unit')) {
      context.handle(
        _unitMeta,
        unit.isAcceptableOrUnknown(data['unit']!, _unitMeta),
      );
    } else if (isInserting) {
      context.missing(_unitMeta);
    }
    if (data.containsKey('grocery_id')) {
      context.handle(
        _groceryIdMeta,
        groceryId.isAcceptableOrUnknown(data['grocery_id']!, _groceryIdMeta),
      );
    } else if (isInserting) {
      context.missing(_groceryIdMeta);
    }
    if (data.containsKey('recipe_step_id')) {
      context.handle(
        _recipeStepIdMeta,
        recipeStepId.isAcceptableOrUnknown(
          data['recipe_step_id']!,
          _recipeStepIdMeta,
        ),
      );
    }
    if (data.containsKey('index')) {
      context.handle(
        _indexMeta,
        index.isAcceptableOrUnknown(data['index']!, _indexMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IngredientTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IngredientTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      unit: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}unit'],
      )!,
      groceryId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}grocery_id'],
      )!,
      recipeStepId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_step_id'],
      ),
      index: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}index'],
      ),
    );
  }

  @override
  $IngredientTableTable createAlias(String alias) {
    return $IngredientTableTable(attachedDatabase, alias);
  }
}

class IngredientTableData extends DataClass
    implements Insertable<IngredientTableData> {
  final String id;
  final double amount;
  final String unit;
  final String groceryId;
  final String? recipeStepId;
  final int? index;
  const IngredientTableData({
    required this.id,
    required this.amount,
    required this.unit,
    required this.groceryId,
    this.recipeStepId,
    this.index,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['amount'] = Variable<double>(amount);
    map['unit'] = Variable<String>(unit);
    map['grocery_id'] = Variable<String>(groceryId);
    if (!nullToAbsent || recipeStepId != null) {
      map['recipe_step_id'] = Variable<String>(recipeStepId);
    }
    if (!nullToAbsent || index != null) {
      map['index'] = Variable<int>(index);
    }
    return map;
  }

  IngredientTableCompanion toCompanion(bool nullToAbsent) {
    return IngredientTableCompanion(
      id: Value(id),
      amount: Value(amount),
      unit: Value(unit),
      groceryId: Value(groceryId),
      recipeStepId: recipeStepId == null && nullToAbsent
          ? const Value.absent()
          : Value(recipeStepId),
      index: index == null && nullToAbsent
          ? const Value.absent()
          : Value(index),
    );
  }

  factory IngredientTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IngredientTableData(
      id: serializer.fromJson<String>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      unit: serializer.fromJson<String>(json['unit']),
      groceryId: serializer.fromJson<String>(json['groceryId']),
      recipeStepId: serializer.fromJson<String?>(json['recipeStepId']),
      index: serializer.fromJson<int?>(json['index']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'amount': serializer.toJson<double>(amount),
      'unit': serializer.toJson<String>(unit),
      'groceryId': serializer.toJson<String>(groceryId),
      'recipeStepId': serializer.toJson<String?>(recipeStepId),
      'index': serializer.toJson<int?>(index),
    };
  }

  IngredientTableData copyWith({
    String? id,
    double? amount,
    String? unit,
    String? groceryId,
    Value<String?> recipeStepId = const Value.absent(),
    Value<int?> index = const Value.absent(),
  }) => IngredientTableData(
    id: id ?? this.id,
    amount: amount ?? this.amount,
    unit: unit ?? this.unit,
    groceryId: groceryId ?? this.groceryId,
    recipeStepId: recipeStepId.present ? recipeStepId.value : this.recipeStepId,
    index: index.present ? index.value : this.index,
  );
  IngredientTableData copyWithCompanion(IngredientTableCompanion data) {
    return IngredientTableData(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      unit: data.unit.present ? data.unit.value : this.unit,
      groceryId: data.groceryId.present ? data.groceryId.value : this.groceryId,
      recipeStepId: data.recipeStepId.present
          ? data.recipeStepId.value
          : this.recipeStepId,
      index: data.index.present ? data.index.value : this.index,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IngredientTableData(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit, ')
          ..write('groceryId: $groceryId, ')
          ..write('recipeStepId: $recipeStepId, ')
          ..write('index: $index')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, amount, unit, groceryId, recipeStepId, index);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientTableData &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.unit == this.unit &&
          other.groceryId == this.groceryId &&
          other.recipeStepId == this.recipeStepId &&
          other.index == this.index);
}

class IngredientTableCompanion extends UpdateCompanion<IngredientTableData> {
  final Value<String> id;
  final Value<double> amount;
  final Value<String> unit;
  final Value<String> groceryId;
  final Value<String?> recipeStepId;
  final Value<int?> index;
  final Value<int> rowid;
  const IngredientTableCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.unit = const Value.absent(),
    this.groceryId = const Value.absent(),
    this.recipeStepId = const Value.absent(),
    this.index = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IngredientTableCompanion.insert({
    required String id,
    required double amount,
    required String unit,
    required String groceryId,
    this.recipeStepId = const Value.absent(),
    this.index = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       amount = Value(amount),
       unit = Value(unit),
       groceryId = Value(groceryId);
  static Insertable<IngredientTableData> custom({
    Expression<String>? id,
    Expression<double>? amount,
    Expression<String>? unit,
    Expression<String>? groceryId,
    Expression<String>? recipeStepId,
    Expression<int>? index,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (unit != null) 'unit': unit,
      if (groceryId != null) 'grocery_id': groceryId,
      if (recipeStepId != null) 'recipe_step_id': recipeStepId,
      if (index != null) 'index': index,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IngredientTableCompanion copyWith({
    Value<String>? id,
    Value<double>? amount,
    Value<String>? unit,
    Value<String>? groceryId,
    Value<String?>? recipeStepId,
    Value<int?>? index,
    Value<int>? rowid,
  }) {
    return IngredientTableCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
      groceryId: groceryId ?? this.groceryId,
      recipeStepId: recipeStepId ?? this.recipeStepId,
      index: index ?? this.index,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (groceryId.present) {
      map['grocery_id'] = Variable<String>(groceryId.value);
    }
    if (recipeStepId.present) {
      map['recipe_step_id'] = Variable<String>(recipeStepId.value);
    }
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IngredientTableCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit, ')
          ..write('groceryId: $groceryId, ')
          ..write('recipeStepId: $recipeStepId, ')
          ..write('index: $index, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $RecipeTableTable recipeTable = $RecipeTableTable(this);
  late final $RecipeStepTableTable recipeStepTable = $RecipeStepTableTable(
    this,
  );
  late final $GroceryTableTable groceryTable = $GroceryTableTable(this);
  late final $IngredientTableTable ingredientTable = $IngredientTableTable(
    this,
  );
  late final Index recipeStepRecipeId = Index(
    'recipe_step_recipeId',
    'CREATE INDEX recipe_step_recipeId ON recipe_step_table (recipe_id)',
  );
  late final Index ingredientsRecipeStepId = Index(
    'ingredients_recipeStepId',
    'CREATE INDEX ingredients_recipeStepId ON ingredient_table (recipe_step_id)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    recipeTable,
    recipeStepTable,
    groceryTable,
    ingredientTable,
    recipeStepRecipeId,
    ingredientsRecipeStepId,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recipe_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('recipe_step_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recipe_step_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('ingredient_table', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$RecipeTableTableCreateCompanionBuilder =
    RecipeTableCompanion Function({
      required String id,
      required String title,
      Value<String?> imageName,
      Value<int> rowid,
    });
typedef $$RecipeTableTableUpdateCompanionBuilder =
    RecipeTableCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String?> imageName,
      Value<int> rowid,
    });

final class $$RecipeTableTableReferences
    extends BaseReferences<_$AppDatabase, $RecipeTableTable, RecipeTableData> {
  $$RecipeTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RecipeStepTableTable, List<RecipeStepTableData>>
  _recipeStepTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.recipeStepTable,
    aliasName: $_aliasNameGenerator(
      db.recipeTable.id,
      db.recipeStepTable.recipeId,
    ),
  );

  $$RecipeStepTableTableProcessedTableManager get recipeStepTableRefs {
    final manager = $$RecipeStepTableTableTableManager(
      $_db,
      $_db.recipeStepTable,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeStepTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecipeTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageName => $composableBuilder(
    column: $table.imageName,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> recipeStepTableRefs(
    Expression<bool> Function($$RecipeStepTableTableFilterComposer f) f,
  ) {
    final $$RecipeStepTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeStepTable,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeStepTableTableFilterComposer(
            $db: $db,
            $table: $db.recipeStepTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipeTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageName => $composableBuilder(
    column: $table.imageName,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RecipeTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeTableTable> {
  $$RecipeTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get imageName =>
      $composableBuilder(column: $table.imageName, builder: (column) => column);

  Expression<T> recipeStepTableRefs<T extends Object>(
    Expression<T> Function($$RecipeStepTableTableAnnotationComposer a) f,
  ) {
    final $$RecipeStepTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeStepTable,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeStepTableTableAnnotationComposer(
            $db: $db,
            $table: $db.recipeStepTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipeTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeTableTable,
          RecipeTableData,
          $$RecipeTableTableFilterComposer,
          $$RecipeTableTableOrderingComposer,
          $$RecipeTableTableAnnotationComposer,
          $$RecipeTableTableCreateCompanionBuilder,
          $$RecipeTableTableUpdateCompanionBuilder,
          (RecipeTableData, $$RecipeTableTableReferences),
          RecipeTableData,
          PrefetchHooks Function({bool recipeStepTableRefs})
        > {
  $$RecipeTableTableTableManager(_$AppDatabase db, $RecipeTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> imageName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeTableCompanion(
                id: id,
                title: title,
                imageName: imageName,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<String?> imageName = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeTableCompanion.insert(
                id: id,
                title: title,
                imageName: imageName,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipeTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeStepTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (recipeStepTableRefs) db.recipeStepTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (recipeStepTableRefs)
                    await $_getPrefetchedData<
                      RecipeTableData,
                      $RecipeTableTable,
                      RecipeStepTableData
                    >(
                      currentTable: table,
                      referencedTable: $$RecipeTableTableReferences
                          ._recipeStepTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$RecipeTableTableReferences(
                            db,
                            table,
                            p0,
                          ).recipeStepTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.recipeId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$RecipeTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeTableTable,
      RecipeTableData,
      $$RecipeTableTableFilterComposer,
      $$RecipeTableTableOrderingComposer,
      $$RecipeTableTableAnnotationComposer,
      $$RecipeTableTableCreateCompanionBuilder,
      $$RecipeTableTableUpdateCompanionBuilder,
      (RecipeTableData, $$RecipeTableTableReferences),
      RecipeTableData,
      PrefetchHooks Function({bool recipeStepTableRefs})
    >;
typedef $$RecipeStepTableTableCreateCompanionBuilder =
    RecipeStepTableCompanion Function({
      required String id,
      required String description,
      required int index,
      required String recipeId,
      Value<int> rowid,
    });
typedef $$RecipeStepTableTableUpdateCompanionBuilder =
    RecipeStepTableCompanion Function({
      Value<String> id,
      Value<String> description,
      Value<int> index,
      Value<String> recipeId,
      Value<int> rowid,
    });

final class $$RecipeStepTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecipeStepTableTable,
          RecipeStepTableData
        > {
  $$RecipeStepTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipeTableTable _recipeIdTable(_$AppDatabase db) =>
      db.recipeTable.createAlias(
        $_aliasNameGenerator(db.recipeStepTable.recipeId, db.recipeTable.id),
      );

  $$RecipeTableTableProcessedTableManager get recipeId {
    final $_column = $_itemColumn<String>('recipe_id')!;

    final manager = $$RecipeTableTableTableManager(
      $_db,
      $_db.recipeTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$IngredientTableTable, List<IngredientTableData>>
  _ingredientTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.ingredientTable,
    aliasName: $_aliasNameGenerator(
      db.recipeStepTable.id,
      db.ingredientTable.recipeStepId,
    ),
  );

  $$IngredientTableTableProcessedTableManager get ingredientTableRefs {
    final manager = $$IngredientTableTableTableManager(
      $_db,
      $_db.ingredientTable,
    ).filter((f) => f.recipeStepId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _ingredientTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$RecipeStepTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeStepTableTable> {
  $$RecipeStepTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipeTableTableFilterComposer get recipeId {
    final $$RecipeTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipeTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableTableFilterComposer(
            $db: $db,
            $table: $db.recipeTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> ingredientTableRefs(
    Expression<bool> Function($$IngredientTableTableFilterComposer f) f,
  ) {
    final $$IngredientTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ingredientTable,
      getReferencedColumn: (t) => t.recipeStepId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientTableTableFilterComposer(
            $db: $db,
            $table: $db.ingredientTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipeStepTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeStepTableTable> {
  $$RecipeStepTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipeTableTableOrderingComposer get recipeId {
    final $$RecipeTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipeTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableTableOrderingComposer(
            $db: $db,
            $table: $db.recipeTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeStepTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeStepTableTable> {
  $$RecipeStepTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<int> get index =>
      $composableBuilder(column: $table.index, builder: (column) => column);

  $$RecipeTableTableAnnotationComposer get recipeId {
    final $$RecipeTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeId,
      referencedTable: $db.recipeTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeTableTableAnnotationComposer(
            $db: $db,
            $table: $db.recipeTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> ingredientTableRefs<T extends Object>(
    Expression<T> Function($$IngredientTableTableAnnotationComposer a) f,
  ) {
    final $$IngredientTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ingredientTable,
      getReferencedColumn: (t) => t.recipeStepId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientTableTableAnnotationComposer(
            $db: $db,
            $table: $db.ingredientTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$RecipeStepTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeStepTableTable,
          RecipeStepTableData,
          $$RecipeStepTableTableFilterComposer,
          $$RecipeStepTableTableOrderingComposer,
          $$RecipeStepTableTableAnnotationComposer,
          $$RecipeStepTableTableCreateCompanionBuilder,
          $$RecipeStepTableTableUpdateCompanionBuilder,
          (RecipeStepTableData, $$RecipeStepTableTableReferences),
          RecipeStepTableData,
          PrefetchHooks Function({bool recipeId, bool ingredientTableRefs})
        > {
  $$RecipeStepTableTableTableManager(
    _$AppDatabase db,
    $RecipeStepTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeStepTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeStepTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RecipeStepTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<int> index = const Value.absent(),
                Value<String> recipeId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeStepTableCompanion(
                id: id,
                description: description,
                index: index,
                recipeId: recipeId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String description,
                required int index,
                required String recipeId,
                Value<int> rowid = const Value.absent(),
              }) => RecipeStepTableCompanion.insert(
                id: id,
                description: description,
                index: index,
                recipeId: recipeId,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipeStepTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({recipeId = false, ingredientTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (ingredientTableRefs) db.ingredientTable,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (recipeId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.recipeId,
                                    referencedTable:
                                        $$RecipeStepTableTableReferences
                                            ._recipeIdTable(db),
                                    referencedColumn:
                                        $$RecipeStepTableTableReferences
                                            ._recipeIdTable(db)
                                            .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (ingredientTableRefs)
                        await $_getPrefetchedData<
                          RecipeStepTableData,
                          $RecipeStepTableTable,
                          IngredientTableData
                        >(
                          currentTable: table,
                          referencedTable: $$RecipeStepTableTableReferences
                              ._ingredientTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipeStepTableTableReferences(
                                db,
                                table,
                                p0,
                              ).ingredientTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeStepId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$RecipeStepTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeStepTableTable,
      RecipeStepTableData,
      $$RecipeStepTableTableFilterComposer,
      $$RecipeStepTableTableOrderingComposer,
      $$RecipeStepTableTableAnnotationComposer,
      $$RecipeStepTableTableCreateCompanionBuilder,
      $$RecipeStepTableTableUpdateCompanionBuilder,
      (RecipeStepTableData, $$RecipeStepTableTableReferences),
      RecipeStepTableData,
      PrefetchHooks Function({bool recipeId, bool ingredientTableRefs})
    >;
typedef $$GroceryTableTableCreateCompanionBuilder =
    GroceryTableCompanion Function({
      required String id,
      required double normalAmount,
      required String unit,
      required double conversionAmount,
      required String conversionUnit,
      required String name,
      Value<int> rowid,
    });
typedef $$GroceryTableTableUpdateCompanionBuilder =
    GroceryTableCompanion Function({
      Value<String> id,
      Value<double> normalAmount,
      Value<String> unit,
      Value<double> conversionAmount,
      Value<String> conversionUnit,
      Value<String> name,
      Value<int> rowid,
    });

final class $$GroceryTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $GroceryTableTable, GroceryTableData> {
  $$GroceryTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$IngredientTableTable, List<IngredientTableData>>
  _ingredientTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.ingredientTable,
    aliasName: $_aliasNameGenerator(
      db.groceryTable.id,
      db.ingredientTable.groceryId,
    ),
  );

  $$IngredientTableTableProcessedTableManager get ingredientTableRefs {
    final manager = $$IngredientTableTableTableManager(
      $_db,
      $_db.ingredientTable,
    ).filter((f) => f.groceryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _ingredientTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$GroceryTableTableFilterComposer
    extends Composer<_$AppDatabase, $GroceryTableTable> {
  $$GroceryTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get normalAmount => $composableBuilder(
    column: $table.normalAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get conversionAmount => $composableBuilder(
    column: $table.conversionAmount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get conversionUnit => $composableBuilder(
    column: $table.conversionUnit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> ingredientTableRefs(
    Expression<bool> Function($$IngredientTableTableFilterComposer f) f,
  ) {
    final $$IngredientTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ingredientTable,
      getReferencedColumn: (t) => t.groceryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientTableTableFilterComposer(
            $db: $db,
            $table: $db.ingredientTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GroceryTableTableOrderingComposer
    extends Composer<_$AppDatabase, $GroceryTableTable> {
  $$GroceryTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get normalAmount => $composableBuilder(
    column: $table.normalAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get conversionAmount => $composableBuilder(
    column: $table.conversionAmount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get conversionUnit => $composableBuilder(
    column: $table.conversionUnit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$GroceryTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $GroceryTableTable> {
  $$GroceryTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get normalAmount => $composableBuilder(
    column: $table.normalAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<double> get conversionAmount => $composableBuilder(
    column: $table.conversionAmount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get conversionUnit => $composableBuilder(
    column: $table.conversionUnit,
    builder: (column) => column,
  );

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  Expression<T> ingredientTableRefs<T extends Object>(
    Expression<T> Function($$IngredientTableTableAnnotationComposer a) f,
  ) {
    final $$IngredientTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.ingredientTable,
      getReferencedColumn: (t) => t.groceryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientTableTableAnnotationComposer(
            $db: $db,
            $table: $db.ingredientTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$GroceryTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $GroceryTableTable,
          GroceryTableData,
          $$GroceryTableTableFilterComposer,
          $$GroceryTableTableOrderingComposer,
          $$GroceryTableTableAnnotationComposer,
          $$GroceryTableTableCreateCompanionBuilder,
          $$GroceryTableTableUpdateCompanionBuilder,
          (GroceryTableData, $$GroceryTableTableReferences),
          GroceryTableData,
          PrefetchHooks Function({bool ingredientTableRefs})
        > {
  $$GroceryTableTableTableManager(_$AppDatabase db, $GroceryTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$GroceryTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$GroceryTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$GroceryTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<double> normalAmount = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<double> conversionAmount = const Value.absent(),
                Value<String> conversionUnit = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GroceryTableCompanion(
                id: id,
                normalAmount: normalAmount,
                unit: unit,
                conversionAmount: conversionAmount,
                conversionUnit: conversionUnit,
                name: name,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required double normalAmount,
                required String unit,
                required double conversionAmount,
                required String conversionUnit,
                required String name,
                Value<int> rowid = const Value.absent(),
              }) => GroceryTableCompanion.insert(
                id: id,
                normalAmount: normalAmount,
                unit: unit,
                conversionAmount: conversionAmount,
                conversionUnit: conversionUnit,
                name: name,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$GroceryTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ingredientTableRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (ingredientTableRefs) db.ingredientTable,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (ingredientTableRefs)
                    await $_getPrefetchedData<
                      GroceryTableData,
                      $GroceryTableTable,
                      IngredientTableData
                    >(
                      currentTable: table,
                      referencedTable: $$GroceryTableTableReferences
                          ._ingredientTableRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$GroceryTableTableReferences(
                            db,
                            table,
                            p0,
                          ).ingredientTableRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.groceryId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$GroceryTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $GroceryTableTable,
      GroceryTableData,
      $$GroceryTableTableFilterComposer,
      $$GroceryTableTableOrderingComposer,
      $$GroceryTableTableAnnotationComposer,
      $$GroceryTableTableCreateCompanionBuilder,
      $$GroceryTableTableUpdateCompanionBuilder,
      (GroceryTableData, $$GroceryTableTableReferences),
      GroceryTableData,
      PrefetchHooks Function({bool ingredientTableRefs})
    >;
typedef $$IngredientTableTableCreateCompanionBuilder =
    IngredientTableCompanion Function({
      required String id,
      required double amount,
      required String unit,
      required String groceryId,
      Value<String?> recipeStepId,
      Value<int?> index,
      Value<int> rowid,
    });
typedef $$IngredientTableTableUpdateCompanionBuilder =
    IngredientTableCompanion Function({
      Value<String> id,
      Value<double> amount,
      Value<String> unit,
      Value<String> groceryId,
      Value<String?> recipeStepId,
      Value<int?> index,
      Value<int> rowid,
    });

final class $$IngredientTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $IngredientTableTable,
          IngredientTableData
        > {
  $$IngredientTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $GroceryTableTable _groceryIdTable(_$AppDatabase db) =>
      db.groceryTable.createAlias(
        $_aliasNameGenerator(db.ingredientTable.groceryId, db.groceryTable.id),
      );

  $$GroceryTableTableProcessedTableManager get groceryId {
    final $_column = $_itemColumn<String>('grocery_id')!;

    final manager = $$GroceryTableTableTableManager(
      $_db,
      $_db.groceryTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_groceryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $RecipeStepTableTable _recipeStepIdTable(_$AppDatabase db) =>
      db.recipeStepTable.createAlias(
        $_aliasNameGenerator(
          db.ingredientTable.recipeStepId,
          db.recipeStepTable.id,
        ),
      );

  $$RecipeStepTableTableProcessedTableManager? get recipeStepId {
    final $_column = $_itemColumn<String>('recipe_step_id');
    if ($_column == null) return null;
    final manager = $$RecipeStepTableTableTableManager(
      $_db,
      $_db.recipeStepTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_recipeStepIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$IngredientTableTableFilterComposer
    extends Composer<_$AppDatabase, $IngredientTableTable> {
  $$IngredientTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnFilters(column),
  );

  $$GroceryTableTableFilterComposer get groceryId {
    final $$GroceryTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groceryId,
      referencedTable: $db.groceryTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GroceryTableTableFilterComposer(
            $db: $db,
            $table: $db.groceryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipeStepTableTableFilterComposer get recipeStepId {
    final $$RecipeStepTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeStepId,
      referencedTable: $db.recipeStepTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeStepTableTableFilterComposer(
            $db: $db,
            $table: $db.recipeStepTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IngredientTableTableOrderingComposer
    extends Composer<_$AppDatabase, $IngredientTableTable> {
  $$IngredientTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get unit => $composableBuilder(
    column: $table.unit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnOrderings(column),
  );

  $$GroceryTableTableOrderingComposer get groceryId {
    final $$GroceryTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groceryId,
      referencedTable: $db.groceryTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GroceryTableTableOrderingComposer(
            $db: $db,
            $table: $db.groceryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipeStepTableTableOrderingComposer get recipeStepId {
    final $$RecipeStepTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeStepId,
      referencedTable: $db.recipeStepTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeStepTableTableOrderingComposer(
            $db: $db,
            $table: $db.recipeStepTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IngredientTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $IngredientTableTable> {
  $$IngredientTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<int> get index =>
      $composableBuilder(column: $table.index, builder: (column) => column);

  $$GroceryTableTableAnnotationComposer get groceryId {
    final $$GroceryTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.groceryId,
      referencedTable: $db.groceryTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$GroceryTableTableAnnotationComposer(
            $db: $db,
            $table: $db.groceryTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$RecipeStepTableTableAnnotationComposer get recipeStepId {
    final $$RecipeStepTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.recipeStepId,
      referencedTable: $db.recipeStepTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeStepTableTableAnnotationComposer(
            $db: $db,
            $table: $db.recipeStepTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IngredientTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IngredientTableTable,
          IngredientTableData,
          $$IngredientTableTableFilterComposer,
          $$IngredientTableTableOrderingComposer,
          $$IngredientTableTableAnnotationComposer,
          $$IngredientTableTableCreateCompanionBuilder,
          $$IngredientTableTableUpdateCompanionBuilder,
          (IngredientTableData, $$IngredientTableTableReferences),
          IngredientTableData,
          PrefetchHooks Function({bool groceryId, bool recipeStepId})
        > {
  $$IngredientTableTableTableManager(
    _$AppDatabase db,
    $IngredientTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IngredientTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IngredientTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IngredientTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<String> groceryId = const Value.absent(),
                Value<String?> recipeStepId = const Value.absent(),
                Value<int?> index = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IngredientTableCompanion(
                id: id,
                amount: amount,
                unit: unit,
                groceryId: groceryId,
                recipeStepId: recipeStepId,
                index: index,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required double amount,
                required String unit,
                required String groceryId,
                Value<String?> recipeStepId = const Value.absent(),
                Value<int?> index = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IngredientTableCompanion.insert(
                id: id,
                amount: amount,
                unit: unit,
                groceryId: groceryId,
                recipeStepId: recipeStepId,
                index: index,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$IngredientTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({groceryId = false, recipeStepId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (groceryId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.groceryId,
                                referencedTable:
                                    $$IngredientTableTableReferences
                                        ._groceryIdTable(db),
                                referencedColumn:
                                    $$IngredientTableTableReferences
                                        ._groceryIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (recipeStepId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recipeStepId,
                                referencedTable:
                                    $$IngredientTableTableReferences
                                        ._recipeStepIdTable(db),
                                referencedColumn:
                                    $$IngredientTableTableReferences
                                        ._recipeStepIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$IngredientTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IngredientTableTable,
      IngredientTableData,
      $$IngredientTableTableFilterComposer,
      $$IngredientTableTableOrderingComposer,
      $$IngredientTableTableAnnotationComposer,
      $$IngredientTableTableCreateCompanionBuilder,
      $$IngredientTableTableUpdateCompanionBuilder,
      (IngredientTableData, $$IngredientTableTableReferences),
      IngredientTableData,
      PrefetchHooks Function({bool groceryId, bool recipeStepId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RecipeTableTableTableManager get recipeTable =>
      $$RecipeTableTableTableManager(_db, _db.recipeTable);
  $$RecipeStepTableTableTableManager get recipeStepTable =>
      $$RecipeStepTableTableTableManager(_db, _db.recipeStepTable);
  $$GroceryTableTableTableManager get groceryTable =>
      $$GroceryTableTableTableManager(_db, _db.groceryTable);
  $$IngredientTableTableTableManager get ingredientTable =>
      $$IngredientTableTableTableManager(_db, _db.ingredientTable);
}
