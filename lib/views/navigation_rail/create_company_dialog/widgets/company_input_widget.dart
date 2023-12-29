import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:transportkartan/data/enums/union.dart';
import 'package:transportkartan/data/models/company_model.dart';
import 'package:transportkartan/views/navigation_rail/create_company_dialog/cubit/create_company_cubit.dart';

class CompanyInputWidget extends StatefulWidget {
  const CompanyInputWidget({
    super.key,
  });

  @override
  State<CompanyInputWidget> createState() => _CompanyInputWidgetState();
}

class _CompanyInputWidgetState extends State<CompanyInputWidget> {
  late TextEditingController companyNameController;
  late TextEditingController orgNumberController;
  late TextEditingController descriptionController;
  late TextEditingController websiteController;
  late TextEditingController numberOfEmployeesController;
  late TextEditingController logoUrlController;
  late TextEditingController headquarterController;
  late TextEditingController facebookUrlController;
  late TextEditingController linkedInUrlController;

  @override
  void initState() {
    super.initState();
    companyNameController = TextEditingController();
    orgNumberController = TextEditingController();
    descriptionController = TextEditingController();
    websiteController = TextEditingController();
    numberOfEmployeesController = TextEditingController();
    logoUrlController = TextEditingController();
    headquarterController = TextEditingController();
    facebookUrlController = TextEditingController();
    linkedInUrlController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    companyNameController.dispose();
    orgNumberController.dispose();
    descriptionController.dispose();
    websiteController.dispose();
    numberOfEmployeesController.dispose();
    logoUrlController.dispose();
    headquarterController.dispose();
    facebookUrlController.dispose();
    linkedInUrlController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateCompanyCubit, Company>(
      builder: (context, companyState) {
        companyNameController.text = companyState.name;
        orgNumberController.text = companyState.orgNumber;
        descriptionController.text = companyState.description;
        websiteController.text = companyState.websiteUrl ?? '';
        numberOfEmployeesController.text = companyState.totalEmployees.toString();
        facebookUrlController.text = companyState.facebookUrl ?? '';
        logoUrlController.text = companyState.logoUrl ?? '';
        headquarterController.text = companyState.headquarterAddress ?? '';
        linkedInUrlController.text = companyState.linkedInUrl ?? '';
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: companyNameController,
                    decoration: const InputDecoration(
                      labelText: 'Företagsnamn',
                    ),
                    onTapOutside: (_) => context.read<CreateCompanyCubit>().updateCompanyName(
                          companyNameController.text,
                        ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: orgNumberController,
                    decoration: const InputDecoration(
                      labelText: 'Org. nummer',
                    ),
                    onTapOutside: (_) => context.read<CreateCompanyCubit>().updateOrgNumber(
                          orgNumberController.text,
                        ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: headquarterController,
                    decoration: const InputDecoration(
                      labelText: 'Sätesadress',
                    ),
                    onTapOutside: (_) => context.read<CreateCompanyCubit>().updateHeadQuartersAdress(
                          headquarterController.text,
                        ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: numberOfEmployeesController,
                    decoration: const InputDecoration(
                      labelText: 'Antal anställda',
                    ),
                    onTapOutside: (_) => context.read<CreateCompanyCubit>().updateTotalEmployees(
                          numberOfEmployeesController.text,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: websiteController,
                    decoration: const InputDecoration(
                      labelText: 'Hemsida',
                    ),
                    onTapOutside: (_) => context.read<CreateCompanyCubit>().updateWebsiteUrl(
                          websiteController.text,
                        ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: DropdownButtonFormField<UnionType>(
                    borderRadius: BorderRadius.circular(16),
                    value: companyState.union,
                    hint: const Text('Fackförening'),
                    onChanged: (UnionType? newValue) {
                      context.read<CreateCompanyCubit>().updateUnionType(newValue!);
                    },
                    items: UnionType.values.map((UnionType unionType) {
                      return DropdownMenuItem<UnionType>(
                        value: unionType,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(unionType.name),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      labelText: 'Beskrivning',
                    ),
                    onTapOutside: (_) => context.read<CreateCompanyCubit>().updateCompanyDescription(
                          descriptionController.text,
                        ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: logoUrlController,
                    decoration: const InputDecoration(
                      labelText: 'Logotyp URL',
                    ),
                    onTapOutside: (_) => context.read<CreateCompanyCubit>().updateLogoUrl(
                          logoUrlController.text,
                        ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: facebookUrlController,
                    decoration: const InputDecoration(
                      labelText: 'Facebook URL',
                    ),
                    onTapOutside: (_) => context.read<CreateCompanyCubit>().updateFacebookUrl(
                          facebookUrlController.text,
                        ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: TextField(
                    controller: linkedInUrlController,
                    decoration: const InputDecoration(
                      labelText: 'LinkedIn URL',
                    ),
                    onTapOutside: (_) => context.read<CreateCompanyCubit>().updateLinkedInUrl(
                          linkedInUrlController.text,
                        ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
