import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/number_trivia_bloc.dart';

class TriviaControls extends StatelessWidget {
  TriviaControls({
    Key? key,
  }) : super(key: key);

  final _inputController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void dispatchConcrete(BuildContext context) {
    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
      BlocProvider.of<NumberTriviaBloc>(context).add(
        GetTriviaForConcreteNumber(_inputController.text),
      );
    }
    _inputController.clear();
    // dismiss keyboard on screen
    FocusScope.of(context).unfocus();
  }

  void dispatchRandom(BuildContext context) {
    BlocProvider.of<NumberTriviaBloc>(context).add(
      GetTriviaForRandomNumber(),
    );
    _inputController.clear();
    // dismiss keyboard on screen
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Form(
          key: _formKey,
          child: TextFormField(
            validator: (value) {
              if (value != null && value.isEmpty) {
                return 'enter a number please';
              }
            },
            controller: _inputController,
            keyboardType: TextInputType.number,
            onFieldSubmitted: (value) => dispatchConcrete(context),
            decoration: InputDecoration(
              hintText: 'Input Number',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  onPressed: () {
                    dispatchConcrete(context);
                  },
                  child: Text(
                    'Search',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 45,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.grey.shade300,
                  ),
                  onPressed: () {
                    dispatchRandom(context);
                  },
                  child: Text(
                    'Get Random Trivia',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
