part of 'number_trivia_bloc.dart';

abstract class NumberTriviaState extends Equatable {
  const NumberTriviaState();

  @override
  List<Object> get props => [];
}

class Empty extends NumberTriviaState {}

class Loading extends NumberTriviaState {}

class Loaded extends NumberTriviaState {
  final NumberTrivia numberTrivia;

  Loaded({required this.numberTrivia});

  List<Object> get props => [numberTrivia];
}

class Error extends NumberTriviaState {
  final String message;

  Error({required this.message});

  List<Object> get props => [message];
}
