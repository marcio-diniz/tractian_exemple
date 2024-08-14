import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_exemple/domain/entities/elementsTree/element_tree_entity.dart';
import '../../domain/usecase/interfaces/i_get_assets_tree_by_company_id_usecase.dart';
import 'assets_tree_state.dart';

class AssetsTreeCubit extends Cubit<AssetsTreeState> {
  AssetsTreeCubit({
    required IGetAssetsTreeByCompanyIdUsecase getAssetsTreeByCompanyIdUsecase,
  })  : _getAssetsTreeByCompanyIdUsecase = getAssetsTreeByCompanyIdUsecase,
        super(const AssetsTreeState.initial());
  final IGetAssetsTreeByCompanyIdUsecase _getAssetsTreeByCompanyIdUsecase;

  Timer? debounceTimerToSearch;

  Future<void> getAssetsTreeByCompanyId({
    required String companyId,
  }) async {
    emit(state.copyWith(status: AssetsTreeStatus.loading));
    final eitherStorage =
        await _getAssetsTreeByCompanyIdUsecase(companyId: companyId);
    eitherStorage.fold((failure) {
      emit(state.copyWith(
        status: AssetsTreeStatus.error,
      ));
    }, (success) {
      emit(state.copyWith(
        assetsTree: success,
        status: AssetsTreeStatus.success,
      ));
    });
  }

  Future<void> searchItems() async {
    if ((state.searchTerm?.isEmpty ?? true) &&
        !state.energyFilter &&
        !state.criticalFilter) {
      emit(state.copyWith(
        resultSearch: state.assetsTree?.elements,
      ));
      return;
    }

    final resultSearch = <String, ElementTreeEntity>{};
    for (final element in state.assetsTree?.elements.values.toList() ??
        <ElementTreeEntity>[]) {
      bool passesValidation = true;
      final elementToStringToSearch = element.toStringToSearch();

      if (state.searchTerm?.isNotEmpty ?? false) {
        passesValidation &= elementToStringToSearch.contains(state.searchTerm!);
      }
      if (state.energyFilter == true) {
        passesValidation &=
            elementToStringToSearch.contains('sensorType: energy');
      }
      if (state.criticalFilter == true) {
        passesValidation &=
            elementToStringToSearch.contains('sensorStatusType: alert');
      }

      if (passesValidation) {
        resultSearch[element.id] = element;
      }
    }
    emit(state.copyWith(resultSearch: resultSearch));
  }

  void setSearchTerm(String term) {
    emit(state.copyWith(searchTerm: term.toUpperCase()));
    if (debounceTimerToSearch?.isActive ?? false) {
      debounceTimerToSearch?.cancel();
      debounceTimerToSearch = null;
    }
    debounceTimerToSearch = Timer(
      const Duration(milliseconds: 300),
      searchItems,
    );
  }

  void toggleEnergyFilter() {
    emit(state.copyWith(energyFilter: !state.energyFilter));
    if (debounceTimerToSearch?.isActive ?? false) {
      debounceTimerToSearch?.cancel();
      debounceTimerToSearch = null;
    }
    debounceTimerToSearch = Timer(
      const Duration(milliseconds: 300),
      searchItems,
    );
  }

  void toggleCriticalFilter() {
    emit(state.copyWith(criticalFilter: !state.criticalFilter));
    if (debounceTimerToSearch?.isActive ?? false) {
      debounceTimerToSearch?.cancel();
      debounceTimerToSearch = null;
    }
    debounceTimerToSearch = Timer(
      const Duration(milliseconds: 300),
      searchItems,
    );
  }
}
