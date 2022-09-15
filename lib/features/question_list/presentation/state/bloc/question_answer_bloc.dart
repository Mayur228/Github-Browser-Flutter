import 'dart:math';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/features/question_list/domain/entity/question_answer_entity.dart';
import 'package:github_browser/features/question_list/domain/entity/question_answer_view_entity.dart';
import 'package:github_browser/features/question_list/domain/usecase/get_question_answer_usecase.dart';
import 'package:github_browser/features/question_list/domain/usecase/update_answer_usecase.dart';
import 'package:github_browser/features/question_list/presentation/state/bloc/question_answer_event.dart';
import 'package:github_browser/features/question_list/presentation/state/bloc/question_answer_state.dart';
import 'package:github_browser/features/question_list/presentation/vo/answer_param.dart';
import 'package:injectable/injectable.dart';

import '../../vo/question_answer_navigation.dart';

@injectable
class QuestionAnswerBloc
    extends Bloc<QuestionAnswerEvent, QuestionAnswerState> {
  final GetQuestionAnswerUseCase _getQuestionAnswerUseCase;
  final UpdateAnswerUseCase _updateAnswerUseCase;

  QuestionAnswerBloc(
    this._getQuestionAnswerUseCase,
    this._updateAnswerUseCase,
  ) : super(QuestionAnswerLoadingState()) {
    on<LoadQuestionListEvent>((event, emit) async {
      emit(QuestionAnswerLoadingState());

      final result = await _getQuestionAnswerUseCase();

      final QuestionAnswerState newState = result.when(
        data: (data) =>
            QuestionAnswerLoadedState(entity: QuestionAnswerViewEntity(data)),
        error: (error) => QuestionAnswerLoadErrorState(
            "Error in loading.\n${error.toString()}"),
        pending: () => QuestionAnswerLoadingState(),
      );

      emit(newState);
    });

    on<EnterAnswerEvent>(
      (event, emit) {
        final questionToAnswerFor = event.entity;
        final currentState = state;

        if (currentState is! QuestionAnswerLoadedState) return;

        final currentEntity = currentState.entity;

        emit(
          QuestionAnswerLoadedState(
            entity: currentEntity,
            navigation:
                QuestionAnswerNavigation.answerQuestion(questionToAnswerFor),
          ),
        );
        emit(
          QuestionAnswerLoadedState(
            entity: currentEntity,
            navigation: null,
          ),
        );
      },
    );

    on<UpdateQuestionListEvent>((event, emit) async {
      final result = await _updateAnswerUseCase(event.answerParam);

      final QuestionAnswerState newState = result.when(
        data: (data) =>
            QuestionAnswerLoadedState(entity: QuestionAnswerViewEntity(data)),
        error: (error) => QuestionAnswerLoadErrorState(
            "Error in loading.\n${error.toString()}"),
        pending: () => QuestionAnswerLoadingState(),
      );

      emit(newState);
    });

    add(LoadQuestionListEvent());
  }

  void answerQuestion(QuestionAnswerEntity entity) {
    add(EnterAnswerEvent(entity));
  }

  void updateQuestionList(AnswerParam answerParam) {
    add(UpdateQuestionListEvent(answerParam));
  }
}
