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
  static const VerificationMeta _servingsMeta = const VerificationMeta(
    'servings',
  );
  @override
  late final GeneratedColumn<int> servings = GeneratedColumn<int>(
    'servings',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
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
  static const VerificationMeta _archivedMeta = const VerificationMeta(
    'archived',
  );
  @override
  late final GeneratedColumn<bool> archived = GeneratedColumn<bool>(
    'archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _uploadedMeta = const VerificationMeta(
    'uploaded',
  );
  @override
  late final GeneratedColumn<bool> uploaded = GeneratedColumn<bool>(
    'uploaded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("uploaded" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    servings,
    imageName,
    archived,
    uploaded,
  ];
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
    if (data.containsKey('servings')) {
      context.handle(
        _servingsMeta,
        servings.isAcceptableOrUnknown(data['servings']!, _servingsMeta),
      );
    }
    if (data.containsKey('image_name')) {
      context.handle(
        _imageNameMeta,
        imageName.isAcceptableOrUnknown(data['image_name']!, _imageNameMeta),
      );
    }
    if (data.containsKey('archived')) {
      context.handle(
        _archivedMeta,
        archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta),
      );
    }
    if (data.containsKey('uploaded')) {
      context.handle(
        _uploadedMeta,
        uploaded.isAcceptableOrUnknown(data['uploaded']!, _uploadedMeta),
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
      servings: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}servings'],
      ),
      imageName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_name'],
      ),
      archived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}archived'],
      )!,
      uploaded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}uploaded'],
      )!,
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
  final int? servings;
  final String? imageName;
  final bool archived;
  final bool uploaded;
  const RecipeTableData({
    required this.id,
    required this.title,
    this.servings,
    this.imageName,
    required this.archived,
    required this.uploaded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || servings != null) {
      map['servings'] = Variable<int>(servings);
    }
    if (!nullToAbsent || imageName != null) {
      map['image_name'] = Variable<String>(imageName);
    }
    map['archived'] = Variable<bool>(archived);
    map['uploaded'] = Variable<bool>(uploaded);
    return map;
  }

  RecipeTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeTableCompanion(
      id: Value(id),
      title: Value(title),
      servings: servings == null && nullToAbsent
          ? const Value.absent()
          : Value(servings),
      imageName: imageName == null && nullToAbsent
          ? const Value.absent()
          : Value(imageName),
      archived: Value(archived),
      uploaded: Value(uploaded),
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
      servings: serializer.fromJson<int?>(json['servings']),
      imageName: serializer.fromJson<String?>(json['imageName']),
      archived: serializer.fromJson<bool>(json['archived']),
      uploaded: serializer.fromJson<bool>(json['uploaded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'servings': serializer.toJson<int?>(servings),
      'imageName': serializer.toJson<String?>(imageName),
      'archived': serializer.toJson<bool>(archived),
      'uploaded': serializer.toJson<bool>(uploaded),
    };
  }

  RecipeTableData copyWith({
    String? id,
    String? title,
    Value<int?> servings = const Value.absent(),
    Value<String?> imageName = const Value.absent(),
    bool? archived,
    bool? uploaded,
  }) => RecipeTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    servings: servings.present ? servings.value : this.servings,
    imageName: imageName.present ? imageName.value : this.imageName,
    archived: archived ?? this.archived,
    uploaded: uploaded ?? this.uploaded,
  );
  RecipeTableData copyWithCompanion(RecipeTableCompanion data) {
    return RecipeTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      servings: data.servings.present ? data.servings.value : this.servings,
      imageName: data.imageName.present ? data.imageName.value : this.imageName,
      archived: data.archived.present ? data.archived.value : this.archived,
      uploaded: data.uploaded.present ? data.uploaded.value : this.uploaded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('servings: $servings, ')
          ..write('imageName: $imageName, ')
          ..write('archived: $archived, ')
          ..write('uploaded: $uploaded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, title, servings, imageName, archived, uploaded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.servings == this.servings &&
          other.imageName == this.imageName &&
          other.archived == this.archived &&
          other.uploaded == this.uploaded);
}

class RecipeTableCompanion extends UpdateCompanion<RecipeTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<int?> servings;
  final Value<String?> imageName;
  final Value<bool> archived;
  final Value<bool> uploaded;
  final Value<int> rowid;
  const RecipeTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.servings = const Value.absent(),
    this.imageName = const Value.absent(),
    this.archived = const Value.absent(),
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeTableCompanion.insert({
    required String id,
    required String title,
    this.servings = const Value.absent(),
    this.imageName = const Value.absent(),
    this.archived = const Value.absent(),
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title);
  static Insertable<RecipeTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<int>? servings,
    Expression<String>? imageName,
    Expression<bool>? archived,
    Expression<bool>? uploaded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (servings != null) 'servings': servings,
      if (imageName != null) 'image_name': imageName,
      if (archived != null) 'archived': archived,
      if (uploaded != null) 'uploaded': uploaded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<int?>? servings,
    Value<String?>? imageName,
    Value<bool>? archived,
    Value<bool>? uploaded,
    Value<int>? rowid,
  }) {
    return RecipeTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      servings: servings ?? this.servings,
      imageName: imageName ?? this.imageName,
      archived: archived ?? this.archived,
      uploaded: uploaded ?? this.uploaded,
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
    if (servings.present) {
      map['servings'] = Variable<int>(servings.value);
    }
    if (imageName.present) {
      map['image_name'] = Variable<String>(imageName.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (uploaded.present) {
      map['uploaded'] = Variable<bool>(uploaded.value);
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
          ..write('servings: $servings, ')
          ..write('imageName: $imageName, ')
          ..write('archived: $archived, ')
          ..write('uploaded: $uploaded, ')
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
  static const VerificationMeta _uploadedMeta = const VerificationMeta(
    'uploaded',
  );
  @override
  late final GeneratedColumn<bool> uploaded = GeneratedColumn<bool>(
    'uploaded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("uploaded" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    description,
    index,
    recipeId,
    uploaded,
  ];
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
    if (data.containsKey('uploaded')) {
      context.handle(
        _uploadedMeta,
        uploaded.isAcceptableOrUnknown(data['uploaded']!, _uploadedMeta),
      );
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
      uploaded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}uploaded'],
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
  final bool uploaded;
  const RecipeStepTableData({
    required this.id,
    required this.description,
    required this.index,
    required this.recipeId,
    required this.uploaded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['description'] = Variable<String>(description);
    map['index'] = Variable<int>(index);
    map['recipe_id'] = Variable<String>(recipeId);
    map['uploaded'] = Variable<bool>(uploaded);
    return map;
  }

  RecipeStepTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeStepTableCompanion(
      id: Value(id),
      description: Value(description),
      index: Value(index),
      recipeId: Value(recipeId),
      uploaded: Value(uploaded),
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
      uploaded: serializer.fromJson<bool>(json['uploaded']),
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
      'uploaded': serializer.toJson<bool>(uploaded),
    };
  }

  RecipeStepTableData copyWith({
    String? id,
    String? description,
    int? index,
    String? recipeId,
    bool? uploaded,
  }) => RecipeStepTableData(
    id: id ?? this.id,
    description: description ?? this.description,
    index: index ?? this.index,
    recipeId: recipeId ?? this.recipeId,
    uploaded: uploaded ?? this.uploaded,
  );
  RecipeStepTableData copyWithCompanion(RecipeStepTableCompanion data) {
    return RecipeStepTableData(
      id: data.id.present ? data.id.value : this.id,
      description: data.description.present
          ? data.description.value
          : this.description,
      index: data.index.present ? data.index.value : this.index,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      uploaded: data.uploaded.present ? data.uploaded.value : this.uploaded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeStepTableData(')
          ..write('id: $id, ')
          ..write('description: $description, ')
          ..write('index: $index, ')
          ..write('recipeId: $recipeId, ')
          ..write('uploaded: $uploaded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, description, index, recipeId, uploaded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeStepTableData &&
          other.id == this.id &&
          other.description == this.description &&
          other.index == this.index &&
          other.recipeId == this.recipeId &&
          other.uploaded == this.uploaded);
}

class RecipeStepTableCompanion extends UpdateCompanion<RecipeStepTableData> {
  final Value<String> id;
  final Value<String> description;
  final Value<int> index;
  final Value<String> recipeId;
  final Value<bool> uploaded;
  final Value<int> rowid;
  const RecipeStepTableCompanion({
    this.id = const Value.absent(),
    this.description = const Value.absent(),
    this.index = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeStepTableCompanion.insert({
    required String id,
    required String description,
    required int index,
    required String recipeId,
    this.uploaded = const Value.absent(),
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
    Expression<bool>? uploaded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (description != null) 'description': description,
      if (index != null) 'index': index,
      if (recipeId != null) 'recipe_id': recipeId,
      if (uploaded != null) 'uploaded': uploaded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeStepTableCompanion copyWith({
    Value<String>? id,
    Value<String>? description,
    Value<int>? index,
    Value<String>? recipeId,
    Value<bool>? uploaded,
    Value<int>? rowid,
  }) {
    return RecipeStepTableCompanion(
      id: id ?? this.id,
      description: description ?? this.description,
      index: index ?? this.index,
      recipeId: recipeId ?? this.recipeId,
      uploaded: uploaded ?? this.uploaded,
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
    if (uploaded.present) {
      map['uploaded'] = Variable<bool>(uploaded.value);
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
          ..write('uploaded: $uploaded, ')
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
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
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
  static const VerificationMeta _kcalMeta = const VerificationMeta('kcal');
  @override
  late final GeneratedColumn<double> kcal = GeneratedColumn<double>(
    'kcal',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fatMeta = const VerificationMeta('fat');
  @override
  late final GeneratedColumn<double> fat = GeneratedColumn<double>(
    'fat',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _carbsMeta = const VerificationMeta('carbs');
  @override
  late final GeneratedColumn<double> carbs = GeneratedColumn<double>(
    'carbs',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _proteinMeta = const VerificationMeta(
    'protein',
  );
  @override
  late final GeneratedColumn<double> protein = GeneratedColumn<double>(
    'protein',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _fiberMeta = const VerificationMeta('fiber');
  @override
  late final GeneratedColumn<double> fiber = GeneratedColumn<double>(
    'fiber',
    aliasedName,
    true,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _archivedMeta = const VerificationMeta(
    'archived',
  );
  @override
  late final GeneratedColumn<bool> archived = GeneratedColumn<bool>(
    'archived',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("archived" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _uploadedMeta = const VerificationMeta(
    'uploaded',
  );
  @override
  late final GeneratedColumn<bool> uploaded = GeneratedColumn<bool>(
    'uploaded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("uploaded" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    normalAmount,
    unit,
    conversionAmount,
    conversionUnit,
    kcal,
    fat,
    carbs,
    protein,
    fiber,
    archived,
    uploaded,
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
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
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
    if (data.containsKey('kcal')) {
      context.handle(
        _kcalMeta,
        kcal.isAcceptableOrUnknown(data['kcal']!, _kcalMeta),
      );
    }
    if (data.containsKey('fat')) {
      context.handle(
        _fatMeta,
        fat.isAcceptableOrUnknown(data['fat']!, _fatMeta),
      );
    }
    if (data.containsKey('carbs')) {
      context.handle(
        _carbsMeta,
        carbs.isAcceptableOrUnknown(data['carbs']!, _carbsMeta),
      );
    }
    if (data.containsKey('protein')) {
      context.handle(
        _proteinMeta,
        protein.isAcceptableOrUnknown(data['protein']!, _proteinMeta),
      );
    }
    if (data.containsKey('fiber')) {
      context.handle(
        _fiberMeta,
        fiber.isAcceptableOrUnknown(data['fiber']!, _fiberMeta),
      );
    }
    if (data.containsKey('archived')) {
      context.handle(
        _archivedMeta,
        archived.isAcceptableOrUnknown(data['archived']!, _archivedMeta),
      );
    }
    if (data.containsKey('uploaded')) {
      context.handle(
        _uploadedMeta,
        uploaded.isAcceptableOrUnknown(data['uploaded']!, _uploadedMeta),
      );
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
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
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
      kcal: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}kcal'],
      ),
      fat: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fat'],
      ),
      carbs: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}carbs'],
      ),
      protein: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}protein'],
      ),
      fiber: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}fiber'],
      ),
      archived: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}archived'],
      )!,
      uploaded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}uploaded'],
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
  final String name;
  final double normalAmount;
  final String unit;
  final double conversionAmount;
  final String conversionUnit;
  final double? kcal;
  final double? fat;
  final double? carbs;
  final double? protein;
  final double? fiber;
  final bool archived;
  final bool uploaded;
  const GroceryTableData({
    required this.id,
    required this.name,
    required this.normalAmount,
    required this.unit,
    required this.conversionAmount,
    required this.conversionUnit,
    this.kcal,
    this.fat,
    this.carbs,
    this.protein,
    this.fiber,
    required this.archived,
    required this.uploaded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['normal_amount'] = Variable<double>(normalAmount);
    map['unit'] = Variable<String>(unit);
    map['conversion_amount'] = Variable<double>(conversionAmount);
    map['conversion_unit'] = Variable<String>(conversionUnit);
    if (!nullToAbsent || kcal != null) {
      map['kcal'] = Variable<double>(kcal);
    }
    if (!nullToAbsent || fat != null) {
      map['fat'] = Variable<double>(fat);
    }
    if (!nullToAbsent || carbs != null) {
      map['carbs'] = Variable<double>(carbs);
    }
    if (!nullToAbsent || protein != null) {
      map['protein'] = Variable<double>(protein);
    }
    if (!nullToAbsent || fiber != null) {
      map['fiber'] = Variable<double>(fiber);
    }
    map['archived'] = Variable<bool>(archived);
    map['uploaded'] = Variable<bool>(uploaded);
    return map;
  }

  GroceryTableCompanion toCompanion(bool nullToAbsent) {
    return GroceryTableCompanion(
      id: Value(id),
      name: Value(name),
      normalAmount: Value(normalAmount),
      unit: Value(unit),
      conversionAmount: Value(conversionAmount),
      conversionUnit: Value(conversionUnit),
      kcal: kcal == null && nullToAbsent ? const Value.absent() : Value(kcal),
      fat: fat == null && nullToAbsent ? const Value.absent() : Value(fat),
      carbs: carbs == null && nullToAbsent
          ? const Value.absent()
          : Value(carbs),
      protein: protein == null && nullToAbsent
          ? const Value.absent()
          : Value(protein),
      fiber: fiber == null && nullToAbsent
          ? const Value.absent()
          : Value(fiber),
      archived: Value(archived),
      uploaded: Value(uploaded),
    );
  }

  factory GroceryTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return GroceryTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      normalAmount: serializer.fromJson<double>(json['normalAmount']),
      unit: serializer.fromJson<String>(json['unit']),
      conversionAmount: serializer.fromJson<double>(json['conversionAmount']),
      conversionUnit: serializer.fromJson<String>(json['conversionUnit']),
      kcal: serializer.fromJson<double?>(json['kcal']),
      fat: serializer.fromJson<double?>(json['fat']),
      carbs: serializer.fromJson<double?>(json['carbs']),
      protein: serializer.fromJson<double?>(json['protein']),
      fiber: serializer.fromJson<double?>(json['fiber']),
      archived: serializer.fromJson<bool>(json['archived']),
      uploaded: serializer.fromJson<bool>(json['uploaded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'normalAmount': serializer.toJson<double>(normalAmount),
      'unit': serializer.toJson<String>(unit),
      'conversionAmount': serializer.toJson<double>(conversionAmount),
      'conversionUnit': serializer.toJson<String>(conversionUnit),
      'kcal': serializer.toJson<double?>(kcal),
      'fat': serializer.toJson<double?>(fat),
      'carbs': serializer.toJson<double?>(carbs),
      'protein': serializer.toJson<double?>(protein),
      'fiber': serializer.toJson<double?>(fiber),
      'archived': serializer.toJson<bool>(archived),
      'uploaded': serializer.toJson<bool>(uploaded),
    };
  }

  GroceryTableData copyWith({
    String? id,
    String? name,
    double? normalAmount,
    String? unit,
    double? conversionAmount,
    String? conversionUnit,
    Value<double?> kcal = const Value.absent(),
    Value<double?> fat = const Value.absent(),
    Value<double?> carbs = const Value.absent(),
    Value<double?> protein = const Value.absent(),
    Value<double?> fiber = const Value.absent(),
    bool? archived,
    bool? uploaded,
  }) => GroceryTableData(
    id: id ?? this.id,
    name: name ?? this.name,
    normalAmount: normalAmount ?? this.normalAmount,
    unit: unit ?? this.unit,
    conversionAmount: conversionAmount ?? this.conversionAmount,
    conversionUnit: conversionUnit ?? this.conversionUnit,
    kcal: kcal.present ? kcal.value : this.kcal,
    fat: fat.present ? fat.value : this.fat,
    carbs: carbs.present ? carbs.value : this.carbs,
    protein: protein.present ? protein.value : this.protein,
    fiber: fiber.present ? fiber.value : this.fiber,
    archived: archived ?? this.archived,
    uploaded: uploaded ?? this.uploaded,
  );
  GroceryTableData copyWithCompanion(GroceryTableCompanion data) {
    return GroceryTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
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
      kcal: data.kcal.present ? data.kcal.value : this.kcal,
      fat: data.fat.present ? data.fat.value : this.fat,
      carbs: data.carbs.present ? data.carbs.value : this.carbs,
      protein: data.protein.present ? data.protein.value : this.protein,
      fiber: data.fiber.present ? data.fiber.value : this.fiber,
      archived: data.archived.present ? data.archived.value : this.archived,
      uploaded: data.uploaded.present ? data.uploaded.value : this.uploaded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('GroceryTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('normalAmount: $normalAmount, ')
          ..write('unit: $unit, ')
          ..write('conversionAmount: $conversionAmount, ')
          ..write('conversionUnit: $conversionUnit, ')
          ..write('kcal: $kcal, ')
          ..write('fat: $fat, ')
          ..write('carbs: $carbs, ')
          ..write('protein: $protein, ')
          ..write('fiber: $fiber, ')
          ..write('archived: $archived, ')
          ..write('uploaded: $uploaded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    normalAmount,
    unit,
    conversionAmount,
    conversionUnit,
    kcal,
    fat,
    carbs,
    protein,
    fiber,
    archived,
    uploaded,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is GroceryTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.normalAmount == this.normalAmount &&
          other.unit == this.unit &&
          other.conversionAmount == this.conversionAmount &&
          other.conversionUnit == this.conversionUnit &&
          other.kcal == this.kcal &&
          other.fat == this.fat &&
          other.carbs == this.carbs &&
          other.protein == this.protein &&
          other.fiber == this.fiber &&
          other.archived == this.archived &&
          other.uploaded == this.uploaded);
}

class GroceryTableCompanion extends UpdateCompanion<GroceryTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<double> normalAmount;
  final Value<String> unit;
  final Value<double> conversionAmount;
  final Value<String> conversionUnit;
  final Value<double?> kcal;
  final Value<double?> fat;
  final Value<double?> carbs;
  final Value<double?> protein;
  final Value<double?> fiber;
  final Value<bool> archived;
  final Value<bool> uploaded;
  final Value<int> rowid;
  const GroceryTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.normalAmount = const Value.absent(),
    this.unit = const Value.absent(),
    this.conversionAmount = const Value.absent(),
    this.conversionUnit = const Value.absent(),
    this.kcal = const Value.absent(),
    this.fat = const Value.absent(),
    this.carbs = const Value.absent(),
    this.protein = const Value.absent(),
    this.fiber = const Value.absent(),
    this.archived = const Value.absent(),
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  GroceryTableCompanion.insert({
    required String id,
    required String name,
    required double normalAmount,
    required String unit,
    required double conversionAmount,
    required String conversionUnit,
    this.kcal = const Value.absent(),
    this.fat = const Value.absent(),
    this.carbs = const Value.absent(),
    this.protein = const Value.absent(),
    this.fiber = const Value.absent(),
    this.archived = const Value.absent(),
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       name = Value(name),
       normalAmount = Value(normalAmount),
       unit = Value(unit),
       conversionAmount = Value(conversionAmount),
       conversionUnit = Value(conversionUnit);
  static Insertable<GroceryTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<double>? normalAmount,
    Expression<String>? unit,
    Expression<double>? conversionAmount,
    Expression<String>? conversionUnit,
    Expression<double>? kcal,
    Expression<double>? fat,
    Expression<double>? carbs,
    Expression<double>? protein,
    Expression<double>? fiber,
    Expression<bool>? archived,
    Expression<bool>? uploaded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (normalAmount != null) 'normal_amount': normalAmount,
      if (unit != null) 'unit': unit,
      if (conversionAmount != null) 'conversion_amount': conversionAmount,
      if (conversionUnit != null) 'conversion_unit': conversionUnit,
      if (kcal != null) 'kcal': kcal,
      if (fat != null) 'fat': fat,
      if (carbs != null) 'carbs': carbs,
      if (protein != null) 'protein': protein,
      if (fiber != null) 'fiber': fiber,
      if (archived != null) 'archived': archived,
      if (uploaded != null) 'uploaded': uploaded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  GroceryTableCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<double>? normalAmount,
    Value<String>? unit,
    Value<double>? conversionAmount,
    Value<String>? conversionUnit,
    Value<double?>? kcal,
    Value<double?>? fat,
    Value<double?>? carbs,
    Value<double?>? protein,
    Value<double?>? fiber,
    Value<bool>? archived,
    Value<bool>? uploaded,
    Value<int>? rowid,
  }) {
    return GroceryTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      normalAmount: normalAmount ?? this.normalAmount,
      unit: unit ?? this.unit,
      conversionAmount: conversionAmount ?? this.conversionAmount,
      conversionUnit: conversionUnit ?? this.conversionUnit,
      kcal: kcal ?? this.kcal,
      fat: fat ?? this.fat,
      carbs: carbs ?? this.carbs,
      protein: protein ?? this.protein,
      fiber: fiber ?? this.fiber,
      archived: archived ?? this.archived,
      uploaded: uploaded ?? this.uploaded,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
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
    if (kcal.present) {
      map['kcal'] = Variable<double>(kcal.value);
    }
    if (fat.present) {
      map['fat'] = Variable<double>(fat.value);
    }
    if (carbs.present) {
      map['carbs'] = Variable<double>(carbs.value);
    }
    if (protein.present) {
      map['protein'] = Variable<double>(protein.value);
    }
    if (fiber.present) {
      map['fiber'] = Variable<double>(fiber.value);
    }
    if (archived.present) {
      map['archived'] = Variable<bool>(archived.value);
    }
    if (uploaded.present) {
      map['uploaded'] = Variable<bool>(uploaded.value);
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
          ..write('name: $name, ')
          ..write('normalAmount: $normalAmount, ')
          ..write('unit: $unit, ')
          ..write('conversionAmount: $conversionAmount, ')
          ..write('conversionUnit: $conversionUnit, ')
          ..write('kcal: $kcal, ')
          ..write('fat: $fat, ')
          ..write('carbs: $carbs, ')
          ..write('protein: $protein, ')
          ..write('fiber: $fiber, ')
          ..write('archived: $archived, ')
          ..write('uploaded: $uploaded, ')
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
  static const VerificationMeta _uploadedMeta = const VerificationMeta(
    'uploaded',
  );
  @override
  late final GeneratedColumn<bool> uploaded = GeneratedColumn<bool>(
    'uploaded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("uploaded" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, amount, unit, groceryId, uploaded];
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
    if (data.containsKey('uploaded')) {
      context.handle(
        _uploadedMeta,
        uploaded.isAcceptableOrUnknown(data['uploaded']!, _uploadedMeta),
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
      uploaded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}uploaded'],
      )!,
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
  final bool uploaded;
  const IngredientTableData({
    required this.id,
    required this.amount,
    required this.unit,
    required this.groceryId,
    required this.uploaded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['amount'] = Variable<double>(amount);
    map['unit'] = Variable<String>(unit);
    map['grocery_id'] = Variable<String>(groceryId);
    map['uploaded'] = Variable<bool>(uploaded);
    return map;
  }

  IngredientTableCompanion toCompanion(bool nullToAbsent) {
    return IngredientTableCompanion(
      id: Value(id),
      amount: Value(amount),
      unit: Value(unit),
      groceryId: Value(groceryId),
      uploaded: Value(uploaded),
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
      uploaded: serializer.fromJson<bool>(json['uploaded']),
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
      'uploaded': serializer.toJson<bool>(uploaded),
    };
  }

  IngredientTableData copyWith({
    String? id,
    double? amount,
    String? unit,
    String? groceryId,
    bool? uploaded,
  }) => IngredientTableData(
    id: id ?? this.id,
    amount: amount ?? this.amount,
    unit: unit ?? this.unit,
    groceryId: groceryId ?? this.groceryId,
    uploaded: uploaded ?? this.uploaded,
  );
  IngredientTableData copyWithCompanion(IngredientTableCompanion data) {
    return IngredientTableData(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      unit: data.unit.present ? data.unit.value : this.unit,
      groceryId: data.groceryId.present ? data.groceryId.value : this.groceryId,
      uploaded: data.uploaded.present ? data.uploaded.value : this.uploaded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IngredientTableData(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('unit: $unit, ')
          ..write('groceryId: $groceryId, ')
          ..write('uploaded: $uploaded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, amount, unit, groceryId, uploaded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IngredientTableData &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.unit == this.unit &&
          other.groceryId == this.groceryId &&
          other.uploaded == this.uploaded);
}

class IngredientTableCompanion extends UpdateCompanion<IngredientTableData> {
  final Value<String> id;
  final Value<double> amount;
  final Value<String> unit;
  final Value<String> groceryId;
  final Value<bool> uploaded;
  final Value<int> rowid;
  const IngredientTableCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.unit = const Value.absent(),
    this.groceryId = const Value.absent(),
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  IngredientTableCompanion.insert({
    required String id,
    required double amount,
    required String unit,
    required String groceryId,
    this.uploaded = const Value.absent(),
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
    Expression<bool>? uploaded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (unit != null) 'unit': unit,
      if (groceryId != null) 'grocery_id': groceryId,
      if (uploaded != null) 'uploaded': uploaded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  IngredientTableCompanion copyWith({
    Value<String>? id,
    Value<double>? amount,
    Value<String>? unit,
    Value<String>? groceryId,
    Value<bool>? uploaded,
    Value<int>? rowid,
  }) {
    return IngredientTableCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      unit: unit ?? this.unit,
      groceryId: groceryId ?? this.groceryId,
      uploaded: uploaded ?? this.uploaded,
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
    if (uploaded.present) {
      map['uploaded'] = Variable<bool>(uploaded.value);
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
          ..write('uploaded: $uploaded, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipeStepIngredientTableTable extends RecipeStepIngredientTable
    with
        TableInfo<
          $RecipeStepIngredientTableTable,
          RecipeStepIngredientTableData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeStepIngredientTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _stepIdMeta = const VerificationMeta('stepId');
  @override
  late final GeneratedColumn<String> stepId = GeneratedColumn<String>(
    'step_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES recipe_step_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _ingredientIdMeta = const VerificationMeta(
    'ingredientId',
  );
  @override
  late final GeneratedColumn<String> ingredientId = GeneratedColumn<String>(
    'ingredient_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ingredient_table (id)',
    ),
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
  static const VerificationMeta _uploadedMeta = const VerificationMeta(
    'uploaded',
  );
  @override
  late final GeneratedColumn<bool> uploaded = GeneratedColumn<bool>(
    'uploaded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("uploaded" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [stepId, ingredientId, index, uploaded];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_step_ingredient_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeStepIngredientTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('step_id')) {
      context.handle(
        _stepIdMeta,
        stepId.isAcceptableOrUnknown(data['step_id']!, _stepIdMeta),
      );
    } else if (isInserting) {
      context.missing(_stepIdMeta);
    }
    if (data.containsKey('ingredient_id')) {
      context.handle(
        _ingredientIdMeta,
        ingredientId.isAcceptableOrUnknown(
          data['ingredient_id']!,
          _ingredientIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientIdMeta);
    }
    if (data.containsKey('index')) {
      context.handle(
        _indexMeta,
        index.isAcceptableOrUnknown(data['index']!, _indexMeta),
      );
    } else if (isInserting) {
      context.missing(_indexMeta);
    }
    if (data.containsKey('uploaded')) {
      context.handle(
        _uploadedMeta,
        uploaded.isAcceptableOrUnknown(data['uploaded']!, _uploadedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {stepId, ingredientId};
  @override
  RecipeStepIngredientTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeStepIngredientTableData(
      stepId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}step_id'],
      )!,
      ingredientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredient_id'],
      )!,
      index: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}index'],
      )!,
      uploaded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}uploaded'],
      )!,
    );
  }

  @override
  $RecipeStepIngredientTableTable createAlias(String alias) {
    return $RecipeStepIngredientTableTable(attachedDatabase, alias);
  }
}

class RecipeStepIngredientTableData extends DataClass
    implements Insertable<RecipeStepIngredientTableData> {
  final String stepId;
  final String ingredientId;
  final int index;
  final bool uploaded;
  const RecipeStepIngredientTableData({
    required this.stepId,
    required this.ingredientId,
    required this.index,
    required this.uploaded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['step_id'] = Variable<String>(stepId);
    map['ingredient_id'] = Variable<String>(ingredientId);
    map['index'] = Variable<int>(index);
    map['uploaded'] = Variable<bool>(uploaded);
    return map;
  }

  RecipeStepIngredientTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeStepIngredientTableCompanion(
      stepId: Value(stepId),
      ingredientId: Value(ingredientId),
      index: Value(index),
      uploaded: Value(uploaded),
    );
  }

  factory RecipeStepIngredientTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeStepIngredientTableData(
      stepId: serializer.fromJson<String>(json['stepId']),
      ingredientId: serializer.fromJson<String>(json['ingredientId']),
      index: serializer.fromJson<int>(json['index']),
      uploaded: serializer.fromJson<bool>(json['uploaded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'stepId': serializer.toJson<String>(stepId),
      'ingredientId': serializer.toJson<String>(ingredientId),
      'index': serializer.toJson<int>(index),
      'uploaded': serializer.toJson<bool>(uploaded),
    };
  }

  RecipeStepIngredientTableData copyWith({
    String? stepId,
    String? ingredientId,
    int? index,
    bool? uploaded,
  }) => RecipeStepIngredientTableData(
    stepId: stepId ?? this.stepId,
    ingredientId: ingredientId ?? this.ingredientId,
    index: index ?? this.index,
    uploaded: uploaded ?? this.uploaded,
  );
  RecipeStepIngredientTableData copyWithCompanion(
    RecipeStepIngredientTableCompanion data,
  ) {
    return RecipeStepIngredientTableData(
      stepId: data.stepId.present ? data.stepId.value : this.stepId,
      ingredientId: data.ingredientId.present
          ? data.ingredientId.value
          : this.ingredientId,
      index: data.index.present ? data.index.value : this.index,
      uploaded: data.uploaded.present ? data.uploaded.value : this.uploaded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeStepIngredientTableData(')
          ..write('stepId: $stepId, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('index: $index, ')
          ..write('uploaded: $uploaded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(stepId, ingredientId, index, uploaded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeStepIngredientTableData &&
          other.stepId == this.stepId &&
          other.ingredientId == this.ingredientId &&
          other.index == this.index &&
          other.uploaded == this.uploaded);
}

class RecipeStepIngredientTableCompanion
    extends UpdateCompanion<RecipeStepIngredientTableData> {
  final Value<String> stepId;
  final Value<String> ingredientId;
  final Value<int> index;
  final Value<bool> uploaded;
  final Value<int> rowid;
  const RecipeStepIngredientTableCompanion({
    this.stepId = const Value.absent(),
    this.ingredientId = const Value.absent(),
    this.index = const Value.absent(),
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeStepIngredientTableCompanion.insert({
    required String stepId,
    required String ingredientId,
    required int index,
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : stepId = Value(stepId),
       ingredientId = Value(ingredientId),
       index = Value(index);
  static Insertable<RecipeStepIngredientTableData> custom({
    Expression<String>? stepId,
    Expression<String>? ingredientId,
    Expression<int>? index,
    Expression<bool>? uploaded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (stepId != null) 'step_id': stepId,
      if (ingredientId != null) 'ingredient_id': ingredientId,
      if (index != null) 'index': index,
      if (uploaded != null) 'uploaded': uploaded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeStepIngredientTableCompanion copyWith({
    Value<String>? stepId,
    Value<String>? ingredientId,
    Value<int>? index,
    Value<bool>? uploaded,
    Value<int>? rowid,
  }) {
    return RecipeStepIngredientTableCompanion(
      stepId: stepId ?? this.stepId,
      ingredientId: ingredientId ?? this.ingredientId,
      index: index ?? this.index,
      uploaded: uploaded ?? this.uploaded,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (stepId.present) {
      map['step_id'] = Variable<String>(stepId.value);
    }
    if (ingredientId.present) {
      map['ingredient_id'] = Variable<String>(ingredientId.value);
    }
    if (index.present) {
      map['index'] = Variable<int>(index.value);
    }
    if (uploaded.present) {
      map['uploaded'] = Variable<bool>(uploaded.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeStepIngredientTableCompanion(')
          ..write('stepId: $stepId, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('index: $index, ')
          ..write('uploaded: $uploaded, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ShoppingTableTable extends ShoppingTable
    with TableInfo<$ShoppingTableTable, ShoppingTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ShoppingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _doneMeta = const VerificationMeta('done');
  @override
  late final GeneratedColumn<bool> done = GeneratedColumn<bool>(
    'done',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("done" IN (0, 1))',
    ),
  );
  static const VerificationMeta _countMeta = const VerificationMeta('count');
  @override
  late final GeneratedColumn<int> count = GeneratedColumn<int>(
    'count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ingredientIdMeta = const VerificationMeta(
    'ingredientId',
  );
  @override
  late final GeneratedColumn<String> ingredientId = GeneratedColumn<String>(
    'ingredient_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ingredient_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _uploadedMeta = const VerificationMeta(
    'uploaded',
  );
  @override
  late final GeneratedColumn<bool> uploaded = GeneratedColumn<bool>(
    'uploaded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("uploaded" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    done,
    count,
    ingredientId,
    uploaded,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'shopping_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<ShoppingTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('done')) {
      context.handle(
        _doneMeta,
        done.isAcceptableOrUnknown(data['done']!, _doneMeta),
      );
    } else if (isInserting) {
      context.missing(_doneMeta);
    }
    if (data.containsKey('count')) {
      context.handle(
        _countMeta,
        count.isAcceptableOrUnknown(data['count']!, _countMeta),
      );
    } else if (isInserting) {
      context.missing(_countMeta);
    }
    if (data.containsKey('ingredient_id')) {
      context.handle(
        _ingredientIdMeta,
        ingredientId.isAcceptableOrUnknown(
          data['ingredient_id']!,
          _ingredientIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientIdMeta);
    }
    if (data.containsKey('uploaded')) {
      context.handle(
        _uploadedMeta,
        uploaded.isAcceptableOrUnknown(data['uploaded']!, _uploadedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ShoppingTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ShoppingTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      done: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}done'],
      )!,
      count: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}count'],
      )!,
      ingredientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredient_id'],
      )!,
      uploaded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}uploaded'],
      )!,
    );
  }

  @override
  $ShoppingTableTable createAlias(String alias) {
    return $ShoppingTableTable(attachedDatabase, alias);
  }
}

class ShoppingTableData extends DataClass
    implements Insertable<ShoppingTableData> {
  final String id;
  final bool done;
  final int count;
  final String ingredientId;
  final bool uploaded;
  const ShoppingTableData({
    required this.id,
    required this.done,
    required this.count,
    required this.ingredientId,
    required this.uploaded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['done'] = Variable<bool>(done);
    map['count'] = Variable<int>(count);
    map['ingredient_id'] = Variable<String>(ingredientId);
    map['uploaded'] = Variable<bool>(uploaded);
    return map;
  }

  ShoppingTableCompanion toCompanion(bool nullToAbsent) {
    return ShoppingTableCompanion(
      id: Value(id),
      done: Value(done),
      count: Value(count),
      ingredientId: Value(ingredientId),
      uploaded: Value(uploaded),
    );
  }

  factory ShoppingTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ShoppingTableData(
      id: serializer.fromJson<String>(json['id']),
      done: serializer.fromJson<bool>(json['done']),
      count: serializer.fromJson<int>(json['count']),
      ingredientId: serializer.fromJson<String>(json['ingredientId']),
      uploaded: serializer.fromJson<bool>(json['uploaded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'done': serializer.toJson<bool>(done),
      'count': serializer.toJson<int>(count),
      'ingredientId': serializer.toJson<String>(ingredientId),
      'uploaded': serializer.toJson<bool>(uploaded),
    };
  }

  ShoppingTableData copyWith({
    String? id,
    bool? done,
    int? count,
    String? ingredientId,
    bool? uploaded,
  }) => ShoppingTableData(
    id: id ?? this.id,
    done: done ?? this.done,
    count: count ?? this.count,
    ingredientId: ingredientId ?? this.ingredientId,
    uploaded: uploaded ?? this.uploaded,
  );
  ShoppingTableData copyWithCompanion(ShoppingTableCompanion data) {
    return ShoppingTableData(
      id: data.id.present ? data.id.value : this.id,
      done: data.done.present ? data.done.value : this.done,
      count: data.count.present ? data.count.value : this.count,
      ingredientId: data.ingredientId.present
          ? data.ingredientId.value
          : this.ingredientId,
      uploaded: data.uploaded.present ? data.uploaded.value : this.uploaded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingTableData(')
          ..write('id: $id, ')
          ..write('done: $done, ')
          ..write('count: $count, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('uploaded: $uploaded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, done, count, ingredientId, uploaded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ShoppingTableData &&
          other.id == this.id &&
          other.done == this.done &&
          other.count == this.count &&
          other.ingredientId == this.ingredientId &&
          other.uploaded == this.uploaded);
}

class ShoppingTableCompanion extends UpdateCompanion<ShoppingTableData> {
  final Value<String> id;
  final Value<bool> done;
  final Value<int> count;
  final Value<String> ingredientId;
  final Value<bool> uploaded;
  final Value<int> rowid;
  const ShoppingTableCompanion({
    this.id = const Value.absent(),
    this.done = const Value.absent(),
    this.count = const Value.absent(),
    this.ingredientId = const Value.absent(),
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ShoppingTableCompanion.insert({
    required String id,
    required bool done,
    required int count,
    required String ingredientId,
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       done = Value(done),
       count = Value(count),
       ingredientId = Value(ingredientId);
  static Insertable<ShoppingTableData> custom({
    Expression<String>? id,
    Expression<bool>? done,
    Expression<int>? count,
    Expression<String>? ingredientId,
    Expression<bool>? uploaded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (done != null) 'done': done,
      if (count != null) 'count': count,
      if (ingredientId != null) 'ingredient_id': ingredientId,
      if (uploaded != null) 'uploaded': uploaded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ShoppingTableCompanion copyWith({
    Value<String>? id,
    Value<bool>? done,
    Value<int>? count,
    Value<String>? ingredientId,
    Value<bool>? uploaded,
    Value<int>? rowid,
  }) {
    return ShoppingTableCompanion(
      id: id ?? this.id,
      done: done ?? this.done,
      count: count ?? this.count,
      ingredientId: ingredientId ?? this.ingredientId,
      uploaded: uploaded ?? this.uploaded,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (done.present) {
      map['done'] = Variable<bool>(done.value);
    }
    if (count.present) {
      map['count'] = Variable<int>(count.value);
    }
    if (ingredientId.present) {
      map['ingredient_id'] = Variable<String>(ingredientId.value);
    }
    if (uploaded.present) {
      map['uploaded'] = Variable<bool>(uploaded.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ShoppingTableCompanion(')
          ..write('id: $id, ')
          ..write('done: $done, ')
          ..write('count: $count, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('uploaded: $uploaded, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $StorageTableTable extends StorageTable
    with TableInfo<$StorageTableTable, StorageTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StorageTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _ingredientIdMeta = const VerificationMeta(
    'ingredientId',
  );
  @override
  late final GeneratedColumn<String> ingredientId = GeneratedColumn<String>(
    'ingredient_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES ingredient_table (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _uploadedMeta = const VerificationMeta(
    'uploaded',
  );
  @override
  late final GeneratedColumn<bool> uploaded = GeneratedColumn<bool>(
    'uploaded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("uploaded" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, ingredientId, uploaded];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'storage_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<StorageTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('ingredient_id')) {
      context.handle(
        _ingredientIdMeta,
        ingredientId.isAcceptableOrUnknown(
          data['ingredient_id']!,
          _ingredientIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_ingredientIdMeta);
    }
    if (data.containsKey('uploaded')) {
      context.handle(
        _uploadedMeta,
        uploaded.isAcceptableOrUnknown(data['uploaded']!, _uploadedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {ingredientId};
  @override
  StorageTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StorageTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      ingredientId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ingredient_id'],
      )!,
      uploaded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}uploaded'],
      )!,
    );
  }

  @override
  $StorageTableTable createAlias(String alias) {
    return $StorageTableTable(attachedDatabase, alias);
  }
}

class StorageTableData extends DataClass
    implements Insertable<StorageTableData> {
  final String id;
  final String ingredientId;
  final bool uploaded;
  const StorageTableData({
    required this.id,
    required this.ingredientId,
    required this.uploaded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['ingredient_id'] = Variable<String>(ingredientId);
    map['uploaded'] = Variable<bool>(uploaded);
    return map;
  }

  StorageTableCompanion toCompanion(bool nullToAbsent) {
    return StorageTableCompanion(
      id: Value(id),
      ingredientId: Value(ingredientId),
      uploaded: Value(uploaded),
    );
  }

  factory StorageTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StorageTableData(
      id: serializer.fromJson<String>(json['id']),
      ingredientId: serializer.fromJson<String>(json['ingredientId']),
      uploaded: serializer.fromJson<bool>(json['uploaded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'ingredientId': serializer.toJson<String>(ingredientId),
      'uploaded': serializer.toJson<bool>(uploaded),
    };
  }

  StorageTableData copyWith({
    String? id,
    String? ingredientId,
    bool? uploaded,
  }) => StorageTableData(
    id: id ?? this.id,
    ingredientId: ingredientId ?? this.ingredientId,
    uploaded: uploaded ?? this.uploaded,
  );
  StorageTableData copyWithCompanion(StorageTableCompanion data) {
    return StorageTableData(
      id: data.id.present ? data.id.value : this.id,
      ingredientId: data.ingredientId.present
          ? data.ingredientId.value
          : this.ingredientId,
      uploaded: data.uploaded.present ? data.uploaded.value : this.uploaded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StorageTableData(')
          ..write('id: $id, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('uploaded: $uploaded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, ingredientId, uploaded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StorageTableData &&
          other.id == this.id &&
          other.ingredientId == this.ingredientId &&
          other.uploaded == this.uploaded);
}

class StorageTableCompanion extends UpdateCompanion<StorageTableData> {
  final Value<String> id;
  final Value<String> ingredientId;
  final Value<bool> uploaded;
  final Value<int> rowid;
  const StorageTableCompanion({
    this.id = const Value.absent(),
    this.ingredientId = const Value.absent(),
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  StorageTableCompanion.insert({
    required String id,
    required String ingredientId,
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       ingredientId = Value(ingredientId);
  static Insertable<StorageTableData> custom({
    Expression<String>? id,
    Expression<String>? ingredientId,
    Expression<bool>? uploaded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (ingredientId != null) 'ingredient_id': ingredientId,
      if (uploaded != null) 'uploaded': uploaded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  StorageTableCompanion copyWith({
    Value<String>? id,
    Value<String>? ingredientId,
    Value<bool>? uploaded,
    Value<int>? rowid,
  }) {
    return StorageTableCompanion(
      id: id ?? this.id,
      ingredientId: ingredientId ?? this.ingredientId,
      uploaded: uploaded ?? this.uploaded,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (ingredientId.present) {
      map['ingredient_id'] = Variable<String>(ingredientId.value);
    }
    if (uploaded.present) {
      map['uploaded'] = Variable<bool>(uploaded.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StorageTableCompanion(')
          ..write('id: $id, ')
          ..write('ingredientId: $ingredientId, ')
          ..write('uploaded: $uploaded, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipeStatisticTableTable extends RecipeStatisticTable
    with TableInfo<$RecipeStatisticTableTable, RecipeStatisticTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeStatisticTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _startDateMeta = const VerificationMeta(
    'startDate',
  );
  @override
  late final GeneratedColumn<int> startDate = GeneratedColumn<int>(
    'start_date',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _endDateMeta = const VerificationMeta(
    'endDate',
  );
  @override
  late final GeneratedColumn<int> endDate = GeneratedColumn<int>(
    'end_date',
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
  static const VerificationMeta _uploadedMeta = const VerificationMeta(
    'uploaded',
  );
  @override
  late final GeneratedColumn<bool> uploaded = GeneratedColumn<bool>(
    'uploaded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("uploaded" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    startDate,
    endDate,
    recipeId,
    uploaded,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_statistic_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeStatisticTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('start_date')) {
      context.handle(
        _startDateMeta,
        startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta),
      );
    } else if (isInserting) {
      context.missing(_startDateMeta);
    }
    if (data.containsKey('end_date')) {
      context.handle(
        _endDateMeta,
        endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta),
      );
    } else if (isInserting) {
      context.missing(_endDateMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('uploaded')) {
      context.handle(
        _uploadedMeta,
        uploaded.isAcceptableOrUnknown(data['uploaded']!, _uploadedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeStatisticTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeStatisticTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      startDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}start_date'],
      )!,
      endDate: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}end_date'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_id'],
      )!,
      uploaded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}uploaded'],
      )!,
    );
  }

  @override
  $RecipeStatisticTableTable createAlias(String alias) {
    return $RecipeStatisticTableTable(attachedDatabase, alias);
  }
}

class RecipeStatisticTableData extends DataClass
    implements Insertable<RecipeStatisticTableData> {
  final String id;
  final int startDate;
  final int endDate;
  final String recipeId;
  final bool uploaded;
  const RecipeStatisticTableData({
    required this.id,
    required this.startDate,
    required this.endDate,
    required this.recipeId,
    required this.uploaded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['start_date'] = Variable<int>(startDate);
    map['end_date'] = Variable<int>(endDate);
    map['recipe_id'] = Variable<String>(recipeId);
    map['uploaded'] = Variable<bool>(uploaded);
    return map;
  }

  RecipeStatisticTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeStatisticTableCompanion(
      id: Value(id),
      startDate: Value(startDate),
      endDate: Value(endDate),
      recipeId: Value(recipeId),
      uploaded: Value(uploaded),
    );
  }

  factory RecipeStatisticTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeStatisticTableData(
      id: serializer.fromJson<String>(json['id']),
      startDate: serializer.fromJson<int>(json['startDate']),
      endDate: serializer.fromJson<int>(json['endDate']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
      uploaded: serializer.fromJson<bool>(json['uploaded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'startDate': serializer.toJson<int>(startDate),
      'endDate': serializer.toJson<int>(endDate),
      'recipeId': serializer.toJson<String>(recipeId),
      'uploaded': serializer.toJson<bool>(uploaded),
    };
  }

  RecipeStatisticTableData copyWith({
    String? id,
    int? startDate,
    int? endDate,
    String? recipeId,
    bool? uploaded,
  }) => RecipeStatisticTableData(
    id: id ?? this.id,
    startDate: startDate ?? this.startDate,
    endDate: endDate ?? this.endDate,
    recipeId: recipeId ?? this.recipeId,
    uploaded: uploaded ?? this.uploaded,
  );
  RecipeStatisticTableData copyWithCompanion(
    RecipeStatisticTableCompanion data,
  ) {
    return RecipeStatisticTableData(
      id: data.id.present ? data.id.value : this.id,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      uploaded: data.uploaded.present ? data.uploaded.value : this.uploaded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeStatisticTableData(')
          ..write('id: $id, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('recipeId: $recipeId, ')
          ..write('uploaded: $uploaded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, startDate, endDate, recipeId, uploaded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeStatisticTableData &&
          other.id == this.id &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.recipeId == this.recipeId &&
          other.uploaded == this.uploaded);
}

class RecipeStatisticTableCompanion
    extends UpdateCompanion<RecipeStatisticTableData> {
  final Value<String> id;
  final Value<int> startDate;
  final Value<int> endDate;
  final Value<String> recipeId;
  final Value<bool> uploaded;
  final Value<int> rowid;
  const RecipeStatisticTableCompanion({
    this.id = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeStatisticTableCompanion.insert({
    required String id,
    required int startDate,
    required int endDate,
    required String recipeId,
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       startDate = Value(startDate),
       endDate = Value(endDate),
       recipeId = Value(recipeId);
  static Insertable<RecipeStatisticTableData> custom({
    Expression<String>? id,
    Expression<int>? startDate,
    Expression<int>? endDate,
    Expression<String>? recipeId,
    Expression<bool>? uploaded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (recipeId != null) 'recipe_id': recipeId,
      if (uploaded != null) 'uploaded': uploaded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeStatisticTableCompanion copyWith({
    Value<String>? id,
    Value<int>? startDate,
    Value<int>? endDate,
    Value<String>? recipeId,
    Value<bool>? uploaded,
    Value<int>? rowid,
  }) {
    return RecipeStatisticTableCompanion(
      id: id ?? this.id,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      recipeId: recipeId ?? this.recipeId,
      uploaded: uploaded ?? this.uploaded,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<int>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<int>(endDate.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (uploaded.present) {
      map['uploaded'] = Variable<bool>(uploaded.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeStatisticTableCompanion(')
          ..write('id: $id, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('recipeId: $recipeId, ')
          ..write('uploaded: $uploaded, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RecipeShoppingTableTable extends RecipeShoppingTable
    with TableInfo<$RecipeShoppingTableTable, RecipeShoppingTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RecipeShoppingTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<int> date = GeneratedColumn<int>(
    'date',
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
  static const VerificationMeta _uploadedMeta = const VerificationMeta(
    'uploaded',
  );
  @override
  late final GeneratedColumn<bool> uploaded = GeneratedColumn<bool>(
    'uploaded',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("uploaded" IN (0, 1))',
    ),
    defaultValue: Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, date, recipeId, uploaded];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'recipe_shopping_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<RecipeShoppingTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    } else if (isInserting) {
      context.missing(_dateMeta);
    }
    if (data.containsKey('recipe_id')) {
      context.handle(
        _recipeIdMeta,
        recipeId.isAcceptableOrUnknown(data['recipe_id']!, _recipeIdMeta),
      );
    } else if (isInserting) {
      context.missing(_recipeIdMeta);
    }
    if (data.containsKey('uploaded')) {
      context.handle(
        _uploadedMeta,
        uploaded.isAcceptableOrUnknown(data['uploaded']!, _uploadedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RecipeShoppingTableData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RecipeShoppingTableData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}date'],
      )!,
      recipeId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recipe_id'],
      )!,
      uploaded: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}uploaded'],
      )!,
    );
  }

  @override
  $RecipeShoppingTableTable createAlias(String alias) {
    return $RecipeShoppingTableTable(attachedDatabase, alias);
  }
}

class RecipeShoppingTableData extends DataClass
    implements Insertable<RecipeShoppingTableData> {
  final String id;
  final int date;
  final String recipeId;
  final bool uploaded;
  const RecipeShoppingTableData({
    required this.id,
    required this.date,
    required this.recipeId,
    required this.uploaded,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['date'] = Variable<int>(date);
    map['recipe_id'] = Variable<String>(recipeId);
    map['uploaded'] = Variable<bool>(uploaded);
    return map;
  }

  RecipeShoppingTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeShoppingTableCompanion(
      id: Value(id),
      date: Value(date),
      recipeId: Value(recipeId),
      uploaded: Value(uploaded),
    );
  }

  factory RecipeShoppingTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RecipeShoppingTableData(
      id: serializer.fromJson<String>(json['id']),
      date: serializer.fromJson<int>(json['date']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
      uploaded: serializer.fromJson<bool>(json['uploaded']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'date': serializer.toJson<int>(date),
      'recipeId': serializer.toJson<String>(recipeId),
      'uploaded': serializer.toJson<bool>(uploaded),
    };
  }

  RecipeShoppingTableData copyWith({
    String? id,
    int? date,
    String? recipeId,
    bool? uploaded,
  }) => RecipeShoppingTableData(
    id: id ?? this.id,
    date: date ?? this.date,
    recipeId: recipeId ?? this.recipeId,
    uploaded: uploaded ?? this.uploaded,
  );
  RecipeShoppingTableData copyWithCompanion(RecipeShoppingTableCompanion data) {
    return RecipeShoppingTableData(
      id: data.id.present ? data.id.value : this.id,
      date: data.date.present ? data.date.value : this.date,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
      uploaded: data.uploaded.present ? data.uploaded.value : this.uploaded,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeShoppingTableData(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('recipeId: $recipeId, ')
          ..write('uploaded: $uploaded')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, date, recipeId, uploaded);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeShoppingTableData &&
          other.id == this.id &&
          other.date == this.date &&
          other.recipeId == this.recipeId &&
          other.uploaded == this.uploaded);
}

class RecipeShoppingTableCompanion
    extends UpdateCompanion<RecipeShoppingTableData> {
  final Value<String> id;
  final Value<int> date;
  final Value<String> recipeId;
  final Value<bool> uploaded;
  final Value<int> rowid;
  const RecipeShoppingTableCompanion({
    this.id = const Value.absent(),
    this.date = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeShoppingTableCompanion.insert({
    required String id,
    required int date,
    required String recipeId,
    this.uploaded = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       date = Value(date),
       recipeId = Value(recipeId);
  static Insertable<RecipeShoppingTableData> custom({
    Expression<String>? id,
    Expression<int>? date,
    Expression<String>? recipeId,
    Expression<bool>? uploaded,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (date != null) 'date': date,
      if (recipeId != null) 'recipe_id': recipeId,
      if (uploaded != null) 'uploaded': uploaded,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeShoppingTableCompanion copyWith({
    Value<String>? id,
    Value<int>? date,
    Value<String>? recipeId,
    Value<bool>? uploaded,
    Value<int>? rowid,
  }) {
    return RecipeShoppingTableCompanion(
      id: id ?? this.id,
      date: date ?? this.date,
      recipeId: recipeId ?? this.recipeId,
      uploaded: uploaded ?? this.uploaded,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (date.present) {
      map['date'] = Variable<int>(date.value);
    }
    if (recipeId.present) {
      map['recipe_id'] = Variable<String>(recipeId.value);
    }
    if (uploaded.present) {
      map['uploaded'] = Variable<bool>(uploaded.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RecipeShoppingTableCompanion(')
          ..write('id: $id, ')
          ..write('date: $date, ')
          ..write('recipeId: $recipeId, ')
          ..write('uploaded: $uploaded, ')
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
  late final $RecipeStepIngredientTableTable recipeStepIngredientTable =
      $RecipeStepIngredientTableTable(this);
  late final $ShoppingTableTable shoppingTable = $ShoppingTableTable(this);
  late final $StorageTableTable storageTable = $StorageTableTable(this);
  late final $RecipeStatisticTableTable recipeStatisticTable =
      $RecipeStatisticTableTable(this);
  late final $RecipeShoppingTableTable recipeShoppingTable =
      $RecipeShoppingTableTable(this);
  late final Index recipeUploaded = Index(
    'recipe_uploaded',
    'CREATE INDEX recipe_uploaded ON recipe_table (uploaded)',
  );
  late final Index recipeStepRecipeId = Index(
    'recipeStep_recipeId',
    'CREATE INDEX recipeStep_recipeId ON recipe_step_table (recipe_id)',
  );
  late final Index recipeStepUploaded = Index(
    'recipeStep_uploaded',
    'CREATE INDEX recipeStep_uploaded ON recipe_step_table (uploaded)',
  );
  late final Index recipeStepIngredientUploaded = Index(
    'recipeStepIngredient_uploaded',
    'CREATE INDEX recipeStepIngredient_uploaded ON recipe_step_ingredient_table (uploaded)',
  );
  late final Index ingredientGroceryId = Index(
    'ingredient_groceryId',
    'CREATE INDEX ingredient_groceryId ON ingredient_table (grocery_id)',
  );
  late final Index ingredientUploaded = Index(
    'ingredient_uploaded',
    'CREATE INDEX ingredient_uploaded ON ingredient_table (uploaded)',
  );
  late final Index groceryUploaded = Index(
    'grocery_uploaded',
    'CREATE INDEX grocery_uploaded ON grocery_table (uploaded)',
  );
  late final Index shoppingIngredientId = Index(
    'shopping_ingredientId',
    'CREATE INDEX shopping_ingredientId ON shopping_table (ingredient_id)',
  );
  late final Index shoppingUploaded = Index(
    'shopping_uploaded',
    'CREATE INDEX shopping_uploaded ON shopping_table (uploaded)',
  );
  late final Index storageUploaded = Index(
    'storage_uploaded',
    'CREATE INDEX storage_uploaded ON storage_table (uploaded)',
  );
  late final Index recipeStatisticsRecipeId = Index(
    'recipeStatistics_recipeId',
    'CREATE INDEX recipeStatistics_recipeId ON recipe_statistic_table (recipe_id)',
  );
  late final Index recipeStatisticsUploaded = Index(
    'recipeStatistics_uploaded',
    'CREATE INDEX recipeStatistics_uploaded ON recipe_statistic_table (uploaded)',
  );
  late final Index recipeShoppingRecipeId = Index(
    'recipeShopping_recipeId',
    'CREATE INDEX recipeShopping_recipeId ON recipe_shopping_table (recipe_id)',
  );
  late final Index recipeShoppingUploaded = Index(
    'recipeShopping_uploaded',
    'CREATE INDEX recipeShopping_uploaded ON recipe_shopping_table (uploaded)',
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
    recipeStepIngredientTable,
    shoppingTable,
    storageTable,
    recipeStatisticTable,
    recipeShoppingTable,
    recipeUploaded,
    recipeStepRecipeId,
    recipeStepUploaded,
    recipeStepIngredientUploaded,
    ingredientGroceryId,
    ingredientUploaded,
    groceryUploaded,
    shoppingIngredientId,
    shoppingUploaded,
    storageUploaded,
    recipeStatisticsRecipeId,
    recipeStatisticsUploaded,
    recipeShoppingRecipeId,
    recipeShoppingUploaded,
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
      result: [
        TableUpdate('recipe_step_ingredient_table', kind: UpdateKind.delete),
      ],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'ingredient_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('shopping_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'ingredient_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('storage_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recipe_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('recipe_statistic_table', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'recipe_table',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('recipe_shopping_table', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$RecipeTableTableCreateCompanionBuilder =
    RecipeTableCompanion Function({
      required String id,
      required String title,
      Value<int?> servings,
      Value<String?> imageName,
      Value<bool> archived,
      Value<bool> uploaded,
      Value<int> rowid,
    });
typedef $$RecipeTableTableUpdateCompanionBuilder =
    RecipeTableCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<int?> servings,
      Value<String?> imageName,
      Value<bool> archived,
      Value<bool> uploaded,
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

  static MultiTypedResultKey<
    $RecipeStatisticTableTable,
    List<RecipeStatisticTableData>
  >
  _recipeStatisticTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeStatisticTable,
        aliasName: $_aliasNameGenerator(
          db.recipeTable.id,
          db.recipeStatisticTable.recipeId,
        ),
      );

  $$RecipeStatisticTableTableProcessedTableManager
  get recipeStatisticTableRefs {
    final manager = $$RecipeStatisticTableTableTableManager(
      $_db,
      $_db.recipeStatisticTable,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeStatisticTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<
    $RecipeShoppingTableTable,
    List<RecipeShoppingTableData>
  >
  _recipeShoppingTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeShoppingTable,
        aliasName: $_aliasNameGenerator(
          db.recipeTable.id,
          db.recipeShoppingTable.recipeId,
        ),
      );

  $$RecipeShoppingTableTableProcessedTableManager get recipeShoppingTableRefs {
    final manager = $$RecipeShoppingTableTableTableManager(
      $_db,
      $_db.recipeShoppingTable,
    ).filter((f) => f.recipeId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeShoppingTableRefsTable($_db),
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

  ColumnFilters<int> get servings => $composableBuilder(
    column: $table.servings,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageName => $composableBuilder(
    column: $table.imageName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get archived => $composableBuilder(
    column: $table.archived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
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

  Expression<bool> recipeStatisticTableRefs(
    Expression<bool> Function($$RecipeStatisticTableTableFilterComposer f) f,
  ) {
    final $$RecipeStatisticTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeStatisticTable,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeStatisticTableTableFilterComposer(
            $db: $db,
            $table: $db.recipeStatisticTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> recipeShoppingTableRefs(
    Expression<bool> Function($$RecipeShoppingTableTableFilterComposer f) f,
  ) {
    final $$RecipeShoppingTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.recipeShoppingTable,
      getReferencedColumn: (t) => t.recipeId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$RecipeShoppingTableTableFilterComposer(
            $db: $db,
            $table: $db.recipeShoppingTable,
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

  ColumnOrderings<int> get servings => $composableBuilder(
    column: $table.servings,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageName => $composableBuilder(
    column: $table.imageName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get archived => $composableBuilder(
    column: $table.archived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
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

  GeneratedColumn<int> get servings =>
      $composableBuilder(column: $table.servings, builder: (column) => column);

  GeneratedColumn<String> get imageName =>
      $composableBuilder(column: $table.imageName, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  GeneratedColumn<bool> get uploaded =>
      $composableBuilder(column: $table.uploaded, builder: (column) => column);

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

  Expression<T> recipeStatisticTableRefs<T extends Object>(
    Expression<T> Function($$RecipeStatisticTableTableAnnotationComposer a) f,
  ) {
    final $$RecipeStatisticTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeStatisticTable,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeStatisticTableTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeStatisticTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> recipeShoppingTableRefs<T extends Object>(
    Expression<T> Function($$RecipeShoppingTableTableAnnotationComposer a) f,
  ) {
    final $$RecipeShoppingTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeShoppingTable,
          getReferencedColumn: (t) => t.recipeId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeShoppingTableTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeShoppingTable,
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
          PrefetchHooks Function({
            bool recipeStepTableRefs,
            bool recipeStatisticTableRefs,
            bool recipeShoppingTableRefs,
          })
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
                Value<int?> servings = const Value.absent(),
                Value<String?> imageName = const Value.absent(),
                Value<bool> archived = const Value.absent(),
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeTableCompanion(
                id: id,
                title: title,
                servings: servings,
                imageName: imageName,
                archived: archived,
                uploaded: uploaded,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                Value<int?> servings = const Value.absent(),
                Value<String?> imageName = const Value.absent(),
                Value<bool> archived = const Value.absent(),
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeTableCompanion.insert(
                id: id,
                title: title,
                servings: servings,
                imageName: imageName,
                archived: archived,
                uploaded: uploaded,
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
          prefetchHooksCallback:
              ({
                recipeStepTableRefs = false,
                recipeStatisticTableRefs = false,
                recipeShoppingTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (recipeStepTableRefs) db.recipeStepTable,
                    if (recipeStatisticTableRefs) db.recipeStatisticTable,
                    if (recipeShoppingTableRefs) db.recipeShoppingTable,
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
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (recipeStatisticTableRefs)
                        await $_getPrefetchedData<
                          RecipeTableData,
                          $RecipeTableTable,
                          RecipeStatisticTableData
                        >(
                          currentTable: table,
                          referencedTable: $$RecipeTableTableReferences
                              ._recipeStatisticTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipeTableTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeStatisticTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (recipeShoppingTableRefs)
                        await $_getPrefetchedData<
                          RecipeTableData,
                          $RecipeTableTable,
                          RecipeShoppingTableData
                        >(
                          currentTable: table,
                          referencedTable: $$RecipeTableTableReferences
                              ._recipeShoppingTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipeTableTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeShoppingTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.recipeId == item.id,
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
      PrefetchHooks Function({
        bool recipeStepTableRefs,
        bool recipeStatisticTableRefs,
        bool recipeShoppingTableRefs,
      })
    >;
typedef $$RecipeStepTableTableCreateCompanionBuilder =
    RecipeStepTableCompanion Function({
      required String id,
      required String description,
      required int index,
      required String recipeId,
      Value<bool> uploaded,
      Value<int> rowid,
    });
typedef $$RecipeStepTableTableUpdateCompanionBuilder =
    RecipeStepTableCompanion Function({
      Value<String> id,
      Value<String> description,
      Value<int> index,
      Value<String> recipeId,
      Value<bool> uploaded,
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

  static MultiTypedResultKey<
    $RecipeStepIngredientTableTable,
    List<RecipeStepIngredientTableData>
  >
  _recipeStepIngredientTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeStepIngredientTable,
        aliasName: $_aliasNameGenerator(
          db.recipeStepTable.id,
          db.recipeStepIngredientTable.stepId,
        ),
      );

  $$RecipeStepIngredientTableTableProcessedTableManager
  get recipeStepIngredientTableRefs {
    final manager = $$RecipeStepIngredientTableTableTableManager(
      $_db,
      $_db.recipeStepIngredientTable,
    ).filter((f) => f.stepId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeStepIngredientTableRefsTable($_db),
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

  ColumnFilters<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
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

  Expression<bool> recipeStepIngredientTableRefs(
    Expression<bool> Function($$RecipeStepIngredientTableTableFilterComposer f)
    f,
  ) {
    final $$RecipeStepIngredientTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeStepIngredientTable,
          getReferencedColumn: (t) => t.stepId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeStepIngredientTableTableFilterComposer(
                $db: $db,
                $table: $db.recipeStepIngredientTable,
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

  ColumnOrderings<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
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

  GeneratedColumn<bool> get uploaded =>
      $composableBuilder(column: $table.uploaded, builder: (column) => column);

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

  Expression<T> recipeStepIngredientTableRefs<T extends Object>(
    Expression<T> Function($$RecipeStepIngredientTableTableAnnotationComposer a)
    f,
  ) {
    final $$RecipeStepIngredientTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeStepIngredientTable,
          getReferencedColumn: (t) => t.stepId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeStepIngredientTableTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeStepIngredientTable,
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
          PrefetchHooks Function({
            bool recipeId,
            bool recipeStepIngredientTableRefs,
          })
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
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeStepTableCompanion(
                id: id,
                description: description,
                index: index,
                recipeId: recipeId,
                uploaded: uploaded,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String description,
                required int index,
                required String recipeId,
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeStepTableCompanion.insert(
                id: id,
                description: description,
                index: index,
                recipeId: recipeId,
                uploaded: uploaded,
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
              ({recipeId = false, recipeStepIngredientTableRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (recipeStepIngredientTableRefs)
                      db.recipeStepIngredientTable,
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
                      if (recipeStepIngredientTableRefs)
                        await $_getPrefetchedData<
                          RecipeStepTableData,
                          $RecipeStepTableTable,
                          RecipeStepIngredientTableData
                        >(
                          currentTable: table,
                          referencedTable: $$RecipeStepTableTableReferences
                              ._recipeStepIngredientTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$RecipeStepTableTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeStepIngredientTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.stepId == item.id,
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
      PrefetchHooks Function({
        bool recipeId,
        bool recipeStepIngredientTableRefs,
      })
    >;
typedef $$GroceryTableTableCreateCompanionBuilder =
    GroceryTableCompanion Function({
      required String id,
      required String name,
      required double normalAmount,
      required String unit,
      required double conversionAmount,
      required String conversionUnit,
      Value<double?> kcal,
      Value<double?> fat,
      Value<double?> carbs,
      Value<double?> protein,
      Value<double?> fiber,
      Value<bool> archived,
      Value<bool> uploaded,
      Value<int> rowid,
    });
typedef $$GroceryTableTableUpdateCompanionBuilder =
    GroceryTableCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<double> normalAmount,
      Value<String> unit,
      Value<double> conversionAmount,
      Value<String> conversionUnit,
      Value<double?> kcal,
      Value<double?> fat,
      Value<double?> carbs,
      Value<double?> protein,
      Value<double?> fiber,
      Value<bool> archived,
      Value<bool> uploaded,
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

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
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

  ColumnFilters<double> get kcal => $composableBuilder(
    column: $table.kcal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get fiber => $composableBuilder(
    column: $table.fiber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get archived => $composableBuilder(
    column: $table.archived,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
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

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
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

  ColumnOrderings<double> get kcal => $composableBuilder(
    column: $table.kcal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fat => $composableBuilder(
    column: $table.fat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get carbs => $composableBuilder(
    column: $table.carbs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get protein => $composableBuilder(
    column: $table.protein,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get fiber => $composableBuilder(
    column: $table.fiber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get archived => $composableBuilder(
    column: $table.archived,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
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

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

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

  GeneratedColumn<double> get kcal =>
      $composableBuilder(column: $table.kcal, builder: (column) => column);

  GeneratedColumn<double> get fat =>
      $composableBuilder(column: $table.fat, builder: (column) => column);

  GeneratedColumn<double> get carbs =>
      $composableBuilder(column: $table.carbs, builder: (column) => column);

  GeneratedColumn<double> get protein =>
      $composableBuilder(column: $table.protein, builder: (column) => column);

  GeneratedColumn<double> get fiber =>
      $composableBuilder(column: $table.fiber, builder: (column) => column);

  GeneratedColumn<bool> get archived =>
      $composableBuilder(column: $table.archived, builder: (column) => column);

  GeneratedColumn<bool> get uploaded =>
      $composableBuilder(column: $table.uploaded, builder: (column) => column);

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
                Value<String> name = const Value.absent(),
                Value<double> normalAmount = const Value.absent(),
                Value<String> unit = const Value.absent(),
                Value<double> conversionAmount = const Value.absent(),
                Value<String> conversionUnit = const Value.absent(),
                Value<double?> kcal = const Value.absent(),
                Value<double?> fat = const Value.absent(),
                Value<double?> carbs = const Value.absent(),
                Value<double?> protein = const Value.absent(),
                Value<double?> fiber = const Value.absent(),
                Value<bool> archived = const Value.absent(),
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GroceryTableCompanion(
                id: id,
                name: name,
                normalAmount: normalAmount,
                unit: unit,
                conversionAmount: conversionAmount,
                conversionUnit: conversionUnit,
                kcal: kcal,
                fat: fat,
                carbs: carbs,
                protein: protein,
                fiber: fiber,
                archived: archived,
                uploaded: uploaded,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String name,
                required double normalAmount,
                required String unit,
                required double conversionAmount,
                required String conversionUnit,
                Value<double?> kcal = const Value.absent(),
                Value<double?> fat = const Value.absent(),
                Value<double?> carbs = const Value.absent(),
                Value<double?> protein = const Value.absent(),
                Value<double?> fiber = const Value.absent(),
                Value<bool> archived = const Value.absent(),
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => GroceryTableCompanion.insert(
                id: id,
                name: name,
                normalAmount: normalAmount,
                unit: unit,
                conversionAmount: conversionAmount,
                conversionUnit: conversionUnit,
                kcal: kcal,
                fat: fat,
                carbs: carbs,
                protein: protein,
                fiber: fiber,
                archived: archived,
                uploaded: uploaded,
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
      Value<bool> uploaded,
      Value<int> rowid,
    });
typedef $$IngredientTableTableUpdateCompanionBuilder =
    IngredientTableCompanion Function({
      Value<String> id,
      Value<double> amount,
      Value<String> unit,
      Value<String> groceryId,
      Value<bool> uploaded,
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

  static MultiTypedResultKey<
    $RecipeStepIngredientTableTable,
    List<RecipeStepIngredientTableData>
  >
  _recipeStepIngredientTableRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.recipeStepIngredientTable,
        aliasName: $_aliasNameGenerator(
          db.ingredientTable.id,
          db.recipeStepIngredientTable.ingredientId,
        ),
      );

  $$RecipeStepIngredientTableTableProcessedTableManager
  get recipeStepIngredientTableRefs {
    final manager = $$RecipeStepIngredientTableTableTableManager(
      $_db,
      $_db.recipeStepIngredientTable,
    ).filter((f) => f.ingredientId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _recipeStepIngredientTableRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$ShoppingTableTable, List<ShoppingTableData>>
  _shoppingTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.shoppingTable,
    aliasName: $_aliasNameGenerator(
      db.ingredientTable.id,
      db.shoppingTable.ingredientId,
    ),
  );

  $$ShoppingTableTableProcessedTableManager get shoppingTableRefs {
    final manager = $$ShoppingTableTableTableManager(
      $_db,
      $_db.shoppingTable,
    ).filter((f) => f.ingredientId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_shoppingTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StorageTableTable, List<StorageTableData>>
  _storageTableRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.storageTable,
    aliasName: $_aliasNameGenerator(
      db.ingredientTable.id,
      db.storageTable.ingredientId,
    ),
  );

  $$StorageTableTableProcessedTableManager get storageTableRefs {
    final manager = $$StorageTableTableTableManager(
      $_db,
      $_db.storageTable,
    ).filter((f) => f.ingredientId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_storageTableRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
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

  ColumnFilters<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
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

  Expression<bool> recipeStepIngredientTableRefs(
    Expression<bool> Function($$RecipeStepIngredientTableTableFilterComposer f)
    f,
  ) {
    final $$RecipeStepIngredientTableTableFilterComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeStepIngredientTable,
          getReferencedColumn: (t) => t.ingredientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeStepIngredientTableTableFilterComposer(
                $db: $db,
                $table: $db.recipeStepIngredientTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<bool> shoppingTableRefs(
    Expression<bool> Function($$ShoppingTableTableFilterComposer f) f,
  ) {
    final $$ShoppingTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shoppingTable,
      getReferencedColumn: (t) => t.ingredientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShoppingTableTableFilterComposer(
            $db: $db,
            $table: $db.shoppingTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> storageTableRefs(
    Expression<bool> Function($$StorageTableTableFilterComposer f) f,
  ) {
    final $$StorageTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.storageTable,
      getReferencedColumn: (t) => t.ingredientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StorageTableTableFilterComposer(
            $db: $db,
            $table: $db.storageTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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

  ColumnOrderings<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
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

  GeneratedColumn<bool> get uploaded =>
      $composableBuilder(column: $table.uploaded, builder: (column) => column);

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

  Expression<T> recipeStepIngredientTableRefs<T extends Object>(
    Expression<T> Function($$RecipeStepIngredientTableTableAnnotationComposer a)
    f,
  ) {
    final $$RecipeStepIngredientTableTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.recipeStepIngredientTable,
          getReferencedColumn: (t) => t.ingredientId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$RecipeStepIngredientTableTableAnnotationComposer(
                $db: $db,
                $table: $db.recipeStepIngredientTable,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> shoppingTableRefs<T extends Object>(
    Expression<T> Function($$ShoppingTableTableAnnotationComposer a) f,
  ) {
    final $$ShoppingTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.shoppingTable,
      getReferencedColumn: (t) => t.ingredientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ShoppingTableTableAnnotationComposer(
            $db: $db,
            $table: $db.shoppingTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> storageTableRefs<T extends Object>(
    Expression<T> Function($$StorageTableTableAnnotationComposer a) f,
  ) {
    final $$StorageTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.storageTable,
      getReferencedColumn: (t) => t.ingredientId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StorageTableTableAnnotationComposer(
            $db: $db,
            $table: $db.storageTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
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
          PrefetchHooks Function({
            bool groceryId,
            bool recipeStepIngredientTableRefs,
            bool shoppingTableRefs,
            bool storageTableRefs,
          })
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
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IngredientTableCompanion(
                id: id,
                amount: amount,
                unit: unit,
                groceryId: groceryId,
                uploaded: uploaded,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required double amount,
                required String unit,
                required String groceryId,
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => IngredientTableCompanion.insert(
                id: id,
                amount: amount,
                unit: unit,
                groceryId: groceryId,
                uploaded: uploaded,
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
          prefetchHooksCallback:
              ({
                groceryId = false,
                recipeStepIngredientTableRefs = false,
                shoppingTableRefs = false,
                storageTableRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (recipeStepIngredientTableRefs)
                      db.recipeStepIngredientTable,
                    if (shoppingTableRefs) db.shoppingTable,
                    if (storageTableRefs) db.storageTable,
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

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (recipeStepIngredientTableRefs)
                        await $_getPrefetchedData<
                          IngredientTableData,
                          $IngredientTableTable,
                          RecipeStepIngredientTableData
                        >(
                          currentTable: table,
                          referencedTable: $$IngredientTableTableReferences
                              ._recipeStepIngredientTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IngredientTableTableReferences(
                                db,
                                table,
                                p0,
                              ).recipeStepIngredientTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ingredientId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (shoppingTableRefs)
                        await $_getPrefetchedData<
                          IngredientTableData,
                          $IngredientTableTable,
                          ShoppingTableData
                        >(
                          currentTable: table,
                          referencedTable: $$IngredientTableTableReferences
                              ._shoppingTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IngredientTableTableReferences(
                                db,
                                table,
                                p0,
                              ).shoppingTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ingredientId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (storageTableRefs)
                        await $_getPrefetchedData<
                          IngredientTableData,
                          $IngredientTableTable,
                          StorageTableData
                        >(
                          currentTable: table,
                          referencedTable: $$IngredientTableTableReferences
                              ._storageTableRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IngredientTableTableReferences(
                                db,
                                table,
                                p0,
                              ).storageTableRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.ingredientId == item.id,
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
      PrefetchHooks Function({
        bool groceryId,
        bool recipeStepIngredientTableRefs,
        bool shoppingTableRefs,
        bool storageTableRefs,
      })
    >;
typedef $$RecipeStepIngredientTableTableCreateCompanionBuilder =
    RecipeStepIngredientTableCompanion Function({
      required String stepId,
      required String ingredientId,
      required int index,
      Value<bool> uploaded,
      Value<int> rowid,
    });
typedef $$RecipeStepIngredientTableTableUpdateCompanionBuilder =
    RecipeStepIngredientTableCompanion Function({
      Value<String> stepId,
      Value<String> ingredientId,
      Value<int> index,
      Value<bool> uploaded,
      Value<int> rowid,
    });

final class $$RecipeStepIngredientTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecipeStepIngredientTableTable,
          RecipeStepIngredientTableData
        > {
  $$RecipeStepIngredientTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipeStepTableTable _stepIdTable(_$AppDatabase db) =>
      db.recipeStepTable.createAlias(
        $_aliasNameGenerator(
          db.recipeStepIngredientTable.stepId,
          db.recipeStepTable.id,
        ),
      );

  $$RecipeStepTableTableProcessedTableManager get stepId {
    final $_column = $_itemColumn<String>('step_id')!;

    final manager = $$RecipeStepTableTableTableManager(
      $_db,
      $_db.recipeStepTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_stepIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $IngredientTableTable _ingredientIdTable(_$AppDatabase db) =>
      db.ingredientTable.createAlias(
        $_aliasNameGenerator(
          db.recipeStepIngredientTable.ingredientId,
          db.ingredientTable.id,
        ),
      );

  $$IngredientTableTableProcessedTableManager get ingredientId {
    final $_column = $_itemColumn<String>('ingredient_id')!;

    final manager = $$IngredientTableTableTableManager(
      $_db,
      $_db.ingredientTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ingredientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$RecipeStepIngredientTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeStepIngredientTableTable> {
  $$RecipeStepIngredientTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
    builder: (column) => ColumnFilters(column),
  );

  $$RecipeStepTableTableFilterComposer get stepId {
    final $$RecipeStepTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stepId,
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

  $$IngredientTableTableFilterComposer get ingredientId {
    final $$IngredientTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientTable,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$RecipeStepIngredientTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeStepIngredientTableTable> {
  $$RecipeStepIngredientTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get index => $composableBuilder(
    column: $table.index,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
    builder: (column) => ColumnOrderings(column),
  );

  $$RecipeStepTableTableOrderingComposer get stepId {
    final $$RecipeStepTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stepId,
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

  $$IngredientTableTableOrderingComposer get ingredientId {
    final $$IngredientTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientTableTableOrderingComposer(
            $db: $db,
            $table: $db.ingredientTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$RecipeStepIngredientTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeStepIngredientTableTable> {
  $$RecipeStepIngredientTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get index =>
      $composableBuilder(column: $table.index, builder: (column) => column);

  GeneratedColumn<bool> get uploaded =>
      $composableBuilder(column: $table.uploaded, builder: (column) => column);

  $$RecipeStepTableTableAnnotationComposer get stepId {
    final $$RecipeStepTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.stepId,
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

  $$IngredientTableTableAnnotationComposer get ingredientId {
    final $$IngredientTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientTable,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$RecipeStepIngredientTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeStepIngredientTableTable,
          RecipeStepIngredientTableData,
          $$RecipeStepIngredientTableTableFilterComposer,
          $$RecipeStepIngredientTableTableOrderingComposer,
          $$RecipeStepIngredientTableTableAnnotationComposer,
          $$RecipeStepIngredientTableTableCreateCompanionBuilder,
          $$RecipeStepIngredientTableTableUpdateCompanionBuilder,
          (
            RecipeStepIngredientTableData,
            $$RecipeStepIngredientTableTableReferences,
          ),
          RecipeStepIngredientTableData,
          PrefetchHooks Function({bool stepId, bool ingredientId})
        > {
  $$RecipeStepIngredientTableTableTableManager(
    _$AppDatabase db,
    $RecipeStepIngredientTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeStepIngredientTableTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$RecipeStepIngredientTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RecipeStepIngredientTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> stepId = const Value.absent(),
                Value<String> ingredientId = const Value.absent(),
                Value<int> index = const Value.absent(),
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeStepIngredientTableCompanion(
                stepId: stepId,
                ingredientId: ingredientId,
                index: index,
                uploaded: uploaded,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String stepId,
                required String ingredientId,
                required int index,
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeStepIngredientTableCompanion.insert(
                stepId: stepId,
                ingredientId: ingredientId,
                index: index,
                uploaded: uploaded,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipeStepIngredientTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({stepId = false, ingredientId = false}) {
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
                    if (stepId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.stepId,
                                referencedTable:
                                    $$RecipeStepIngredientTableTableReferences
                                        ._stepIdTable(db),
                                referencedColumn:
                                    $$RecipeStepIngredientTableTableReferences
                                        ._stepIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (ingredientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ingredientId,
                                referencedTable:
                                    $$RecipeStepIngredientTableTableReferences
                                        ._ingredientIdTable(db),
                                referencedColumn:
                                    $$RecipeStepIngredientTableTableReferences
                                        ._ingredientIdTable(db)
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

typedef $$RecipeStepIngredientTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeStepIngredientTableTable,
      RecipeStepIngredientTableData,
      $$RecipeStepIngredientTableTableFilterComposer,
      $$RecipeStepIngredientTableTableOrderingComposer,
      $$RecipeStepIngredientTableTableAnnotationComposer,
      $$RecipeStepIngredientTableTableCreateCompanionBuilder,
      $$RecipeStepIngredientTableTableUpdateCompanionBuilder,
      (
        RecipeStepIngredientTableData,
        $$RecipeStepIngredientTableTableReferences,
      ),
      RecipeStepIngredientTableData,
      PrefetchHooks Function({bool stepId, bool ingredientId})
    >;
typedef $$ShoppingTableTableCreateCompanionBuilder =
    ShoppingTableCompanion Function({
      required String id,
      required bool done,
      required int count,
      required String ingredientId,
      Value<bool> uploaded,
      Value<int> rowid,
    });
typedef $$ShoppingTableTableUpdateCompanionBuilder =
    ShoppingTableCompanion Function({
      Value<String> id,
      Value<bool> done,
      Value<int> count,
      Value<String> ingredientId,
      Value<bool> uploaded,
      Value<int> rowid,
    });

final class $$ShoppingTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $ShoppingTableTable, ShoppingTableData> {
  $$ShoppingTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $IngredientTableTable _ingredientIdTable(_$AppDatabase db) =>
      db.ingredientTable.createAlias(
        $_aliasNameGenerator(
          db.shoppingTable.ingredientId,
          db.ingredientTable.id,
        ),
      );

  $$IngredientTableTableProcessedTableManager get ingredientId {
    final $_column = $_itemColumn<String>('ingredient_id')!;

    final manager = $$IngredientTableTableTableManager(
      $_db,
      $_db.ingredientTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ingredientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ShoppingTableTableFilterComposer
    extends Composer<_$AppDatabase, $ShoppingTableTable> {
  $$ShoppingTableTableFilterComposer({
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

  ColumnFilters<bool> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
    builder: (column) => ColumnFilters(column),
  );

  $$IngredientTableTableFilterComposer get ingredientId {
    final $$IngredientTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientTable,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$ShoppingTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ShoppingTableTable> {
  $$ShoppingTableTableOrderingComposer({
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

  ColumnOrderings<bool> get done => $composableBuilder(
    column: $table.done,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get count => $composableBuilder(
    column: $table.count,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
    builder: (column) => ColumnOrderings(column),
  );

  $$IngredientTableTableOrderingComposer get ingredientId {
    final $$IngredientTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientTableTableOrderingComposer(
            $db: $db,
            $table: $db.ingredientTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ShoppingTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ShoppingTableTable> {
  $$ShoppingTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get done =>
      $composableBuilder(column: $table.done, builder: (column) => column);

  GeneratedColumn<int> get count =>
      $composableBuilder(column: $table.count, builder: (column) => column);

  GeneratedColumn<bool> get uploaded =>
      $composableBuilder(column: $table.uploaded, builder: (column) => column);

  $$IngredientTableTableAnnotationComposer get ingredientId {
    final $$IngredientTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientTable,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$ShoppingTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ShoppingTableTable,
          ShoppingTableData,
          $$ShoppingTableTableFilterComposer,
          $$ShoppingTableTableOrderingComposer,
          $$ShoppingTableTableAnnotationComposer,
          $$ShoppingTableTableCreateCompanionBuilder,
          $$ShoppingTableTableUpdateCompanionBuilder,
          (ShoppingTableData, $$ShoppingTableTableReferences),
          ShoppingTableData,
          PrefetchHooks Function({bool ingredientId})
        > {
  $$ShoppingTableTableTableManager(_$AppDatabase db, $ShoppingTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ShoppingTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ShoppingTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ShoppingTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<bool> done = const Value.absent(),
                Value<int> count = const Value.absent(),
                Value<String> ingredientId = const Value.absent(),
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ShoppingTableCompanion(
                id: id,
                done: done,
                count: count,
                ingredientId: ingredientId,
                uploaded: uploaded,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required bool done,
                required int count,
                required String ingredientId,
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ShoppingTableCompanion.insert(
                id: id,
                done: done,
                count: count,
                ingredientId: ingredientId,
                uploaded: uploaded,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ShoppingTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ingredientId = false}) {
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
                    if (ingredientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ingredientId,
                                referencedTable: $$ShoppingTableTableReferences
                                    ._ingredientIdTable(db),
                                referencedColumn: $$ShoppingTableTableReferences
                                    ._ingredientIdTable(db)
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

typedef $$ShoppingTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ShoppingTableTable,
      ShoppingTableData,
      $$ShoppingTableTableFilterComposer,
      $$ShoppingTableTableOrderingComposer,
      $$ShoppingTableTableAnnotationComposer,
      $$ShoppingTableTableCreateCompanionBuilder,
      $$ShoppingTableTableUpdateCompanionBuilder,
      (ShoppingTableData, $$ShoppingTableTableReferences),
      ShoppingTableData,
      PrefetchHooks Function({bool ingredientId})
    >;
typedef $$StorageTableTableCreateCompanionBuilder =
    StorageTableCompanion Function({
      required String id,
      required String ingredientId,
      Value<bool> uploaded,
      Value<int> rowid,
    });
typedef $$StorageTableTableUpdateCompanionBuilder =
    StorageTableCompanion Function({
      Value<String> id,
      Value<String> ingredientId,
      Value<bool> uploaded,
      Value<int> rowid,
    });

final class $$StorageTableTableReferences
    extends
        BaseReferences<_$AppDatabase, $StorageTableTable, StorageTableData> {
  $$StorageTableTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $IngredientTableTable _ingredientIdTable(_$AppDatabase db) =>
      db.ingredientTable.createAlias(
        $_aliasNameGenerator(
          db.storageTable.ingredientId,
          db.ingredientTable.id,
        ),
      );

  $$IngredientTableTableProcessedTableManager get ingredientId {
    final $_column = $_itemColumn<String>('ingredient_id')!;

    final manager = $$IngredientTableTableTableManager(
      $_db,
      $_db.ingredientTable,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_ingredientIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StorageTableTableFilterComposer
    extends Composer<_$AppDatabase, $StorageTableTable> {
  $$StorageTableTableFilterComposer({
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

  ColumnFilters<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
    builder: (column) => ColumnFilters(column),
  );

  $$IngredientTableTableFilterComposer get ingredientId {
    final $$IngredientTableTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientTable,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$StorageTableTableOrderingComposer
    extends Composer<_$AppDatabase, $StorageTableTable> {
  $$StorageTableTableOrderingComposer({
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

  ColumnOrderings<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
    builder: (column) => ColumnOrderings(column),
  );

  $$IngredientTableTableOrderingComposer get ingredientId {
    final $$IngredientTableTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientTable,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IngredientTableTableOrderingComposer(
            $db: $db,
            $table: $db.ingredientTable,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StorageTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $StorageTableTable> {
  $$StorageTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<bool> get uploaded =>
      $composableBuilder(column: $table.uploaded, builder: (column) => column);

  $$IngredientTableTableAnnotationComposer get ingredientId {
    final $$IngredientTableTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.ingredientId,
      referencedTable: $db.ingredientTable,
      getReferencedColumn: (t) => t.id,
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
    return composer;
  }
}

class $$StorageTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StorageTableTable,
          StorageTableData,
          $$StorageTableTableFilterComposer,
          $$StorageTableTableOrderingComposer,
          $$StorageTableTableAnnotationComposer,
          $$StorageTableTableCreateCompanionBuilder,
          $$StorageTableTableUpdateCompanionBuilder,
          (StorageTableData, $$StorageTableTableReferences),
          StorageTableData,
          PrefetchHooks Function({bool ingredientId})
        > {
  $$StorageTableTableTableManager(_$AppDatabase db, $StorageTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StorageTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StorageTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StorageTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> ingredientId = const Value.absent(),
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StorageTableCompanion(
                id: id,
                ingredientId: ingredientId,
                uploaded: uploaded,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String ingredientId,
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => StorageTableCompanion.insert(
                id: id,
                ingredientId: ingredientId,
                uploaded: uploaded,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StorageTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({ingredientId = false}) {
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
                    if (ingredientId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.ingredientId,
                                referencedTable: $$StorageTableTableReferences
                                    ._ingredientIdTable(db),
                                referencedColumn: $$StorageTableTableReferences
                                    ._ingredientIdTable(db)
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

typedef $$StorageTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StorageTableTable,
      StorageTableData,
      $$StorageTableTableFilterComposer,
      $$StorageTableTableOrderingComposer,
      $$StorageTableTableAnnotationComposer,
      $$StorageTableTableCreateCompanionBuilder,
      $$StorageTableTableUpdateCompanionBuilder,
      (StorageTableData, $$StorageTableTableReferences),
      StorageTableData,
      PrefetchHooks Function({bool ingredientId})
    >;
typedef $$RecipeStatisticTableTableCreateCompanionBuilder =
    RecipeStatisticTableCompanion Function({
      required String id,
      required int startDate,
      required int endDate,
      required String recipeId,
      Value<bool> uploaded,
      Value<int> rowid,
    });
typedef $$RecipeStatisticTableTableUpdateCompanionBuilder =
    RecipeStatisticTableCompanion Function({
      Value<String> id,
      Value<int> startDate,
      Value<int> endDate,
      Value<String> recipeId,
      Value<bool> uploaded,
      Value<int> rowid,
    });

final class $$RecipeStatisticTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecipeStatisticTableTable,
          RecipeStatisticTableData
        > {
  $$RecipeStatisticTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipeTableTable _recipeIdTable(_$AppDatabase db) =>
      db.recipeTable.createAlias(
        $_aliasNameGenerator(
          db.recipeStatisticTable.recipeId,
          db.recipeTable.id,
        ),
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
}

class $$RecipeStatisticTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeStatisticTableTable> {
  $$RecipeStatisticTableTableFilterComposer({
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

  ColumnFilters<int> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
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
}

class $$RecipeStatisticTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeStatisticTableTable> {
  $$RecipeStatisticTableTableOrderingComposer({
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

  ColumnOrderings<int> get startDate => $composableBuilder(
    column: $table.startDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get endDate => $composableBuilder(
    column: $table.endDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
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

class $$RecipeStatisticTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeStatisticTableTable> {
  $$RecipeStatisticTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<int> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<bool> get uploaded =>
      $composableBuilder(column: $table.uploaded, builder: (column) => column);

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
}

class $$RecipeStatisticTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeStatisticTableTable,
          RecipeStatisticTableData,
          $$RecipeStatisticTableTableFilterComposer,
          $$RecipeStatisticTableTableOrderingComposer,
          $$RecipeStatisticTableTableAnnotationComposer,
          $$RecipeStatisticTableTableCreateCompanionBuilder,
          $$RecipeStatisticTableTableUpdateCompanionBuilder,
          (RecipeStatisticTableData, $$RecipeStatisticTableTableReferences),
          RecipeStatisticTableData,
          PrefetchHooks Function({bool recipeId})
        > {
  $$RecipeStatisticTableTableTableManager(
    _$AppDatabase db,
    $RecipeStatisticTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeStatisticTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeStatisticTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RecipeStatisticTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> startDate = const Value.absent(),
                Value<int> endDate = const Value.absent(),
                Value<String> recipeId = const Value.absent(),
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeStatisticTableCompanion(
                id: id,
                startDate: startDate,
                endDate: endDate,
                recipeId: recipeId,
                uploaded: uploaded,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int startDate,
                required int endDate,
                required String recipeId,
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeStatisticTableCompanion.insert(
                id: id,
                startDate: startDate,
                endDate: endDate,
                recipeId: recipeId,
                uploaded: uploaded,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipeStatisticTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeId = false}) {
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
                    if (recipeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recipeId,
                                referencedTable:
                                    $$RecipeStatisticTableTableReferences
                                        ._recipeIdTable(db),
                                referencedColumn:
                                    $$RecipeStatisticTableTableReferences
                                        ._recipeIdTable(db)
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

typedef $$RecipeStatisticTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeStatisticTableTable,
      RecipeStatisticTableData,
      $$RecipeStatisticTableTableFilterComposer,
      $$RecipeStatisticTableTableOrderingComposer,
      $$RecipeStatisticTableTableAnnotationComposer,
      $$RecipeStatisticTableTableCreateCompanionBuilder,
      $$RecipeStatisticTableTableUpdateCompanionBuilder,
      (RecipeStatisticTableData, $$RecipeStatisticTableTableReferences),
      RecipeStatisticTableData,
      PrefetchHooks Function({bool recipeId})
    >;
typedef $$RecipeShoppingTableTableCreateCompanionBuilder =
    RecipeShoppingTableCompanion Function({
      required String id,
      required int date,
      required String recipeId,
      Value<bool> uploaded,
      Value<int> rowid,
    });
typedef $$RecipeShoppingTableTableUpdateCompanionBuilder =
    RecipeShoppingTableCompanion Function({
      Value<String> id,
      Value<int> date,
      Value<String> recipeId,
      Value<bool> uploaded,
      Value<int> rowid,
    });

final class $$RecipeShoppingTableTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $RecipeShoppingTableTable,
          RecipeShoppingTableData
        > {
  $$RecipeShoppingTableTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $RecipeTableTable _recipeIdTable(_$AppDatabase db) =>
      db.recipeTable.createAlias(
        $_aliasNameGenerator(
          db.recipeShoppingTable.recipeId,
          db.recipeTable.id,
        ),
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
}

class $$RecipeShoppingTableTableFilterComposer
    extends Composer<_$AppDatabase, $RecipeShoppingTableTable> {
  $$RecipeShoppingTableTableFilterComposer({
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

  ColumnFilters<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
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
}

class $$RecipeShoppingTableTableOrderingComposer
    extends Composer<_$AppDatabase, $RecipeShoppingTableTable> {
  $$RecipeShoppingTableTableOrderingComposer({
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

  ColumnOrderings<int> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get uploaded => $composableBuilder(
    column: $table.uploaded,
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

class $$RecipeShoppingTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $RecipeShoppingTableTable> {
  $$RecipeShoppingTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<bool> get uploaded =>
      $composableBuilder(column: $table.uploaded, builder: (column) => column);

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
}

class $$RecipeShoppingTableTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RecipeShoppingTableTable,
          RecipeShoppingTableData,
          $$RecipeShoppingTableTableFilterComposer,
          $$RecipeShoppingTableTableOrderingComposer,
          $$RecipeShoppingTableTableAnnotationComposer,
          $$RecipeShoppingTableTableCreateCompanionBuilder,
          $$RecipeShoppingTableTableUpdateCompanionBuilder,
          (RecipeShoppingTableData, $$RecipeShoppingTableTableReferences),
          RecipeShoppingTableData,
          PrefetchHooks Function({bool recipeId})
        > {
  $$RecipeShoppingTableTableTableManager(
    _$AppDatabase db,
    $RecipeShoppingTableTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RecipeShoppingTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RecipeShoppingTableTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$RecipeShoppingTableTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<int> date = const Value.absent(),
                Value<String> recipeId = const Value.absent(),
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeShoppingTableCompanion(
                id: id,
                date: date,
                recipeId: recipeId,
                uploaded: uploaded,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required int date,
                required String recipeId,
                Value<bool> uploaded = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeShoppingTableCompanion.insert(
                id: id,
                date: date,
                recipeId: recipeId,
                uploaded: uploaded,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$RecipeShoppingTableTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({recipeId = false}) {
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
                    if (recipeId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.recipeId,
                                referencedTable:
                                    $$RecipeShoppingTableTableReferences
                                        ._recipeIdTable(db),
                                referencedColumn:
                                    $$RecipeShoppingTableTableReferences
                                        ._recipeIdTable(db)
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

typedef $$RecipeShoppingTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RecipeShoppingTableTable,
      RecipeShoppingTableData,
      $$RecipeShoppingTableTableFilterComposer,
      $$RecipeShoppingTableTableOrderingComposer,
      $$RecipeShoppingTableTableAnnotationComposer,
      $$RecipeShoppingTableTableCreateCompanionBuilder,
      $$RecipeShoppingTableTableUpdateCompanionBuilder,
      (RecipeShoppingTableData, $$RecipeShoppingTableTableReferences),
      RecipeShoppingTableData,
      PrefetchHooks Function({bool recipeId})
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
  $$RecipeStepIngredientTableTableTableManager get recipeStepIngredientTable =>
      $$RecipeStepIngredientTableTableTableManager(
        _db,
        _db.recipeStepIngredientTable,
      );
  $$ShoppingTableTableTableManager get shoppingTable =>
      $$ShoppingTableTableTableManager(_db, _db.shoppingTable);
  $$StorageTableTableTableManager get storageTable =>
      $$StorageTableTableTableManager(_db, _db.storageTable);
  $$RecipeStatisticTableTableTableManager get recipeStatisticTable =>
      $$RecipeStatisticTableTableTableManager(_db, _db.recipeStatisticTable);
  $$RecipeShoppingTableTableTableManager get recipeShoppingTable =>
      $$RecipeShoppingTableTableTableManager(_db, _db.recipeShoppingTable);
}
