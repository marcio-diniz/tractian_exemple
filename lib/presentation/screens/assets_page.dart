import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_exemple/presentation/controllers/assets_tree_state.dart';
import 'package:tractian_exemple/presentation/themes/default_theme.dart';
import 'package:tractian_exemple/presentation/widgets/app_bar/app_bar_with_title_widget.dart';

import '../controllers/assets_tree_cubit.dart';
import '../widgets/asset_tree/asset_tree_widget_factory.dart';

class AssetsPage extends StatefulWidget {
  const AssetsPage({
    required this.assetsTreeCubit,
    required this.companyId,
    required this.companyName,
    super.key,
  });
  final AssetsTreeCubit assetsTreeCubit;
  final String companyId;
  final String companyName;

  @override
  State<AssetsPage> createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  @override
  void initState() {
    debugPrint('ASSETS PAGE STARTED');
    widget.assetsTreeCubit
        .getAssetsTreeByCompanyId(companyId: widget.companyId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWithTitleWidget(
        title: widget.companyName,
      ),
      body: BlocBuilder<AssetsTreeCubit, AssetsTreeState>(
        bloc: widget.assetsTreeCubit,
        builder: (context, state) {
          if (state.status == AssetsTreeStatus.error) {
            const Center(
              child: Text(
                'Ops, ocorreu um erro.\nTente novamente.',
                textAlign: TextAlign.center,
              ),
            );
          }
          final assetsTree = state.resultSearch ?? state.assetsTree?.elements;
          if (assetsTree == null) return const SizedBox(width: 5);

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      height: 45,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: inputColor,
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: TextField(
                        style: defaultTitleTextStyle.copyWith(
                            fontWeight: FontWeight.normal),
                        decoration: const InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                          hintText: 'Buscar Ativo ou Local',
                          prefixIcon: Icon(Icons.search),
                          border: InputBorder.none,
                        ),
                        onChanged: widget.assetsTreeCubit.setSearchTerm,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        InkWell(
                          onTap: widget.assetsTreeCubit.toggleEnergyFilter,
                          child: Container(
                            height: 45,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            alignment: Alignment.center,
                            decoration: state.energyFilter
                                ? BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: shadowColor),
                                  ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/bolt_outline.png',
                                  height: 20,
                                  width: 20,
                                  color: state.energyFilter
                                      ? Colors.white
                                      : primaryColorDark,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  'Sensor de Energia',
                                  style: TextStyle(
                                    color: state.energyFilter
                                        ? Colors.white
                                        : primaryColorDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        InkWell(
                          borderRadius: BorderRadius.circular(10.0),
                          onTap: widget.assetsTreeCubit.toggleCriticalFilter,
                          child: Container(
                            height: 45,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                            ),
                            alignment: Alignment.center,
                            decoration: state.criticalFilter
                                ? BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  )
                                : BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    border: Border.all(color: shadowColor),
                                  ),
                            child: Row(
                              children: [
                                Image.asset(
                                  'assets/critical_outline.png',
                                  height: 20,
                                  width: 20,
                                  color: state.criticalFilter
                                      ? Colors.white
                                      : primaryColorDark,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  'Crítico',
                                  style: TextStyle(
                                    color: state.criticalFilter
                                        ? Colors.white
                                        : primaryColorDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              const Divider(
                color: shadowColor,
              ),
              Expanded(
                child: ListView.builder(
                    padding: const EdgeInsets.only(
                      top: 10,
                      left: 5,
                      right: 5,
                      bottom: 100,
                    ),
                    itemCount: assetsTree.length,
                    itemBuilder: (context, index) => Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: shadowColor),
                              borderRadius: BorderRadius.circular(15)),
                          margin: const EdgeInsets.all(5),
                          padding: const EdgeInsets.all(10),
                          child: AssetTreeWidgetFactory.createWidget(
                            assetsTree.values.toList()[index],
                          ),
                        )),
              ),
            ],
          );
        },
      ),
    );
  }
}
