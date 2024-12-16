import 'package:flutter/cupertino.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionWidget extends StatelessWidget {
  const AppVersionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<PackageInfo>(
        future: PackageInfo.fromPlatform(),
        builder: (context, snapshot) {
          return snapshot.hasData
              ? Text(
              // '5 monkey games version ${snapshot.data?.version.toString().} 2024',
              'Risk free sports betting v1.0 2024',
                  style: AppTextStyle.superBold10
                      .copyWith(color: AppColors.purpleLightColor))
              : const Text('...');
        });
  }
}
