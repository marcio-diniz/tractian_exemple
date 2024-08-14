import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_exemple/domain/usecase/interfaces/i_get_companies_list_usecase.dart';
import 'package:tractian_exemple/presentation/controllers/companies_list_state.dart';

class CompaniesListCubit extends Cubit<CompaniesListState> {
  CompaniesListCubit({
    required IGetCompaniesListUsecase getCompaniesListUseCase,
  })  : _getCompaniesListUsecase = getCompaniesListUseCase,
        super(CompaniesListState.initial());
  final IGetCompaniesListUsecase _getCompaniesListUsecase;

  Future<void> getCompaniesList() async {
    emit(state.copyWith(status: CompaniesListStatus.loading));
    final eitherStorage = await _getCompaniesListUsecase();
    eitherStorage.fold((failure) {
      emit(state.copyWith(
        status: CompaniesListStatus.error,
      ));
    }, (success) {
      emit(state.copyWith(
        companies: success,
        status: CompaniesListStatus.success,
      ));
    });
  }
}
