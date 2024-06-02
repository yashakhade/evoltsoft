import 'package:evoltsoft/providers/auth_provider.dart';
import 'package:evoltsoft/utils/colors.dart';
import 'package:evoltsoft/utils/widgets/button_widgets.dart';
import 'package:evoltsoft/view/menu/account_setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../utils/widgets/list_tile_widget.dart';
import '../../utils/widgets/text_widgets.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context).user;

    if (user == null) {
      return Container();
    }
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appThemeColor,
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () async {},
          ),
          const SizedBox(
            width: 20,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: w,
              color: dotColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  user.photoURL != null
                      ? CircleAvatar(
                          backgroundImage: NetworkImage(user.photoURL!),
                          radius: 25,
                        )
                      : Image.asset('assets/Avatar.png', height: 50, width: 50),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.displayName ?? 'Anonymous User',
                        style:
                            const TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      Text(
                        user.email ?? 'No Email',
                        style:
                            const TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ],
                  ),
                  Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                        color: Colors.white54,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'Host',
                        style: TextStyle(fontSize: 10, color: Colors.black),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextGreyWidget(
                text: 'General',
              ),
            ),
            ListtTileWidget(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const AccountSetting()));
                },
                leadingData: Icons.person_outline_outlined,
                trailingData: Icons.arrow_forward_ios,
                title: 'Account Settings'),
            ListtTileWidget(
                onTap: () {},
                leadingData: Icons.battery_charging_full_sharp,
                trailingData: Icons.arrow_forward_ios,
                title: 'My Chargers'),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: TextGreyWidget(
                text: 'Support',
              ),
            ),
            ListtTileWidget(
                onTap: () async {},
                leadingData: Icons.help_outline_rounded,
                trailingData: Icons.arrow_forward_ios,
                title: 'Help'),
            const Spacer(),
            Center(
                child: ButtonWidget(
                    h: h,
                    w: w,
                    title: 'Logout',
                    onTap: () {
                      context.read<AuthProvider>().signOut();
                      Navigator.pushReplacementNamed(context, '/login');
                    })),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
