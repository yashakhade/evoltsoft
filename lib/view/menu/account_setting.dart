import 'package:evoltsoft/utils/colors.dart';
import 'package:evoltsoft/view/menu/language_select.dart';
import 'package:flutter/material.dart';

import '../../utils/widgets/list_tile_widget.dart';
import '../../utils/widgets/text_widgets.dart';

class AccountSetting extends StatefulWidget {
  const AccountSetting({super.key});

  @override
  State<AccountSetting> createState() => _AccountSettingState();
}

class _AccountSettingState extends State<AccountSetting> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appThemeColor,
      appBar: AppBar(
        title: const Text('Account Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextGreyWidget(
                text: 'General',
              ),
            ),
            ListtTileWidget(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const AccountSetting()));
                },
                leadingData: Icons.notifications,
                trailingData: Icons.arrow_forward_ios,
                title: 'Notification'),
            ListtTileWidget(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LanguageSelect()));
                },
                leadingData: Icons.language,
                trailingData: Icons.arrow_forward_ios,
                title: 'Language'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextGreyWidget(
                text: 'About Us',
              ),
            ),
            ListtTileWidget(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const AccountSetting()));
                },
                leadingData: Icons.info_outline_rounded,
                trailingData: Icons.arrow_forward_ios,
                title: 'About Us'),
            ListtTileWidget(
                onTap: () {},
                leadingData: Icons.help_outline_outlined,
                trailingData: Icons.arrow_forward_ios,
                title: 'Help'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextGreyWidget(
                text: 'Legal',
              ),
            ),
            ListtTileWidget(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => const AccountSetting()));
                },
                leadingData: Icons.privacy_tip_outlined,
                trailingData: Icons.arrow_forward_ios,
                title: 'Privacy Policy'),
            ListtTileWidget(
                onTap: () {},
                leadingData: Icons.task,
                trailingData: Icons.arrow_forward_ios,
                title: 'Terms & Conditions'),
            ListtTileWidget(
                onTap: () {},
                leadingData: Icons.task,
                trailingData: Icons.arrow_forward_ios,
                title: 'Service Facilitation Terms'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextGreyWidget(
                text: 'Account',
              ),
            ),
            Container(
              color: dotColor,
              child: ListTile(
                onTap: () {
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (BuildContext context) {
                      return Container(
                        height: h * 0.5,
                        decoration: const BoxDecoration(
                            color: appThemeColor,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              title: const Text(
                                'Close Account',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              trailing: const Icon(
                                Icons.cancel_outlined,
                                size: 18,
                              ),
                            ),
                            const Divider(thickness: 1.0, color: Colors.grey),
                            const SizedBox(
                              height: 20,
                            ),
                            const TextWidget2(text: 'Are You Sure?'),
                            const Text(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 11, color: Colors.white60),
                                'Deleting your account will result in the\n permanent loss of all your data, settings, and\n associated information'),
                            SizedBox(
                              height: h * 0.05,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: h * 0.07,
                                width: w * 0.8,
                                decoration: BoxDecoration(
                                  color: Colors.pink,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Close Account',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Container(
                                height: h * 0.07,
                                width: w * 0.8,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.white)),
                                child: const Center(
                                  child: Text(
                                    'Cancel',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                title: const Text(
                  'Close Account',
                  style: TextStyle(color: Colors.redAccent, fontSize: 14),
                ),
                leading: const Icon(
                  Icons.person_outline_outlined,
                  color: Colors.redAccent,
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.redAccent,
                  size: 15,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
