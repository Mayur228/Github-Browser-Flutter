import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:github_browser/core/di/injection.dart';
import 'package:github_browser/features/question_list/presentation/state/bloc/bloc.dart';
import 'package:github_browser/features/question_list/presentation/widget/question_list_item.dart';

import '../../domain/entity/question_answer_entity.dart';

class QuestionListPage extends StatelessWidget {
  QuestionListPage({Key? key}) : super(key: key);

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => getIt<QuestionAnswerBloc>(),
        child: BlocConsumer<QuestionAnswerBloc, QuestionAnswerState>(
          builder: (context, state) {
            if (state is QuestionAnswerLoadingState) {
              return _buildLoadingView();
            } else if (state is QuestionAnswerLoadErrorState) {
              return _buildErrorView(state.errorMessage);
            } else if (state is QuestionAnswerLoadedState) {
              return _buildLoadedView(context, state.entity.questions);
            }
            return Container();
          },
          listener: (context, state) {
            if (state is QuestionAnswerLoadedState &&
                state.navigation != null) {
              state.navigation?.when(
                answerQuestion: (answerQuestion) async {
                  try {
                    String answer = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Container(
                          color: Colors.white,
                          child: SafeArea(
                            child: Scaffold(
                              body: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    TextField(
                                      controller: textController,
                                      decoration: InputDecoration(
                                        hintText: answerQuestion.question,
                                        border: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.teal,
                                            style: BorderStyle.solid,
                                          ),
                                        ),
                                      ),
                                    ),
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context)
                                            .pop(textController.text);
                                        textController.text = '';
                                      },
                                      child: const Text("Answer"),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                    print("Answer: $answer");
                  } catch (e) {}
                },
              );
            }
          },
        ),
      ),
    );
  }

  Widget _buildLoadingView() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildErrorView(String errorMessage) {
    return Center(
      child: Text(errorMessage),
    );
  }

  Widget _buildLoadedView(
      BuildContext context, List<QuestionAnswerEntity> entity) {
    final bloc = BlocProvider.of<QuestionAnswerBloc>(context);
    return ListView.builder(
      itemBuilder: (context, index) => QuestionListItem(
        entity: entity[index],
        answerQuestion: () {
          bloc.answerQuestion(entity[index]);
        },
      ),
      itemCount: entity.length,
    );
  }
}
