part of 'match_details_page.dart';

class _Teams extends StatelessWidget {
  const _Teams({
    Key? key,
    required this.home,
    required this.away,
  }) : super(key: key);
  final String home;
  final String away;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 140.h,
          padding: EdgeInsets.only(bottom: 3.w),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              topRight: Radius.circular(8),
            ),
            color: AppColors.lightgrey,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  height: double.infinity,
                  padding: EdgeInsets.only(
                    top: 16.h,
                    right: 16.w,
                    left: 16.w,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                    ),
                    color: AppColors.lightgrey,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      home.isNotEmpty
                          ? TeamNameInitialLogoWidget(
                              name: home,
                              height: 56.w,
                              width: 56.w,
                            )
                          : Container(
                              height: 56.w,
                              width: 56.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.red,
                              ),
                            ),
                      ColumnSpacer(12.h),
                      Text(
                        home,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.semibold12.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              RowSpacer(3.w),
              Expanded(
                child: Container(
                  height: double.infinity,
                  padding: EdgeInsets.symmetric(
                    vertical: 16.h,
                    horizontal: 16.w,
                  ),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(8),
                    ),
                    color: AppColors.lightgrey,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      away.isNotEmpty
                          ? TeamNameInitialLogoWidget(name: away,height: 56.w,width: 56.w,)
                          : Container(
                              height: 56.w,
                              width: 56.w,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.red,
                              ),
                            ),
                      ColumnSpacer(12.h),
                      Text(
                        away,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.semibold12.copyWith(
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          height: 32.w,
          width: 32.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.red,
              width: 3,
            ),
            color: AppColors.red,
          ),
          alignment: Alignment.center,
          child: Text(
            'VS',
            style: AppTextStyle.semibold12.copyWith(
              fontWeight: FontWeight.w800,
              color: AppColors.whities,
            ),
          ),
        ),
      ],
    );
  }
}
