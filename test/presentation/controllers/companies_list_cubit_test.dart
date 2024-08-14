import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:tractian_exemple/domain/entities/company_entity.dart';
import 'package:tractian_exemple/domain/usecase/interfaces/i_get_companies_list_usecase.dart';
import 'package:tractian_exemple/presentation/controllers/companies_list_cubit.dart';
import 'package:tractian_exemple/presentation/controllers/companies_list_state.dart';

class MockGetCompaniesListUsecase extends Mock
    implements IGetCompaniesListUsecase {}

void main() {
  late MockGetCompaniesListUsecase mockGetCompaniesListUsecase;
  late CompaniesListCubit cubit;
  late CompaniesListState stateInitial;
  late CompaniesListState stateLoading;

  setUp(() {
    mockGetCompaniesListUsecase = MockGetCompaniesListUsecase();

    stateInitial = CompaniesListState.initial();

    stateLoading = stateInitial.copyWith(
      status: CompaniesListStatus.loading,
    );

    cubit = CompaniesListCubit(
      getCompaniesListUseCase: mockGetCompaniesListUsecase,
    );
  });

  test(
    'should be am initial state',
    () {
      expect(cubit.state, equals(stateInitial));
    },
  );

  group('getCompaniesListCubit', () {
    const List<CompanyEntity> companyResponse = [
      CompanyEntity(
        id: 'id',
        name: 'name',
      ),
      CompanyEntity(
        id: 'id',
        name: 'name',
      )
    ];
    final exception = Exception();

    blocTest<CompaniesListCubit, CompaniesListState>(
      'should get a List<CompanyEntity> and emit CompaniesListStatus.success when calling IGetCompaniesListUsecase',
      build: () => cubit,
      setUp: () {
        when(() => mockGetCompaniesListUsecase.call()).thenAnswer((_) async =>
            const Right<Exception, List<CompanyEntity>>(companyResponse));
      },
      act: (cubit) {
        return cubit.getCompaniesList();
      },
      verify: (_) async {
        verify(
          () {
            mockGetCompaniesListUsecase();
          },
        ).called(1);
      },
      expect: () {
        final stateComplete = stateInitial.copyWith(
          status: CompaniesListStatus.success,
          companies: companyResponse,
        );
        return [
          stateLoading,
          stateComplete,
        ];
      },
    );

    blocTest<CompaniesListCubit, CompaniesListState>(
      'should get a Exception() and issue CompaniesListStatus.error when calling IGetCompaniesListUsecase',
      build: () => cubit,
      setUp: () {
        when(() => mockGetCompaniesListUsecase.call()).thenAnswer(
            (_) async => Left<Exception, List<CompanyEntity>>(exception));
      },
      act: (cubit) {
        return cubit.getCompaniesList();
      },
      verify: (_) async {
        verify(
          () {
            mockGetCompaniesListUsecase();
          },
        ).called(1);
      },
      expect: () {
        final stateError =
            stateLoading.copyWith(status: CompaniesListStatus.error);
        return [
          stateLoading,
          stateError,
        ];
      },
    );
  });
}
