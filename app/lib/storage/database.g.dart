// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class ScansTableData extends DataClass implements Insertable<ScansTableData> {
  final int id;
  final String websiteThreatType;
  final String url;
  final int httpCode;
  final bool cleanResult;
  final int virusFoundCount;
  ScansTableData(
      {required this.id,
      required this.websiteThreatType,
      required this.url,
      required this.httpCode,
      required this.cleanResult,
      required this.virusFoundCount});
  factory ScansTableData.fromData(Map<String, dynamic> data, {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return ScansTableData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      websiteThreatType: const StringType().mapFromDatabaseResponse(
          data['${effectivePrefix}website_threat_type'])!,
      url: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}url'])!,
      httpCode: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}http_code'])!,
      cleanResult: const BoolType()
          .mapFromDatabaseResponse(data['${effectivePrefix}clean_result'])!,
      virusFoundCount: const IntType().mapFromDatabaseResponse(
          data['${effectivePrefix}virus_found_count'])!,
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['website_threat_type'] = Variable<String>(websiteThreatType);
    map['url'] = Variable<String>(url);
    map['http_code'] = Variable<int>(httpCode);
    map['clean_result'] = Variable<bool>(cleanResult);
    map['virus_found_count'] = Variable<int>(virusFoundCount);
    return map;
  }

  ScansTableCompanion toCompanion(bool nullToAbsent) {
    return ScansTableCompanion(
      id: Value(id),
      websiteThreatType: Value(websiteThreatType),
      url: Value(url),
      httpCode: Value(httpCode),
      cleanResult: Value(cleanResult),
      virusFoundCount: Value(virusFoundCount),
    );
  }

  factory ScansTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ScansTableData(
      id: serializer.fromJson<int>(json['id']),
      websiteThreatType: serializer.fromJson<String>(json['websiteThreatType']),
      url: serializer.fromJson<String>(json['url']),
      httpCode: serializer.fromJson<int>(json['httpCode']),
      cleanResult: serializer.fromJson<bool>(json['cleanResult']),
      virusFoundCount: serializer.fromJson<int>(json['virusFoundCount']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'websiteThreatType': serializer.toJson<String>(websiteThreatType),
      'url': serializer.toJson<String>(url),
      'httpCode': serializer.toJson<int>(httpCode),
      'cleanResult': serializer.toJson<bool>(cleanResult),
      'virusFoundCount': serializer.toJson<int>(virusFoundCount),
    };
  }

  ScansTableData copyWith(
          {int? id,
          String? websiteThreatType,
          String? url,
          int? httpCode,
          bool? cleanResult,
          int? virusFoundCount}) =>
      ScansTableData(
        id: id ?? this.id,
        websiteThreatType: websiteThreatType ?? this.websiteThreatType,
        url: url ?? this.url,
        httpCode: httpCode ?? this.httpCode,
        cleanResult: cleanResult ?? this.cleanResult,
        virusFoundCount: virusFoundCount ?? this.virusFoundCount,
      );
  @override
  String toString() {
    return (StringBuffer('ScansTableData(')
          ..write('id: $id, ')
          ..write('websiteThreatType: $websiteThreatType, ')
          ..write('url: $url, ')
          ..write('httpCode: $httpCode, ')
          ..write('cleanResult: $cleanResult, ')
          ..write('virusFoundCount: $virusFoundCount')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, websiteThreatType, url, httpCode, cleanResult, virusFoundCount);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ScansTableData &&
          other.id == this.id &&
          other.websiteThreatType == this.websiteThreatType &&
          other.url == this.url &&
          other.httpCode == this.httpCode &&
          other.cleanResult == this.cleanResult &&
          other.virusFoundCount == this.virusFoundCount);
}

class ScansTableCompanion extends UpdateCompanion<ScansTableData> {
  final Value<int> id;
  final Value<String> websiteThreatType;
  final Value<String> url;
  final Value<int> httpCode;
  final Value<bool> cleanResult;
  final Value<int> virusFoundCount;
  const ScansTableCompanion({
    this.id = const Value.absent(),
    this.websiteThreatType = const Value.absent(),
    this.url = const Value.absent(),
    this.httpCode = const Value.absent(),
    this.cleanResult = const Value.absent(),
    this.virusFoundCount = const Value.absent(),
  });
  ScansTableCompanion.insert({
    this.id = const Value.absent(),
    required String websiteThreatType,
    required String url,
    required int httpCode,
    required bool cleanResult,
    required int virusFoundCount,
  })  : websiteThreatType = Value(websiteThreatType),
        url = Value(url),
        httpCode = Value(httpCode),
        cleanResult = Value(cleanResult),
        virusFoundCount = Value(virusFoundCount);
  static Insertable<ScansTableData> custom({
    Expression<int>? id,
    Expression<String>? websiteThreatType,
    Expression<String>? url,
    Expression<int>? httpCode,
    Expression<bool>? cleanResult,
    Expression<int>? virusFoundCount,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (websiteThreatType != null) 'website_threat_type': websiteThreatType,
      if (url != null) 'url': url,
      if (httpCode != null) 'http_code': httpCode,
      if (cleanResult != null) 'clean_result': cleanResult,
      if (virusFoundCount != null) 'virus_found_count': virusFoundCount,
    });
  }

  ScansTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? websiteThreatType,
      Value<String>? url,
      Value<int>? httpCode,
      Value<bool>? cleanResult,
      Value<int>? virusFoundCount}) {
    return ScansTableCompanion(
      id: id ?? this.id,
      websiteThreatType: websiteThreatType ?? this.websiteThreatType,
      url: url ?? this.url,
      httpCode: httpCode ?? this.httpCode,
      cleanResult: cleanResult ?? this.cleanResult,
      virusFoundCount: virusFoundCount ?? this.virusFoundCount,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (websiteThreatType.present) {
      map['website_threat_type'] = Variable<String>(websiteThreatType.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (httpCode.present) {
      map['http_code'] = Variable<int>(httpCode.value);
    }
    if (cleanResult.present) {
      map['clean_result'] = Variable<bool>(cleanResult.value);
    }
    if (virusFoundCount.present) {
      map['virus_found_count'] = Variable<int>(virusFoundCount.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ScansTableCompanion(')
          ..write('id: $id, ')
          ..write('websiteThreatType: $websiteThreatType, ')
          ..write('url: $url, ')
          ..write('httpCode: $httpCode, ')
          ..write('cleanResult: $cleanResult, ')
          ..write('virusFoundCount: $virusFoundCount')
          ..write(')'))
        .toString();
  }
}

class $ScansTableTable extends ScansTable
    with TableInfo<$ScansTableTable, ScansTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ScansTableTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _websiteThreatTypeMeta =
      const VerificationMeta('websiteThreatType');
  @override
  late final GeneratedColumn<String?> websiteThreatType =
      GeneratedColumn<String?>('website_threat_type', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(
              minTextLength: 4, maxTextLength: 2048),
          type: const StringType(),
          requiredDuringInsert: true);
  final VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String?> url = GeneratedColumn<String?>(
      'url', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(
          minTextLength: 4, maxTextLength: 2048),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _httpCodeMeta = const VerificationMeta('httpCode');
  @override
  late final GeneratedColumn<int?> httpCode = GeneratedColumn<int?>(
      'http_code', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  final VerificationMeta _cleanResultMeta =
      const VerificationMeta('cleanResult');
  @override
  late final GeneratedColumn<bool?> cleanResult = GeneratedColumn<bool?>(
      'clean_result', aliasedName, false,
      type: const BoolType(),
      requiredDuringInsert: true,
      defaultConstraints: 'CHECK (clean_result IN (0, 1))');
  final VerificationMeta _virusFoundCountMeta =
      const VerificationMeta('virusFoundCount');
  @override
  late final GeneratedColumn<int?> virusFoundCount = GeneratedColumn<int?>(
      'virus_found_count', aliasedName, false,
      type: const IntType(), requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, websiteThreatType, url, httpCode, cleanResult, virusFoundCount];
  @override
  String get aliasedName => _alias ?? 'scans_table';
  @override
  String get actualTableName => 'scans_table';
  @override
  VerificationContext validateIntegrity(Insertable<ScansTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('website_threat_type')) {
      context.handle(
          _websiteThreatTypeMeta,
          websiteThreatType.isAcceptableOrUnknown(
              data['website_threat_type']!, _websiteThreatTypeMeta));
    } else if (isInserting) {
      context.missing(_websiteThreatTypeMeta);
    }
    if (data.containsKey('url')) {
      context.handle(
          _urlMeta, url.isAcceptableOrUnknown(data['url']!, _urlMeta));
    } else if (isInserting) {
      context.missing(_urlMeta);
    }
    if (data.containsKey('http_code')) {
      context.handle(_httpCodeMeta,
          httpCode.isAcceptableOrUnknown(data['http_code']!, _httpCodeMeta));
    } else if (isInserting) {
      context.missing(_httpCodeMeta);
    }
    if (data.containsKey('clean_result')) {
      context.handle(
          _cleanResultMeta,
          cleanResult.isAcceptableOrUnknown(
              data['clean_result']!, _cleanResultMeta));
    } else if (isInserting) {
      context.missing(_cleanResultMeta);
    }
    if (data.containsKey('virus_found_count')) {
      context.handle(
          _virusFoundCountMeta,
          virusFoundCount.isAcceptableOrUnknown(
              data['virus_found_count']!, _virusFoundCountMeta));
    } else if (isInserting) {
      context.missing(_virusFoundCountMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ScansTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return ScansTableData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $ScansTableTable createAlias(String alias) {
    return $ScansTableTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $ScansTableTable scansTable = $ScansTableTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [scansTable];
}
