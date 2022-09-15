// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'question_answer_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$QuestionAnswerModel {
  String get question => throw _privateConstructorUsedError;
  String? get answer => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $QuestionAnswerModelCopyWith<QuestionAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $QuestionAnswerModelCopyWith<$Res> {
  factory $QuestionAnswerModelCopyWith(
          QuestionAnswerModel value, $Res Function(QuestionAnswerModel) then) =
      _$QuestionAnswerModelCopyWithImpl<$Res>;
  $Res call({String question, String? answer});
}

/// @nodoc
class _$QuestionAnswerModelCopyWithImpl<$Res>
    implements $QuestionAnswerModelCopyWith<$Res> {
  _$QuestionAnswerModelCopyWithImpl(this._value, this._then);

  final QuestionAnswerModel _value;
  // ignore: unused_field
  final $Res Function(QuestionAnswerModel) _then;

  @override
  $Res call({
    Object? question = freezed,
    Object? answer = freezed,
  }) {
    return _then(_value.copyWith(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$$_QuestionAnswerModelCopyWith<$Res>
    implements $QuestionAnswerModelCopyWith<$Res> {
  factory _$$_QuestionAnswerModelCopyWith(_$_QuestionAnswerModel value,
          $Res Function(_$_QuestionAnswerModel) then) =
      __$$_QuestionAnswerModelCopyWithImpl<$Res>;
  @override
  $Res call({String question, String? answer});
}

/// @nodoc
class __$$_QuestionAnswerModelCopyWithImpl<$Res>
    extends _$QuestionAnswerModelCopyWithImpl<$Res>
    implements _$$_QuestionAnswerModelCopyWith<$Res> {
  __$$_QuestionAnswerModelCopyWithImpl(_$_QuestionAnswerModel _value,
      $Res Function(_$_QuestionAnswerModel) _then)
      : super(_value, (v) => _then(v as _$_QuestionAnswerModel));

  @override
  _$_QuestionAnswerModel get _value => super._value as _$_QuestionAnswerModel;

  @override
  $Res call({
    Object? question = freezed,
    Object? answer = freezed,
  }) {
    return _then(_$_QuestionAnswerModel(
      question: question == freezed
          ? _value.question
          : question // ignore: cast_nullable_to_non_nullable
              as String,
      answer: answer == freezed
          ? _value.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_QuestionAnswerModel implements _QuestionAnswerModel {
  const _$_QuestionAnswerModel({required this.question, this.answer});

  @override
  final String question;
  @override
  final String? answer;

  @override
  String toString() {
    return 'QuestionAnswerModel(question: $question, answer: $answer)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_QuestionAnswerModel &&
            const DeepCollectionEquality().equals(other.question, question) &&
            const DeepCollectionEquality().equals(other.answer, answer));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(question),
      const DeepCollectionEquality().hash(answer));

  @JsonKey(ignore: true)
  @override
  _$$_QuestionAnswerModelCopyWith<_$_QuestionAnswerModel> get copyWith =>
      __$$_QuestionAnswerModelCopyWithImpl<_$_QuestionAnswerModel>(
          this, _$identity);
}

abstract class _QuestionAnswerModel implements QuestionAnswerModel {
  const factory _QuestionAnswerModel(
      {required final String question,
      final String? answer}) = _$_QuestionAnswerModel;

  @override
  String get question;
  @override
  String? get answer;
  @override
  @JsonKey(ignore: true)
  _$$_QuestionAnswerModelCopyWith<_$_QuestionAnswerModel> get copyWith =>
      throw _privateConstructorUsedError;
}
