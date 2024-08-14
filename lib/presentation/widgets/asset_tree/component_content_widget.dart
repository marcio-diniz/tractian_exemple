import 'package:flutter/material.dart';
import 'package:tractian_exemple/domain/entities/elementsTree/sensor_type.dart';

import '../../../domain/entities/elementsTree/component_entity.dart';
import '../../../domain/entities/elementsTree/sensor_status_type.dart';
import '../../themes/default_theme.dart';

class ComponentContentWidget extends StatelessWidget {
  const ComponentContentWidget({super.key, required this.componentEntity});
  final ComponentEntity componentEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              'assets/component.png',
              height: 30,
              width: 30,
            ),
            const SizedBox(
              width: 5,
            ),
            Row(
              children: [
                Text(
                  componentEntity.name,
                  style: defaultTitleTextStyle,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  children: [
                    const SizedBox(
                      width: 8,
                    ),
                    Visibility(
                      visible: componentEntity.sensorType == SensorType.energy,
                      child: Image.asset(
                        'assets/bolt_icon.png',
                        height: 15,
                        width: 15,
                      ),
                    ),
                    Visibility(
                      visible: componentEntity.sensorStatusType ==
                          SensorStatusType.alert,
                      child: Image.asset(
                        'assets/critical_icon.png',
                        height: 10,
                        width: 10,
                      ),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
