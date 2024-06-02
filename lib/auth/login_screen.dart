import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: h,
        width: w,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/onbording/login.jpg'),
                fit: BoxFit.fill)),
        child: Column(
          children: <Widget>[
            const Spacer(),
            InkWell(
              onTap: () async {
                try {
                  await authProvider.signInWithGoogle(context);
                } catch (e) {
                  print(e);
                }
              },
              child: Container(
                color: Colors.transparent,
                height: h * 0.08,
                width: w * 0.9,
              ),
            ),
            SizedBox(
              height: h * 0.23,
            )
          ],
        ),
      ),
    );
  }
}
