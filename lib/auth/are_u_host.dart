import 'package:evoltsoft/providers/auth_provider.dart';
import 'package:evoltsoft/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/widgets/button_widgets.dart';
import '../view/main_page.dart';

class AreYouHost extends StatelessWidget {
  const AreYouHost({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: appThemeColor,
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(
                    context); // Navigate back when back button is pressed
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              )),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text(
                'Are you a Host',
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(height: h * 0.02),
              const Text(
                'Please select the option that best\ndescribes you',
                style: TextStyle(fontSize: 12, color: Colors.white54),
              ),
              SizedBox(
                  height:
                      h * 0.04), // Add some spacing between text and options
              Consumer<AuthProvider>(
                builder: (context, provider, child) {
                  return GestureDetector(
                    onTap: () {
                      provider.selectOption('Yes');
                    },
                    child: Container(
                      height: h * 0.08,
                      width: w * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: provider.selectedOption == 'Yes'
                                  ? Colors.blue
                                  : Colors.grey)),
                      child: Center(
                        child: ListTile(
                          title: Text(
                            'Yes',
                            style: TextStyle(
                                color: provider.selectedOption == 'Yes'
                                    ? Colors.blue
                                    : Colors.grey),
                          ),
                          trailing: Icon(
                            provider.selectedOption == 'Yes'
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: provider.selectedOption == 'Yes'
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              SizedBox(height: h * 0.02),
              Consumer<AuthProvider>(
                builder: (context, provider, child) {
                  return GestureDetector(
                    onTap: () {
                      provider.selectOption('No');
                    },
                    child: Container(
                      height: h * 0.08,
                      width: w * 0.9,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: provider.selectedOption == 'No'
                                  ? Colors.blue
                                  : Colors.grey)),
                      child: Center(
                        child: ListTile(
                          title: Text(
                            'No',
                            style: TextStyle(
                                color: provider.selectedOption == 'No'
                                    ? Colors.blue
                                    : Colors.grey),
                          ),
                          trailing: Icon(
                            provider.selectedOption == 'No'
                                ? Icons.check_circle
                                : Icons.check_circle_outline,
                            color: provider.selectedOption == 'No'
                                ? Colors.blue
                                : Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              const Spacer(),
              const Text(
                textAlign: TextAlign.center,
                'By starting my Host application, I agree to El-Monde\n Service Facilitation Terms to access the sale of\n Charging Services',
                style: TextStyle(fontSize: 11, color: Colors.white54),
              ),
              SizedBox(
                height: h * 0.02,
              ),
              Center(
                child: ButtonWidget(
                    h: h,
                    w: w,
                    title: 'Continue',
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MainPage()),
                          (route) => false);
                    }),
              ),
              SizedBox(
                height: h * 0.08,
              )
            ])));
  }
}
