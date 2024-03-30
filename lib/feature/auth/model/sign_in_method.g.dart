// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in_method.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetSignInMethodModelCollection on Isar {
  IsarCollection<SignInMethodModel> get signInMethodModels => this.collection();
}

const SignInMethodModelSchema = CollectionSchema(
  name: r'SignInMethodModel',
  id: 5404665197034093219,
  properties: {
    r'signInMethod': PropertySchema(
      id: 0,
      name: r'signInMethod',
      type: IsarType.byte,
      enumMap: _SignInMethodModelsignInMethodEnumValueMap,
    )
  },
  estimateSize: _signInMethodModelEstimateSize,
  serialize: _signInMethodModelSerialize,
  deserialize: _signInMethodModelDeserialize,
  deserializeProp: _signInMethodModelDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {},
  getId: _signInMethodModelGetId,
  getLinks: _signInMethodModelGetLinks,
  attach: _signInMethodModelAttach,
  version: '3.1.0+1',
);

int _signInMethodModelEstimateSize(
  SignInMethodModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  return bytesCount;
}

void _signInMethodModelSerialize(
  SignInMethodModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeByte(offsets[0], object.signInMethod.index);
}

SignInMethodModel _signInMethodModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = SignInMethodModel();
  object.id = id;
  object.signInMethod = _SignInMethodModelsignInMethodValueEnumMap[
          reader.readByteOrNull(offsets[0])] ??
      SignInMethod.none;
  return object;
}

P _signInMethodModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (_SignInMethodModelsignInMethodValueEnumMap[
              reader.readByteOrNull(offset)] ??
          SignInMethod.none) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

const _SignInMethodModelsignInMethodEnumValueMap = {
  'none': 0,
  'apple': 1,
  'google': 2,
};
const _SignInMethodModelsignInMethodValueEnumMap = {
  0: SignInMethod.none,
  1: SignInMethod.apple,
  2: SignInMethod.google,
};

Id _signInMethodModelGetId(SignInMethodModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _signInMethodModelGetLinks(
    SignInMethodModel object) {
  return [];
}

void _signInMethodModelAttach(
    IsarCollection<dynamic> col, Id id, SignInMethodModel object) {
  object.id = id;
}

extension SignInMethodModelQueryWhereSort
    on QueryBuilder<SignInMethodModel, SignInMethodModel, QWhere> {
  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension SignInMethodModelQueryWhere
    on QueryBuilder<SignInMethodModel, SignInMethodModel, QWhereClause> {
  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterWhereClause>
      idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SignInMethodModelQueryFilter
    on QueryBuilder<SignInMethodModel, SignInMethodModel, QFilterCondition> {
  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterFilterCondition>
      idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterFilterCondition>
      idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterFilterCondition>
      idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterFilterCondition>
      signInMethodEqualTo(SignInMethod value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'signInMethod',
        value: value,
      ));
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterFilterCondition>
      signInMethodGreaterThan(
    SignInMethod value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'signInMethod',
        value: value,
      ));
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterFilterCondition>
      signInMethodLessThan(
    SignInMethod value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'signInMethod',
        value: value,
      ));
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterFilterCondition>
      signInMethodBetween(
    SignInMethod lower,
    SignInMethod upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'signInMethod',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension SignInMethodModelQueryObject
    on QueryBuilder<SignInMethodModel, SignInMethodModel, QFilterCondition> {}

extension SignInMethodModelQueryLinks
    on QueryBuilder<SignInMethodModel, SignInMethodModel, QFilterCondition> {}

extension SignInMethodModelQuerySortBy
    on QueryBuilder<SignInMethodModel, SignInMethodModel, QSortBy> {
  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterSortBy>
      sortBySignInMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signInMethod', Sort.asc);
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterSortBy>
      sortBySignInMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signInMethod', Sort.desc);
    });
  }
}

extension SignInMethodModelQuerySortThenBy
    on QueryBuilder<SignInMethodModel, SignInMethodModel, QSortThenBy> {
  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterSortBy>
      thenBySignInMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signInMethod', Sort.asc);
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethodModel, QAfterSortBy>
      thenBySignInMethodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'signInMethod', Sort.desc);
    });
  }
}

extension SignInMethodModelQueryWhereDistinct
    on QueryBuilder<SignInMethodModel, SignInMethodModel, QDistinct> {
  QueryBuilder<SignInMethodModel, SignInMethodModel, QDistinct>
      distinctBySignInMethod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'signInMethod');
    });
  }
}

extension SignInMethodModelQueryProperty
    on QueryBuilder<SignInMethodModel, SignInMethodModel, QQueryProperty> {
  QueryBuilder<SignInMethodModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<SignInMethodModel, SignInMethod, QQueryOperations>
      signInMethodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'signInMethod');
    });
  }
}
