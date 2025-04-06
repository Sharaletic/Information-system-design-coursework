// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'person_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PersonEvent {
  String get idDepartment => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String idDepartment) load,
    required TResult Function(Person person, String idDepartment) addPerson,
    required TResult Function(String id, String idDepartment) deletePerson,
    required TResult Function(Person person, String idDepartment) updatePerson,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String idDepartment)? load,
    TResult? Function(Person person, String idDepartment)? addPerson,
    TResult? Function(String id, String idDepartment)? deletePerson,
    TResult? Function(Person person, String idDepartment)? updatePerson,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String idDepartment)? load,
    TResult Function(Person person, String idDepartment)? addPerson,
    TResult Function(String id, String idDepartment)? deletePerson,
    TResult Function(Person person, String idDepartment)? updatePerson,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_AddPerson value) addPerson,
    required TResult Function(_DeletePerson value) deletePerson,
    required TResult Function(_UpdatePerson value) updatePerson,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_AddPerson value)? addPerson,
    TResult? Function(_DeletePerson value)? deletePerson,
    TResult? Function(_UpdatePerson value)? updatePerson,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_AddPerson value)? addPerson,
    TResult Function(_DeletePerson value)? deletePerson,
    TResult Function(_UpdatePerson value)? updatePerson,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Create a copy of PersonEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PersonEventCopyWith<PersonEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonEventCopyWith<$Res> {
  factory $PersonEventCopyWith(
          PersonEvent value, $Res Function(PersonEvent) then) =
      _$PersonEventCopyWithImpl<$Res, PersonEvent>;
  @useResult
  $Res call({String idDepartment});
}

/// @nodoc
class _$PersonEventCopyWithImpl<$Res, $Val extends PersonEvent>
    implements $PersonEventCopyWith<$Res> {
  _$PersonEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDepartment = null,
  }) {
    return _then(_value.copyWith(
      idDepartment: null == idDepartment
          ? _value.idDepartment
          : idDepartment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoadImplCopyWith<$Res> implements $PersonEventCopyWith<$Res> {
  factory _$$LoadImplCopyWith(
          _$LoadImpl value, $Res Function(_$LoadImpl) then) =
      __$$LoadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String idDepartment});
}

/// @nodoc
class __$$LoadImplCopyWithImpl<$Res>
    extends _$PersonEventCopyWithImpl<$Res, _$LoadImpl>
    implements _$$LoadImplCopyWith<$Res> {
  __$$LoadImplCopyWithImpl(_$LoadImpl _value, $Res Function(_$LoadImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? idDepartment = null,
  }) {
    return _then(_$LoadImpl(
      idDepartment: null == idDepartment
          ? _value.idDepartment
          : idDepartment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$LoadImpl implements _Load {
  const _$LoadImpl({required this.idDepartment});

  @override
  final String idDepartment;

  @override
  String toString() {
    return 'PersonEvent.load(idDepartment: $idDepartment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadImpl &&
            (identical(other.idDepartment, idDepartment) ||
                other.idDepartment == idDepartment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, idDepartment);

  /// Create a copy of PersonEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      __$$LoadImplCopyWithImpl<_$LoadImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String idDepartment) load,
    required TResult Function(Person person, String idDepartment) addPerson,
    required TResult Function(String id, String idDepartment) deletePerson,
    required TResult Function(Person person, String idDepartment) updatePerson,
  }) {
    return load(idDepartment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String idDepartment)? load,
    TResult? Function(Person person, String idDepartment)? addPerson,
    TResult? Function(String id, String idDepartment)? deletePerson,
    TResult? Function(Person person, String idDepartment)? updatePerson,
  }) {
    return load?.call(idDepartment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String idDepartment)? load,
    TResult Function(Person person, String idDepartment)? addPerson,
    TResult Function(String id, String idDepartment)? deletePerson,
    TResult Function(Person person, String idDepartment)? updatePerson,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(idDepartment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_AddPerson value) addPerson,
    required TResult Function(_DeletePerson value) deletePerson,
    required TResult Function(_UpdatePerson value) updatePerson,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_AddPerson value)? addPerson,
    TResult? Function(_DeletePerson value)? deletePerson,
    TResult? Function(_UpdatePerson value)? updatePerson,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_AddPerson value)? addPerson,
    TResult Function(_DeletePerson value)? deletePerson,
    TResult Function(_UpdatePerson value)? updatePerson,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class _Load implements PersonEvent {
  const factory _Load({required final String idDepartment}) = _$LoadImpl;

  @override
  String get idDepartment;

  /// Create a copy of PersonEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadImplCopyWith<_$LoadImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddPersonImplCopyWith<$Res>
    implements $PersonEventCopyWith<$Res> {
  factory _$$AddPersonImplCopyWith(
          _$AddPersonImpl value, $Res Function(_$AddPersonImpl) then) =
      __$$AddPersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Person person, String idDepartment});
}

/// @nodoc
class __$$AddPersonImplCopyWithImpl<$Res>
    extends _$PersonEventCopyWithImpl<$Res, _$AddPersonImpl>
    implements _$$AddPersonImplCopyWith<$Res> {
  __$$AddPersonImplCopyWithImpl(
      _$AddPersonImpl _value, $Res Function(_$AddPersonImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
    Object? idDepartment = null,
  }) {
    return _then(_$AddPersonImpl(
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      idDepartment: null == idDepartment
          ? _value.idDepartment
          : idDepartment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$AddPersonImpl implements _AddPerson {
  const _$AddPersonImpl({required this.person, required this.idDepartment});

  @override
  final Person person;
  @override
  final String idDepartment;

  @override
  String toString() {
    return 'PersonEvent.addPerson(person: $person, idDepartment: $idDepartment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPersonImpl &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.idDepartment, idDepartment) ||
                other.idDepartment == idDepartment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, person, idDepartment);

  /// Create a copy of PersonEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPersonImplCopyWith<_$AddPersonImpl> get copyWith =>
      __$$AddPersonImplCopyWithImpl<_$AddPersonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String idDepartment) load,
    required TResult Function(Person person, String idDepartment) addPerson,
    required TResult Function(String id, String idDepartment) deletePerson,
    required TResult Function(Person person, String idDepartment) updatePerson,
  }) {
    return addPerson(person, idDepartment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String idDepartment)? load,
    TResult? Function(Person person, String idDepartment)? addPerson,
    TResult? Function(String id, String idDepartment)? deletePerson,
    TResult? Function(Person person, String idDepartment)? updatePerson,
  }) {
    return addPerson?.call(person, idDepartment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String idDepartment)? load,
    TResult Function(Person person, String idDepartment)? addPerson,
    TResult Function(String id, String idDepartment)? deletePerson,
    TResult Function(Person person, String idDepartment)? updatePerson,
    required TResult orElse(),
  }) {
    if (addPerson != null) {
      return addPerson(person, idDepartment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_AddPerson value) addPerson,
    required TResult Function(_DeletePerson value) deletePerson,
    required TResult Function(_UpdatePerson value) updatePerson,
  }) {
    return addPerson(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_AddPerson value)? addPerson,
    TResult? Function(_DeletePerson value)? deletePerson,
    TResult? Function(_UpdatePerson value)? updatePerson,
  }) {
    return addPerson?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_AddPerson value)? addPerson,
    TResult Function(_DeletePerson value)? deletePerson,
    TResult Function(_UpdatePerson value)? updatePerson,
    required TResult orElse(),
  }) {
    if (addPerson != null) {
      return addPerson(this);
    }
    return orElse();
  }
}

abstract class _AddPerson implements PersonEvent {
  const factory _AddPerson(
      {required final Person person,
      required final String idDepartment}) = _$AddPersonImpl;

  Person get person;
  @override
  String get idDepartment;

  /// Create a copy of PersonEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddPersonImplCopyWith<_$AddPersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DeletePersonImplCopyWith<$Res>
    implements $PersonEventCopyWith<$Res> {
  factory _$$DeletePersonImplCopyWith(
          _$DeletePersonImpl value, $Res Function(_$DeletePersonImpl) then) =
      __$$DeletePersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String idDepartment});
}

/// @nodoc
class __$$DeletePersonImplCopyWithImpl<$Res>
    extends _$PersonEventCopyWithImpl<$Res, _$DeletePersonImpl>
    implements _$$DeletePersonImplCopyWith<$Res> {
  __$$DeletePersonImplCopyWithImpl(
      _$DeletePersonImpl _value, $Res Function(_$DeletePersonImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? idDepartment = null,
  }) {
    return _then(_$DeletePersonImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      idDepartment: null == idDepartment
          ? _value.idDepartment
          : idDepartment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$DeletePersonImpl implements _DeletePerson {
  const _$DeletePersonImpl({required this.id, required this.idDepartment});

  @override
  final String id;
  @override
  final String idDepartment;

  @override
  String toString() {
    return 'PersonEvent.deletePerson(id: $id, idDepartment: $idDepartment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeletePersonImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.idDepartment, idDepartment) ||
                other.idDepartment == idDepartment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, idDepartment);

  /// Create a copy of PersonEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DeletePersonImplCopyWith<_$DeletePersonImpl> get copyWith =>
      __$$DeletePersonImplCopyWithImpl<_$DeletePersonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String idDepartment) load,
    required TResult Function(Person person, String idDepartment) addPerson,
    required TResult Function(String id, String idDepartment) deletePerson,
    required TResult Function(Person person, String idDepartment) updatePerson,
  }) {
    return deletePerson(id, idDepartment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String idDepartment)? load,
    TResult? Function(Person person, String idDepartment)? addPerson,
    TResult? Function(String id, String idDepartment)? deletePerson,
    TResult? Function(Person person, String idDepartment)? updatePerson,
  }) {
    return deletePerson?.call(id, idDepartment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String idDepartment)? load,
    TResult Function(Person person, String idDepartment)? addPerson,
    TResult Function(String id, String idDepartment)? deletePerson,
    TResult Function(Person person, String idDepartment)? updatePerson,
    required TResult orElse(),
  }) {
    if (deletePerson != null) {
      return deletePerson(id, idDepartment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_AddPerson value) addPerson,
    required TResult Function(_DeletePerson value) deletePerson,
    required TResult Function(_UpdatePerson value) updatePerson,
  }) {
    return deletePerson(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_AddPerson value)? addPerson,
    TResult? Function(_DeletePerson value)? deletePerson,
    TResult? Function(_UpdatePerson value)? updatePerson,
  }) {
    return deletePerson?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_AddPerson value)? addPerson,
    TResult Function(_DeletePerson value)? deletePerson,
    TResult Function(_UpdatePerson value)? updatePerson,
    required TResult orElse(),
  }) {
    if (deletePerson != null) {
      return deletePerson(this);
    }
    return orElse();
  }
}

abstract class _DeletePerson implements PersonEvent {
  const factory _DeletePerson(
      {required final String id,
      required final String idDepartment}) = _$DeletePersonImpl;

  String get id;
  @override
  String get idDepartment;

  /// Create a copy of PersonEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DeletePersonImplCopyWith<_$DeletePersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UpdatePersonImplCopyWith<$Res>
    implements $PersonEventCopyWith<$Res> {
  factory _$$UpdatePersonImplCopyWith(
          _$UpdatePersonImpl value, $Res Function(_$UpdatePersonImpl) then) =
      __$$UpdatePersonImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Person person, String idDepartment});
}

/// @nodoc
class __$$UpdatePersonImplCopyWithImpl<$Res>
    extends _$PersonEventCopyWithImpl<$Res, _$UpdatePersonImpl>
    implements _$$UpdatePersonImplCopyWith<$Res> {
  __$$UpdatePersonImplCopyWithImpl(
      _$UpdatePersonImpl _value, $Res Function(_$UpdatePersonImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
    Object? idDepartment = null,
  }) {
    return _then(_$UpdatePersonImpl(
      person: null == person
          ? _value.person
          : person // ignore: cast_nullable_to_non_nullable
              as Person,
      idDepartment: null == idDepartment
          ? _value.idDepartment
          : idDepartment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$UpdatePersonImpl implements _UpdatePerson {
  const _$UpdatePersonImpl({required this.person, required this.idDepartment});

  @override
  final Person person;
  @override
  final String idDepartment;

  @override
  String toString() {
    return 'PersonEvent.updatePerson(person: $person, idDepartment: $idDepartment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UpdatePersonImpl &&
            (identical(other.person, person) || other.person == person) &&
            (identical(other.idDepartment, idDepartment) ||
                other.idDepartment == idDepartment));
  }

  @override
  int get hashCode => Object.hash(runtimeType, person, idDepartment);

  /// Create a copy of PersonEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UpdatePersonImplCopyWith<_$UpdatePersonImpl> get copyWith =>
      __$$UpdatePersonImplCopyWithImpl<_$UpdatePersonImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String idDepartment) load,
    required TResult Function(Person person, String idDepartment) addPerson,
    required TResult Function(String id, String idDepartment) deletePerson,
    required TResult Function(Person person, String idDepartment) updatePerson,
  }) {
    return updatePerson(person, idDepartment);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String idDepartment)? load,
    TResult? Function(Person person, String idDepartment)? addPerson,
    TResult? Function(String id, String idDepartment)? deletePerson,
    TResult? Function(Person person, String idDepartment)? updatePerson,
  }) {
    return updatePerson?.call(person, idDepartment);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String idDepartment)? load,
    TResult Function(Person person, String idDepartment)? addPerson,
    TResult Function(String id, String idDepartment)? deletePerson,
    TResult Function(Person person, String idDepartment)? updatePerson,
    required TResult orElse(),
  }) {
    if (updatePerson != null) {
      return updatePerson(person, idDepartment);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_AddPerson value) addPerson,
    required TResult Function(_DeletePerson value) deletePerson,
    required TResult Function(_UpdatePerson value) updatePerson,
  }) {
    return updatePerson(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_AddPerson value)? addPerson,
    TResult? Function(_DeletePerson value)? deletePerson,
    TResult? Function(_UpdatePerson value)? updatePerson,
  }) {
    return updatePerson?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_AddPerson value)? addPerson,
    TResult Function(_DeletePerson value)? deletePerson,
    TResult Function(_UpdatePerson value)? updatePerson,
    required TResult orElse(),
  }) {
    if (updatePerson != null) {
      return updatePerson(this);
    }
    return orElse();
  }
}

abstract class _UpdatePerson implements PersonEvent {
  const factory _UpdatePerson(
      {required final Person person,
      required final String idDepartment}) = _$UpdatePersonImpl;

  Person get person;
  @override
  String get idDepartment;

  /// Create a copy of PersonEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UpdatePersonImplCopyWith<_$UpdatePersonImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PersonState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Person> person) loaded,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Person> person)? loaded,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Person> person)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonStateCopyWith<$Res> {
  factory $PersonStateCopyWith(
          PersonState value, $Res Function(PersonState) then) =
      _$PersonStateCopyWithImpl<$Res, PersonState>;
}

/// @nodoc
class _$PersonStateCopyWithImpl<$Res, $Val extends PersonState>
    implements $PersonStateCopyWith<$Res> {
  _$PersonStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PersonState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$PersonStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'PersonState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Person> person) loaded,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Person> person)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Person> person)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements PersonState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$LoadedImplCopyWith<$Res> {
  factory _$$LoadedImplCopyWith(
          _$LoadedImpl value, $Res Function(_$LoadedImpl) then) =
      __$$LoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<Person> person});
}

/// @nodoc
class __$$LoadedImplCopyWithImpl<$Res>
    extends _$PersonStateCopyWithImpl<$Res, _$LoadedImpl>
    implements _$$LoadedImplCopyWith<$Res> {
  __$$LoadedImplCopyWithImpl(
      _$LoadedImpl _value, $Res Function(_$LoadedImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? person = null,
  }) {
    return _then(_$LoadedImpl(
      person: null == person
          ? _value._person
          : person // ignore: cast_nullable_to_non_nullable
              as List<Person>,
    ));
  }
}

/// @nodoc

class _$LoadedImpl implements _Loaded {
  const _$LoadedImpl({required final List<Person> person}) : _person = person;

  final List<Person> _person;
  @override
  List<Person> get person {
    if (_person is EqualUnmodifiableListView) return _person;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_person);
  }

  @override
  String toString() {
    return 'PersonState.loaded(person: $person)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoadedImpl &&
            const DeepCollectionEquality().equals(other._person, _person));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_person));

  /// Create a copy of PersonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      __$$LoadedImplCopyWithImpl<_$LoadedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Person> person) loaded,
    required TResult Function(String message) failure,
  }) {
    return loaded(person);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Person> person)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return loaded?.call(person);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Person> person)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(person);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _Loaded implements PersonState {
  const factory _Loaded({required final List<Person> person}) = _$LoadedImpl;

  List<Person> get person;

  /// Create a copy of PersonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LoadedImplCopyWith<_$LoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$PersonStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  /// Create a copy of PersonState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureImpl(
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'PersonState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of PersonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Person> person) loaded,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? loading,
    TResult? Function(List<Person> person)? loaded,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Person> person)? loaded,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements PersonState {
  const factory _Failure({required final String message}) = _$FailureImpl;

  String get message;

  /// Create a copy of PersonState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
