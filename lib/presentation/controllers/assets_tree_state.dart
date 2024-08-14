import 'package:equatable/equatable.dart';
import 'package:tractian_exemple/domain/entities/elementsTree/element_tree_entity.dart';

import '../../domain/entities/elementsTree/assets_tree_entity.dart';

enum AssetsTreeStatus {
  initial,
  loading,
  error,
  success,
}

class AssetsTreeState extends Equatable {
  const AssetsTreeState._({
    this.assetsTree,
    this.resultSearch,
    this.searchTerm,
    required this.energyFilter,
    required this.criticalFilter,
    required this.status,
  });

  final AssetsTreeEntity? assetsTree;
  final Map<String, ElementTreeEntity>? resultSearch;
  final String? searchTerm;
  final bool energyFilter;
  final bool criticalFilter;
  final AssetsTreeStatus status;

  const AssetsTreeState.initial()
      : this._(
          energyFilter: false,
          criticalFilter: false,
          status: AssetsTreeStatus.initial,
        );

  @override
  List<Object?> get props => [
        assetsTree,
        searchTerm,
        resultSearch,
        energyFilter,
        criticalFilter,
        status,
      ];

  AssetsTreeState copyWith({
    AssetsTreeEntity? assetsTree,
    Map<String, ElementTreeEntity>? resultSearch,
    String? searchTerm,
    bool? energyFilter,
    bool? criticalFilter,
    AssetsTreeStatus? status,
  }) =>
      AssetsTreeState._(
        assetsTree: assetsTree ?? this.assetsTree,
        resultSearch: resultSearch ?? this.resultSearch,
        searchTerm: searchTerm ?? this.searchTerm,
        energyFilter: energyFilter ?? this.energyFilter,
        criticalFilter: criticalFilter ?? this.criticalFilter,
        status: status ?? this.status,
      );
}
