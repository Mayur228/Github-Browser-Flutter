// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_answer_navigation.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionAnswerNavigation {
  QuestionAnswerEntity get entity => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QuestionAnswerEntity entity) answerQuestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QuestionAnswerEntity entity)? answerQuestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QuestionAnswerEntity entity)? answerQuestion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnswerQuestion value) answerQuestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AnswerQuestion value)? answerQuestion,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnswerQuestion value)? answerQuestion,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionAnswerNavigationCopyWith<QuestionAnswerNavigation> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionAnswerNavigationCopyWith<$Res> {
  factory $QuestionAnswerNavigationCopyWith(QuestionAnswerNavigation value,
          $Res Function(QuestionAnswerNavigation) then) =
      _$QuestionAnswerNavigationCopyWithImpl<$Res>;
  $Res call({QuestionAnswerEntity entity});
}

/// @nodoc
class _$QuestionAnswerNavigationCopyWithImpl<$Res>
    implements $QuestionAnswerNavigationCopyWith<$Res> {
  _$QuestionAnswerNavigationCopyWithImpl(this._value, this._then);

  final QuestionAnswerNavigation _value;
  // ignore: unused_field
  final $Res Function(QuestionAnswerNavigation) _then;

  @override
  $Res call({
    Object? entity = freezed,
  }) {
    return _then(_value.copyWith(
      entity: entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as QuestionAnswerEntity,
    ));
  }
}

/// @nodoc
abstract class _$$_AnswerQuestionCopyWith<$Res>
    implements $QuestionAnswerNavigationCopyWith<$Res> {
  factory _$$_AnswerQuestionCopyWith(
          _$_AnswerQuestion value, $Res Function(_$_AnswerQuestion) then) =
      __$$_AnswerQuestionCopyWithImpl<$Res>;
  @override
  $Res call({QuestionAnswerEntity entity});
}

/// @nodoc
class __$$_AnswerQuestionCopyWithImpl<$Res>
    extends _$QuestionAnswerNavigationCopyWithImpl<$Res>
    implements _$$_AnswerQuestionCopyWith<$Res> {
  __$$_AnswerQuestionCopyWithImpl(
      _$_AnswerQuestion _value, $Res Function(_$_AnswerQuestion) _then)
      : super(_value, (v) => _then(v as _$_AnswerQuestion));

  @override
  _$_AnswerQuestion get _value => super._value as _$_AnswerQuestion;

  @override
  $Res call({
    Object? entity = freezed,
  }) {
    return _then(_$_AnswerQuestion(
      entity == freezed
          ? _value.entity
          : entity // ignore: cast_nullable_to_non_nullable
              as QuestionAnswerEntity,
    ));
  }
}

/// @nodoc

class _$_AnswerQuestion implements _AnswerQuestion {
  const _$_AnswerQuestion(this.entity);

  @override
  final QuestionAnswerEntity entity;

  @override
  String toString() {
    return 'QuestionAnswerNavigation.answerQuestion(entity: $entity)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AnswerQuestion &&
            const DeepCollectionEquality().equals(other.entity, entity));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(entity));

  @JsonKey(ignore: true)
  @override
  _$$_AnswerQuestionCopyWith<_$_AnswerQuestion> get copyWith =>
      __$$_AnswerQuestionCopyWithImpl<_$_AnswerQuestion>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QuestionAnswerEntity entity) answerQuestion,
  }) {
    return answerQuestion(entity);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(QuestionAnswerEntity entity)? answerQuestion,
  }) {
    return answerQuestion?.call(entity);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QuestionAnswerEntity entity)? answerQuestion,
    required TResult orElse(),
  }) {
    if (answerQuestion != null) {
      return answerQuestion(entity);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AnswerQuestion value) answerQuestion,
  }) {
    return answerQuestion(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_AnswerQuestion value)? answerQuestion,
  }) {
    return answerQuestion?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AnswerQuestion value)? answerQuestion,
    required TResult orElse(),
  }) {
    if (answerQuestion != null) {
      return answerQuestion(this);
    }
    return orElse();
  }
}

abstract class _AnswerQuestion implements QuestionAnswerNavigation {
  const factory _AnswerQuestion(final QuestionAnswerEntity entity) =
      _$_AnswerQuestion;

  @override
  QuestionAnswerEntity get entity;
  @override
  @JsonKey(ignore: true)
  _$$_AnswerQuestionCopyWith<_$_AnswerQuestion> get copyWith =>
      throw _privateConstructorUsedError;
}
