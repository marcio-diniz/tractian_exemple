import 'package:flutter/material.dart';
import 'package:tractian_exemple/domain/entities/elementsTree/location_entity.dart';
import 'package:tractian_exemple/presentation/widgets/asset_tree/asset_tree_widget_factory.dart';

import '../../themes/default_theme.dart';

class LocationContentWidget extends StatelessWidget {
  const LocationContentWidget({super.key, required this.locationEntity});
  final LocationEntity locationEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/location.png',
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 5,
            ),
            Expanded(
              child: Text(
                locationEntity.name,
                style: defaultTitleTextStyle,
              ),
            ),
          ],
        ),
        Visibility(
          visible: locationEntity.childrens.isNotEmpty,
          child: Container(
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(
                  color: shadowColor,
                  width: 1,
                ),
              ),
            ),
            padding: const EdgeInsets.only(left: 15),
            margin: const EdgeInsets.only(left: 15, top: 5),
            child: ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: locationEntity.childrens.length,
              itemBuilder: (context, index) =>
                  AssetTreeWidgetFactory.createWidget(
                      locationEntity.childrens.values.toList()[index]),
            ),
          ),
        )
      ],
    );
  }
}
