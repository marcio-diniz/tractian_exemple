import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tractian_exemple/presentation/controllers/companies_list_cubit.dart';
import 'package:tractian_exemple/presentation/controllers/companies_list_state.dart';
import 'package:tractian_exemple/presentation/themes/default_theme.dart';
import 'package:tractian_exemple/presentation/widgets/app_bar/app_bar_with_logo_widget.dart';

import '../widgets/company/company_item_widget.dart';

class CompaniesPage extends StatefulWidget {
  const CompaniesPage({
    super.key,
    required this.companiesListCubit,
  });

  final CompaniesListCubit companiesListCubit;

  @override
  State<CompaniesPage> createState() => _CompaniesPageState();
}

class _CompaniesPageState extends State<CompaniesPage> {
  @override
  void initState() {
    debugPrint('COMPANIES PAGE STARTED');
    widget.companiesListCubit.getCompaniesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWithLogoWidget(),
      body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: BlocBuilder<CompaniesListCubit, CompaniesListState>(
            bloc: widget.companiesListCubit,
            builder: (context, state) {
              if (state.status == CompaniesListStatus.error) {
                const Center(
                  child: Text(
                    'Oops, an error occurred.Try again.',
                    textAlign: TextAlign.center,
                  ),
                );
              }
              return Column(
                children: [
                  Visibility(
                    visible: state.status == CompaniesListStatus.loading,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 24,
                          width: 24,
                          child: CircularProgressIndicator(
                            color: primaryColor,
                            strokeWidth: 3,
                          ),
                        ),
                        SizedBox(width: 10),
                        Text('Loading...')
                      ],
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: state.companies.length,
                    itemBuilder: (context, index) => CompanyItemWidget(
                      companyEntity: state.companies[index],
                    ),
                  ))
                ],
              );
            },
          )),
    );
  }
}
