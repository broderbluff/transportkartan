import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/bloc/crud/company_firestore_cubit.dart';
import 'package:transportkartan/bloc/crud/workplace_firestore_cubit.dart';
import 'package:transportkartan/data/enums/company_type.dart';
import 'package:transportkartan/data/models/workplace_model.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/widgets/site_company_list_widget/cubit/company_on_site_cubit.dart';
import 'package:transportkartan/views/logged_in_view/sub_views/create_site_dialog/widgets/site_company_list_widget/edit_workplace_dialog.dart';
import 'package:transportkartan/views/shared_widgets/company_logo_widget.dart';

class WorkplaceListItem extends StatefulWidget {
  final String siteId;
  final CompanyType companyType;
  final List<Workplace>? companyList;

  const WorkplaceListItem({
    super.key,
    required this.siteId,
    required this.companyType,
    required this.companyList,
  });

  @override
  State<WorkplaceListItem> createState() => _WorkplaceListItemState();
}

class _WorkplaceListItemState extends State<WorkplaceListItem> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.companyList?.length ?? 0,
        itemBuilder: (context, index) {
          final workplace = widget.companyList![index];

          context.read<WorkplaceOnSiteCubit>().updateState(workplace);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.orange[50],
              ),
              child: Row(
                children: [
                  LogoWidget(company: context.read<CompanyFirestoreCubit>().findCompanyById(workplace.companyId)),
                  const SizedBox(
                    width: 4,
                  ),
                  Text(context.read<CompanyFirestoreCubit>().findCompanyById(workplace.companyId).name),
                  const Spacer(),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Lokalt anställda'),
                          Text(
                            '${workplace.employees}',
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Medlemmar'),
                          Text('${workplace.members}'),
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text('Annat förbund'),
                          Text('${workplace.otherUnion}'),
                        ],
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [const Text('Förtroendevalda'), Text('${workplace.electedOfficials}')],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return EditDialogWidget(
                            parentContext: context,
                            company: context.read<CompanyFirestoreCubit>().findCompanyById(workplace.companyId),
                            workplace: workplace,
                          );
                        },
                      );
                    },
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<WorkplaceFirestoreCubit>().deleteWorkplace(workplace.id);
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
