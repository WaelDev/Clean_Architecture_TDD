import 'package:equatable/equatable.dart';

abstract class Failures extends Equatable {
  final List<Object> properties;

  const Failures({required this.properties});

  @override
  List<Object> get props => properties;
}

// General Failures
class ServerFailure extends Failures {
  final List<Object> properties;
  ServerFailure(this.properties) : super(properties: properties);
}

class CacheFailure extends Failures {
  final List<Object> properties;
  CacheFailure(this.properties) : super(properties: properties);
}
