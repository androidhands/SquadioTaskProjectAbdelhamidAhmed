// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class PopularPeopleTableData extends DataClass
    implements Insertable<PopularPeopleTableData> {
  final int id;
  final String? name;
  final int? gender;
  final bool? adult;
  final dynamic? knownFor;
  final String? knownForDepartment;
  final double? popularity;
  final String? profilePath;
  PopularPeopleTableData(
      {required this.id,
      this.name,
      this.gender,
      this.adult,
      this.knownFor,
      this.knownForDepartment,
      this.popularity,
      this.profilePath});
  factory PopularPeopleTableData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return PopularPeopleTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      name: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}name']),
      gender: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}gender']),
      adult: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}adult']),
      knownFor: $PopularPeopleTableTable.$converter0.mapToDart(
          const StringType()
              .mapFromDatabaseResponse(data['${effectivePrefix}known_for'])),
      knownForDepartment: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}known_for_department']),
      popularity: const RealType()
          .mapFromDatabaseResponse(data['${effectivePrefix}popularity']),
      profilePath: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}profile_path']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || name != null) {
      map['name'] = Variable<String?>(name);
    }
    if (!nullToAbsent || gender != null) {
      map['gender'] = Variable<int?>(gender);
    }
    if (!nullToAbsent || adult != null) {
      map['adult'] = Variable<bool?>(adult);
    }
    if (!nullToAbsent || knownFor != null) {
      final converter = $PopularPeopleTableTable.$converter0;
      map['known_for'] = Variable<String?>(converter.mapToSql(knownFor));
    }
    if (!nullToAbsent || knownForDepartment != null) {
      map['known_for_department'] = Variable<String?>(knownForDepartment);
    }
    if (!nullToAbsent || popularity != null) {
      map['popularity'] = Variable<double?>(popularity);
    }
    if (!nullToAbsent || profilePath != null) {
      map['profile_path'] = Variable<String?>(profilePath);
    }
    return map;
  }

  PopularPeopleTableCompanion toCompanion(bool nullToAbsent) {
    return PopularPeopleTableCompanion(
      id: Value(id),
      name: name == null && nullToAbsent ? const Value.absent() : Value(name),
      gender:
          gender == null && nullToAbsent ? const Value.absent() : Value(gender),
      adult:
          adult == null && nullToAbsent ? const Value.absent() : Value(adult),
      knownFor: knownFor == null && nullToAbsent
          ? const Value.absent()
          : Value(knownFor),
      knownForDepartment: knownForDepartment == null && nullToAbsent
          ? const Value.absent()
          : Value(knownForDepartment),
      popularity: popularity == null && nullToAbsent
          ? const Value.absent()
          : Value(popularity),
      profilePath: profilePath == null && nullToAbsent
          ? const Value.absent()
          : Value(profilePath),
    );
  }

  factory PopularPeopleTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PopularPeopleTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String?>(json['name']),
      gender: serializer.fromJson<int?>(json['gender']),
      adult: serializer.fromJson<bool?>(json['adult']),
      knownFor: serializer.fromJson<dynamic?>(json['knownFor']),
      knownForDepartment:
          serializer.fromJson<String?>(json['knownForDepartment']),
      popularity: serializer.fromJson<double?>(json['popularity']),
      profilePath: serializer.fromJson<String?>(json['profilePath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String?>(name),
      'gender': serializer.toJson<int?>(gender),
      'adult': serializer.toJson<bool?>(adult),
      'knownFor': serializer.toJson<dynamic?>(knownFor),
      'knownForDepartment': serializer.toJson<String?>(knownForDepartment),
      'popularity': serializer.toJson<double?>(popularity),
      'profilePath': serializer.toJson<String?>(profilePath),
    };
  }

  PopularPeopleTableData copyWith(
          {int? id,
          String? name,
          int? gender,
          bool? adult,
          dynamic? knownFor,
          String? knownForDepartment,
          double? popularity,
          String? profilePath}) =>
      PopularPeopleTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
        adult: adult ?? this.adult,
        knownFor: knownFor ?? this.knownFor,
        knownForDepartment: knownForDepartment ?? this.knownForDepartment,
        popularity: popularity ?? this.popularity,
        profilePath: profilePath ?? this.profilePath,
      );
  @override
  String toString() {
    return (StringBuffer('PopularPeopleTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('adult: $adult, ')
          ..write('knownFor: $knownFor, ')
          ..write('knownForDepartment: $knownForDepartment, ')
          ..write('popularity: $popularity, ')
          ..write('profilePath: $profilePath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, gender, adult, knownFor,
      knownForDepartment, popularity, profilePath);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PopularPeopleTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.gender == this.gender &&
          other.adult == this.adult &&
          other.knownFor == this.knownFor &&
          other.knownForDepartment == this.knownForDepartment &&
          other.popularity == this.popularity &&
          other.profilePath == this.profilePath);
}

class PopularPeopleTableCompanion
    extends UpdateCompanion<PopularPeopleTableData> {
  final Value<int> id;
  final Value<String?> name;
  final Value<int?> gender;
  final Value<bool?> adult;
  final Value<dynamic?> knownFor;
  final Value<String?> knownForDepartment;
  final Value<double?> popularity;
  final Value<String?> profilePath;
  const PopularPeopleTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.gender = const Value.absent(),
    this.adult = const Value.absent(),
    this.knownFor = const Value.absent(),
    this.knownForDepartment = const Value.absent(),
    this.popularity = const Value.absent(),
    this.profilePath = const Value.absent(),
  });
  PopularPeopleTableCompanion.insert({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.gender = const Value.absent(),
    this.adult = const Value.absent(),
    this.knownFor = const Value.absent(),
    this.knownForDepartment = const Value.absent(),
    this.popularity = const Value.absent(),
    this.profilePath = const Value.absent(),
  });
  static Insertable<PopularPeopleTableData> custom({
    Expression<int>? id,
    Expression<String?>? name,
    Expression<int?>? gender,
    Expression<bool?>? adult,
    Expression<dynamic?>? knownFor,
    Expression<String?>? knownForDepartment,
    Expression<double?>? popularity,
    Expression<String?>? profilePath,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (gender != null) 'gender': gender,
      if (adult != null) 'adult': adult,
      if (knownFor != null) 'known_for': knownFor,
      if (knownForDepartment != null)
        'known_for_department': knownForDepartment,
      if (popularity != null) 'popularity': popularity,
      if (profilePath != null) 'profile_path': profilePath,
    });
  }

  PopularPeopleTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? name,
      Value<int?>? gender,
      Value<bool?>? adult,
      Value<dynamic?>? knownFor,
      Value<String?>? knownForDepartment,
      Value<double?>? popularity,
      Value<String?>? profilePath}) {
    return PopularPeopleTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
      adult: adult ?? this.adult,
      knownFor: knownFor ?? this.knownFor,
      knownForDepartment: knownForDepartment ?? this.knownForDepartment,
      popularity: popularity ?? this.popularity,
      profilePath: profilePath ?? this.profilePath,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String?>(name.value);
    }
    if (gender.present) {
      map['gender'] = Variable<int?>(gender.value);
    }
    if (adult.present) {
      map['adult'] = Variable<bool?>(adult.value);
    }
    if (knownFor.present) {
      final converter = $PopularPeopleTableTable.$converter0;
      map['known_for'] = Variable<String?>(converter.mapToSql(knownFor.value));
    }
    if (knownForDepartment.present) {
      map['known_for_department'] = Variable<String?>(knownForDepartment.value);
    }
    if (popularity.present) {
      map['popularity'] = Variable<double?>(popularity.value);
    }
    if (profilePath.present) {
      map['profile_path'] = Variable<String?>(profilePath.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PopularPeopleTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gender: $gender, ')
          ..write('adult: $adult, ')
          ..write('knownFor: $knownFor, ')
          ..write('knownForDepartment: $knownForDepartment, ')
          ..write('popularity: $popularity, ')
          ..write('profilePath: $profilePath')
          ..write(')'))
        .toString();
  }
}

class $PopularPeopleTableTable extends PopularPeopleTable
    with TableInfo<$PopularPeopleTableTable, PopularPeopleTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PopularPeopleTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String?> name = GeneratedColumn<String?>(
      'name', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  @override
  late final GeneratedColumn<int?> gender = GeneratedColumn<int?>(
      'gender', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _adultMeta = const VerificationMeta('adult');
  @override
  late final GeneratedColumn<bool?> adult = GeneratedColumn<bool?>(
      'adult', aliasedName, true,
      type: const BoolType(),
      requiredDuringInsert: false,
      defaultConstraints: 'CHECK (adult IN (0, 1))');
  final VerificationMeta _knownForMeta = const VerificationMeta('knownFor');
  @override
  late final GeneratedColumnWithTypeConverter<dynamic, String?> knownFor =
      GeneratedColumn<String?>('known_for', aliasedName, true,
              type: const StringType(), requiredDuringInsert: false)
          .withConverter<dynamic>($PopularPeopleTableTable.$converter0);
  final VerificationMeta _knownForDepartmentMeta =
      const VerificationMeta('knownForDepartment');
  @override
  late final GeneratedColumn<String?> knownForDepartment =
      GeneratedColumn<String?>('known_for_department', aliasedName, true,
          type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _popularityMeta = const VerificationMeta('popularity');
  @override
  late final GeneratedColumn<double?> popularity = GeneratedColumn<double?>(
      'popularity', aliasedName, true,
      type: const RealType(), requiredDuringInsert: false);
  final VerificationMeta _profilePathMeta =
      const VerificationMeta('profilePath');
  @override
  late final GeneratedColumn<String?> profilePath = GeneratedColumn<String?>(
      'profile_path', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        gender,
        adult,
        knownFor,
        knownForDepartment,
        popularity,
        profilePath
      ];
  @override
  String get aliasedName => _alias ?? 'popular_people_table';
  @override
  String get actualTableName => 'popular_people_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<PopularPeopleTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    }
    if (data.containsKey('adult')) {
      context.handle(
          _adultMeta, adult.isAcceptableOrUnknown(data['adult']!, _adultMeta));
    }
    context.handle(_knownForMeta, const VerificationResult.success());
    if (data.containsKey('known_for_department')) {
      context.handle(
          _knownForDepartmentMeta,
          knownForDepartment.isAcceptableOrUnknown(
              data['known_for_department']!, _knownForDepartmentMeta));
    }
    if (data.containsKey('popularity')) {
      context.handle(
          _popularityMeta,
          popularity.isAcceptableOrUnknown(
              data['popularity']!, _popularityMeta));
    }
    if (data.containsKey('profile_path')) {
      context.handle(
          _profilePathMeta,
          profilePath.isAcceptableOrUnknown(
              data['profile_path']!, _profilePathMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PopularPeopleTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return PopularPeopleTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $PopularPeopleTableTable createAlias(String alias) {
    return $PopularPeopleTableTable(attachedDatabase, alias);
  }

  static TypeConverter<dynamic, String> $converter0 = const CustomConverter();
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $PopularPeopleTableTable popularPeopleTable =
      $PopularPeopleTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [popularPeopleTable];
}
