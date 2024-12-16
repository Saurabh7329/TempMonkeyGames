import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:freeplay/core/design/colors.dart';
import 'package:freeplay/core/design/text_style/text_styles.dart';
import 'package:freeplay/feature/common/buttons/app_elevated_button.dart';
import 'package:freeplay/feature/home/bloc/notification_bloc/notification_bloc.dart';
import 'package:freeplay/feature/home/view/local_widgets/notification_widget.dart';

import '../../../../core/domain/notification_data/notification_data.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {

  @override
  void initState() {
    super.initState();
    context
        .read<NotificationBloc>()
        .add(const NotificationEvent.getNotifications(true));
  }

  List<NotificationData> notificationList =[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whities,
      appBar: AppBar(
        backgroundColor: AppColors.lightNaviBlue,
        automaticallyImplyLeading: false,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(8),
                bottomRight: Radius.circular(8))),
        title: Text('Notifications', style: AppTextStyle.titleS),
        centerTitle: true,
        elevation: 0.0,
        actions: [
          SizedBox(
              width: 90.w,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: AppElevatedButton(
                  function: () {
                    // _clearAllItems();
                    context
                        .read<NotificationBloc>()
                        .add(const NotificationEvent.getNotifications(false));
                  },
                  title: 'Clear',
                ),
              ))
        ],
        leading: IconButton(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onPressed: () {
              FocusManager.instance.primaryFocus?.unfocus();
              context.router.navigateBack();
            },
            icon: (SvgPicture.asset('assets/icons/back.svg'))),
      ),
      body: BlocBuilder<NotificationBloc, NotificationState>(
          builder: (context, state) {
        return state.map(loading: (value) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.red),
          );
        }, error: (value) {
          return const Center(
            child: CircularProgressIndicator(color: AppColors.red),
          );
        }, success: (value) {
          notificationList = value.notifications;
          return SafeArea(
              child: notificationList.isNotEmpty ? SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount:notificationList.length,
                      itemBuilder: (context, index) {
                        return NotificationWidget(
                          title:notificationList[index].title ??
                              'Notification',
                          description:
                          notificationList[index].message ?? 'Message',
                        );
                      })
                ],
              ),
            ),
          ) : Center(child: Text('No notifications yet', style: AppTextStyle.subtitle),));
        });
      }),
    );
  }

  void _clearAllItems() {
    print('notificationList======>${notificationList.toString()}');
    setState(() {
      notificationList.clear();
    });
    String notificationIDs = "";
    /*  for (var i = 0; i < notificationList.length; i++) {

      notificationList.removeWhere((item) => item.type == notificationList[i].type);
 if(notificationIDs.isEmpty){
        notificationIDs = notificationList[i].title!;
     //   notificationList.removeAt(i);
      }else{
        notificationIDs = notificationIDs +","+ notificationList[i].title!;
      //  notificationList.removeAt(i);
      }
    }*/

   // print('notificationIDs========$notificationIDs');
  //  notificationList.clear();
  }
}
