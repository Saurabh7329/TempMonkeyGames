part of 'match_details_page.dart';

class _Info extends StatelessWidget {
  const _Info({
    Key? key,
    required this.league,
    required this.time,
  }) : super(key: key);
  final String league;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 10.h,
        bottom: 10.h,
        right: 16.w,
        left: 16.w,
      ),
      decoration: BoxDecoration(
        color: AppColors.lightgrey,
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 12),
            blurRadius: 12,
            spreadRadius: -6,
            color: const Color(0xFF000000).withOpacity(0.16),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            league,
            style: AppTextStyle.semibold12.copyWith(
              color: AppColors.red,
            ),
          ),
          Text(
            time.formatTime(),
            style: AppTextStyle.subtitle
                .copyWith(color: AppColors.greyMediumColor),
          ),
        ],
      ),
    );
  }
}
