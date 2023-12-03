import 'package:flutter/material.dart';

import 'package:beats_box/utilities/utilities_barrel.dart' show showCustomGenericDialog;
import 'package:beats_box/services/services_barrel.dart' show DoubleExtension, SharedPreferencesHelper;
import 'package:beats_box/constants/constants_barrel.dart'
    show AppSizes, AppColors, CustomImages, AppStrings, AppMargins, AppPaddings;

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late Map<String, dynamic> customUserData;

  @override
  void initState() {
    super.initState();
    getCustomUserData();
  }

  Future<void> getCustomUserData() async {
    customUserData = await SharedPreferencesHelper.getCustomEmailUserDetails();
  }

  void handleLogout() {
    showCustomGenericDialog<void>(
      context: context,
      title: AppStrings.areYouSure,
      content: AppStrings.logoutMessage,
      optionsBuilder: () => {"Ok": null},
    );
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), () {
      print("this is user data in profile view $customUserData");
    });

    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppSizes.s250,
        flexibleSpace: Container(
          padding: const EdgeInsets.only(left: AppSizes.s26),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[colorScheme.outline, colorScheme.background],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: AppSizes.s46,
                    child: CircleAvatar(
                      radius: AppSizes.s44,
                      backgroundColor: AppColors.dark,
                      backgroundImage: NetworkImage(CustomImages.ykLogoUrl),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: AppSizes.s14),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Yubin Karki", style: textTheme.titleLarge),
                        AppSizes.s10.sizedBoxHeight,
                        Row(
                          children: [
                            Text("10 Followers", style: textTheme.labelSmall),
                            AppSizes.s6.sizedBoxWidth,
                            const Icon(Icons.circle, size: AppSizes.s6),
                            AppSizes.s6.sizedBoxWidth,
                            Text("10 Following", style: textTheme.labelSmall),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: colorScheme.background),
        child: Column(
          children: [
            Card(
              elevation: AppSizes.s6,
              margin: const EdgeInsets.only(top: AppMargins.m40, left: AppMargins.m40, right: AppMargins.m40),
              child: SizedBox(
                height: AppSizes.s250,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: AppPaddings.p24, left: AppPaddings.p24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name - Yubin Karki", style: textTheme.labelMedium),
                      AppSizes.s10.sizedBoxHeight,
                      Text("Name - Bhaktapur", style: textTheme.labelMedium),
                      AppSizes.s10.sizedBoxHeight,
                      Text("Name - Nice", style: textTheme.labelMedium),
                      AppSizes.s10.sizedBoxHeight,
                      Text("Name - Yubin Karki", style: textTheme.labelMedium),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(),
            SizedBox(
              height: AppSizes.s50,
              width: AppSizes.s150,
              child: OutlinedButton(
                onPressed: handleLogout,
                child: Text(AppStrings.logout, style: textTheme.labelSmall),
              ),
            ),
            AppSizes.s40.sizedBoxHeight,
          ],
        ),
      ),
    );
  }
}
