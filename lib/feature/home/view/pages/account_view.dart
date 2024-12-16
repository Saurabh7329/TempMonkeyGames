import 'package:flutter/material.dart';
import 'package:freeplay/core/domain/configuration.dart';
import 'package:freeplay/feature/account/view/pages/account_page.dart';

class AccountView extends StatelessWidget {
  const AccountView({Key? key}): super(key:key);

  @override
  Widget build(BuildContext context) {
    return AccountBuilder();
  }
}
