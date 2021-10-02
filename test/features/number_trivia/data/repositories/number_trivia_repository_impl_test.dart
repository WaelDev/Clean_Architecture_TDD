import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:number_trivia_app/core/platform/network_info.dart';
import 'package:number_trivia_app/features/number_trivia/data/datasources/number_trivia_local_data_source.dart';
import 'package:number_trivia_app/features/number_trivia/data/datasources/number_trivia_remote_data_source.dart';
import 'package:number_trivia_app/features/number_trivia/data/repositories/number_trivia_repository_impl.dart';

import 'number_trivia_repository_impl_test.mocks.dart';

@GenerateMocks([NumberTriviaRemoteDataSouce])
@GenerateMocks([NumberTriviaLocalDataSource])
@GenerateMocks([NetworkInfo])
main() {
  NumberTriviaRepositoryImpl repository;

  MockNumberTriviaRemoteDataSouce mockRemoteDataSource;
  MockNumberTriviaLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockNumberTriviaRemoteDataSouce();
    mockLocalDataSource = MockNumberTriviaLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = NumberTriviaRepositoryImpl(
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
    );
  });
}
