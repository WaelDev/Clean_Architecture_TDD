import 'package:dartz/dartz.dart';

import '../error/failures.dart';

class InputConverter {
  Either<Failures, int> stringToUnsignedInteger(String str) {
    try {
      var integer = int.parse(str);
      if (integer < 0) throw FormatException();
      return Right(integer);
    } on FormatException {
      return Left(InvalidInuptFailure());
    }
  }
}

class InvalidInuptFailure extends Failures {}
