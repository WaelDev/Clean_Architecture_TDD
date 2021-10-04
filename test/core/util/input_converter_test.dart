import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:number_trivia_app/core/util/input_converter.dart';

void main() {
  late InputConverter inputConverter;

  setUp(() {
    inputConverter = InputConverter();
  });

  group('stringToUnsignedInt', () {
    test(
      'should return an integer when the string represents an unsigned integer',
      () async {
        // arrange
        final str = '123';

        // act
        var result = inputConverter.stringToUnsignedInteger(str);

        // assert
        expect(result, Right(123));
      },
    );

    test(
      'should return a failure when the string is not an integer',
      () async {
        // arrange
        final str = 'abc';

        // act
        var result = inputConverter.stringToUnsignedInteger(str);

        // assert
        expect(result, Left(InvalidInuptFailure()));
      },
    );

    test(
      'should return a failure when the string is a negative integer',
      () async {
        // arrange
        final str = '-123';

        // act
        var result = inputConverter.stringToUnsignedInteger(str);

        // assert
        expect(result, Left(InvalidInuptFailure()));
      },
    );
  });
}
