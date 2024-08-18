import 'package:flutter/material.dart';

import 'package:beats_box/services/services_barrel.dart' show DoubleExtension;
import 'package:beats_box/utilities/utilities_barrel.dart' show showCustomGenericDialog;
import 'package:beats_box/constants/constants_barrel.dart'
    show AppSizes, AppColors, CustomImages, AppStrings, AppMargins, AppPaddings, CustomUserDetails;

class ProfileView extends StatelessWidget {
  final Map<String, dynamic>? userData;

  const ProfileView({super.key, this.userData});

  void handleLogout() {
    // print("Logged out");
  }

  void showLogoutDialog(context) {
    showCustomGenericDialog<void>(
      context: context,
      title: AppStrings.areYouSure,
      content: AppStrings.logoutMessage,
      optionsBuilder: () => {
        AppStrings.yes: handleLogout,
        AppStrings.no: null,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return profileContent(
      context: context,
      textTheme: textTheme,
      colorScheme: colorScheme,
      email: userData?[CustomUserDetails.email.toString()],
      location: userData?[CustomUserDetails.location.toString()],
      displayName: userData?[CustomUserDetails.displayName.toString()],
      phoneNumber: userData?[CustomUserDetails.phoneNumber.toString()],
    );
  }

  Scaffold profileContent({
    String? email,
    String? location,
    String? phoneNumber,
    String? displayName,
    required TextTheme textTheme,
    required BuildContext context,
    required ColorScheme colorScheme,
  }) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: AppSizes.s250,
        flexibleSpace: Container(
          padding: const EdgeInsets.only(left: AppSizes.s26),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[colorScheme.outline, colorScheme.surface],
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
                        Text(displayName ?? AppStrings.defaultName, style: textTheme.titleLarge),
                        AppSizes.s10.sizedBoxHeight,
                        Row(
                          children: [
                            Text("10 ${AppStrings.followers}", style: textTheme.labelSmall),
                            AppSizes.s6.sizedBoxWidth,
                            const Icon(Icons.circle, size: AppSizes.s6),
                            AppSizes.s6.sizedBoxWidth,
                            Text("10 ${AppStrings.following}", style: textTheme.labelSmall),
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
        decoration: BoxDecoration(color: colorScheme.surface),
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
                      Text(
                        "${AppStrings.name} - ${displayName ?? AppStrings.defaultName}",
                        style: textTheme.labelMedium,
                      ),
                      AppSizes.s10.sizedBoxHeight,
                      Text(
                        "${AppStrings.location} - ${location ?? AppStrings.defaultLocation}",
                        style: textTheme.labelMedium,
                      ),
                      AppSizes.s10.sizedBoxHeight,
                      Text(
                        "${AppStrings.email} - ${email ?? AppStrings.defaultEmail}",
                        style: textTheme.labelMedium,
                      ),
                      AppSizes.s10.sizedBoxHeight,
                      Text(
                        "${AppStrings.contact} - ${phoneNumber ?? AppStrings.defaultPhone}",
                        style: textTheme.labelMedium,
                      ),
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
                onPressed: () => showLogoutDialog(context),
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
