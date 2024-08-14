import 'package:flutter/material.dart';
import 'package:tractian_exemple/presentation/themes/default_theme.dart';

import '../../../domain/entities/elementsTree/assets_entity.dart';
import 'asset_tree_widget_factory.dart';

class AssetContentWidget extends StatelessWidget {
  const AssetContentWidget({super.key, required this.assetEntity});
  final AssetEntity assetEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/asset.png',
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                assetEntity.name,
                style: defaultTitleTextStyle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        Visibility(
          visible: assetEntity.childrens.isNotEmpty,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: shadowColor, // Cor da borda
                  width: 1, // Largura da borda
                ),
              ),
            ),
            padding: const EdgeInsets.only(left: 15),
            margin: const EdgeInsets.only(left: 15, top: 5),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              itemCount: assetEntity.childrens.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) =>
                  AssetTreeWidgetFactory.createWidget(
                      assetEntity.childrens.values.toList()[index]),
            ),
          ),
        )
      ],
    );
  }
}
