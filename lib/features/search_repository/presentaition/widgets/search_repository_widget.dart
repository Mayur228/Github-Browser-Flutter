import 'package:flutter/material.dart';
import 'package:github_browser/features/search_repository/presentaition/widgets/seach_button_widget.dart';
import 'package:github_browser/features/search_repository/presentaition/widgets/text_field_widget.dart';

class SearchRepositoryWidget extends StatelessWidget {
  // final ValueChanged ownerName;
  // final ValueChanged repositoryName;
  final ValueChanged onSearch;

  SearchRepositoryWidget(
      {Key? key, required this.onSearch})
      : super(key: key);

  TextEditingController ownerTextController = TextEditingController();
  TextEditingController repositoryTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextFieldWidget(
              hintText: 'Enter owner name',
              textEditingController: ownerTextController),
          const SizedBox(
            height: 15,
          ),
          TextFieldWidget(
              hintText: 'Enter repository name',
              textEditingController: repositoryTextController),
          const SizedBox(
            height: 15,
          ),
          SearchButtonWidget(
            buttonText: 'Search',
            onPressed: (val) {
              if (val != null) {
                final List<String> searchParam;
                searchParam = [ownerTextController.text,repositoryTextController.text];
                onSearch(searchParam);
              }
            },
          )
        ],
      ),
    );
  }
}
