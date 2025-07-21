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
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
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
      'REFERENCES recipe_table (id)',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, recipeId];
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
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
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
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
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
  final String title;
  final String recipeId;
  const RecipeStepTableData({
    required this.id,
    required this.title,
    required this.recipeId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['title'] = Variable<String>(title);
    map['recipe_id'] = Variable<String>(recipeId);
    return map;
  }

  RecipeStepTableCompanion toCompanion(bool nullToAbsent) {
    return RecipeStepTableCompanion(
      id: Value(id),
      title: Value(title),
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
      title: serializer.fromJson<String>(json['title']),
      recipeId: serializer.fromJson<String>(json['recipeId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'recipeId': serializer.toJson<String>(recipeId),
    };
  }

  RecipeStepTableData copyWith({String? id, String? title, String? recipeId}) =>
      RecipeStepTableData(
        id: id ?? this.id,
        title: title ?? this.title,
        recipeId: recipeId ?? this.recipeId,
      );
  RecipeStepTableData copyWithCompanion(RecipeStepTableCompanion data) {
    return RecipeStepTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      recipeId: data.recipeId.present ? data.recipeId.value : this.recipeId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RecipeStepTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('recipeId: $recipeId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, recipeId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RecipeStepTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.recipeId == this.recipeId);
}

class RecipeStepTableCompanion extends UpdateCompanion<RecipeStepTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> recipeId;
  final Value<int> rowid;
  const RecipeStepTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.recipeId = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RecipeStepTableCompanion.insert({
    required String id,
    required String title,
    required String recipeId,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       recipeId = Value(recipeId);
  static Insertable<RecipeStepTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? recipeId,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (recipeId != null) 'recipe_id': recipeId,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RecipeStepTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? recipeId,
    Value<int>? rowid,
  }) {
    return RecipeStepTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
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
    if (title.present) {
      map['title'] = Variable<String>(title.value);
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
          ..write('title: $title, ')
          ..write('recipeId: $recipeId, ')
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
  late final Index recipeStepRecipeId = Index(
    'recipe_step_recipeId',
    'CREATE INDEX recipe_step_recipeId ON recipe_step_table (recipe_id)',
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    recipeTable,
    recipeStepTable,
    recipeStepRecipeId,
  ];
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
      required String title,
      required String recipeId,
      Value<int> rowid,
    });
typedef $$RecipeStepTableTableUpdateCompanionBuilder =
    RecipeStepTableCompanion Function({
      Value<String> id,
      Value<String> title,
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

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
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

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
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

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

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
          PrefetchHooks Function({bool recipeId})
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
                Value<String> title = const Value.absent(),
                Value<String> recipeId = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => RecipeStepTableCompanion(
                id: id,
                title: title,
                recipeId: recipeId,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String recipeId,
                Value<int> rowid = const Value.absent(),
              }) => RecipeStepTableCompanion.insert(
                id: id,
                title: title,
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
                return [];
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
      PrefetchHooks Function({bool recipeId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$RecipeTableTableTableManager get recipeTable =>
      $$RecipeTableTableTableManager(_db, _db.recipeTable);
  $$RecipeStepTableTableTableManager get recipeStepTable =>
      $$RecipeStepTableTableTableManager(_db, _db.recipeStepTable);
}
