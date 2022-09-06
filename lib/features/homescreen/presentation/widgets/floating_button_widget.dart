import 'package:flutter/material.dart';

class FloatingButtonWidget extends StatelessWidget {
  final ValueChanged onClicked;
  const FloatingButtonWidget({Key? key, required this.onClicked}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        onClicked('Clicked');
      },
      child: const Icon(Icons.add),
    );
  }
}
