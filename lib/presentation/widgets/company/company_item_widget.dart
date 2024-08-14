import 'package:flutter/material.dart';
import 'package:tractian_exemple/domain/entities/company_entity.dart';

import '../../themes/default_theme.dart';

class CompanyItemWidget extends StatelessWidget {
  const CompanyItemWidget({
    required this.companyEntity,
    super.key,
  });
  final CompanyEntity companyEntity;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
            context, '/companies/${companyEntity.id}/${companyEntity.name}/');
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Stack(
          children: [
            Container(
              height: 80,
              width: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  bottomLeft: Radius.circular(15),
                ),
                color: primaryColorDark,
              ),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/company_icon.png',
                color: primaryColor,
                height: 30,
                width: 30,
              ),
            ),
            Container(
                height: 80,
                padding: const EdgeInsets.only(
                  left: 70,
                  right: 10,
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: primaryColorDark,
                  ),
                ),
                alignment: Alignment.centerLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      companyEntity.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: defaultButtonTextStyle,
                    ),
                    const SizedBox(width: 10),
                    const Icon(
                      Icons.arrow_forward_ios,
                      color: primaryColor,
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
