import 'package:evoltsoft/providers/menu_provider.dart';
import 'package:evoltsoft/utils/colors.dart';
import 'package:evoltsoft/utils/widgets/button_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LanguageSelect extends StatelessWidget {
  const LanguageSelect({super.key});

  @override
  Widget build(BuildContext context) {
    final languages = [
      'English (US)',
      'English (UK)',
      'France',
      'Spain',
      'Italy'
    ];

    final images = [
      'assets/lng/united states.png',
      'assets/lng/united kingdom.png',
      'assets/lng/france.png',
      'assets/lng/spain.png',
      'assets/lng/1529054003 1.png',
    ];
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: appThemeColor,
      appBar: AppBar(
        title: const Text('Language'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          for (int i = 0; i < languages.length; i++)
            Center(
              child: Column(
                children: [
                  LanguageTile(language: languages[i], images: images[i]),
                  SizedBox(height: h * 0.02),
                ],
              ),
            ),
          const Spacer(),
          ButtonWidget(
              h: h,
              w: w,
              title: 'Save',
              onTap: () {
                Navigator.pop(context);
              }),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}

class LanguageTile extends StatelessWidget {
  final String language, images;

  const LanguageTile({super.key, required this.language, required this.images});

  @override
  Widget build(BuildContext context) {
    final selectedLanguage =
        Provider.of<MenuScreenProvider>(context).selectedLanguage;
    final isSelected = selectedLanguage == language;
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Container(
      height: h * 0.08,
      width: w * 0.9,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: isSelected ? Colors.blue : Colors.grey)),
      child: ListTile(
        onTap: () {
          Provider.of<MenuScreenProvider>(context, listen: false)
              .selectLanguage(language);
        },
        title: Text(
          language,
          style: TextStyle(color: isSelected ? Colors.blue : Colors.grey),
        ),
        leading: Image.asset(
          images,
        ),
        trailing: Icon(
          isSelected ? Icons.check_circle : Icons.check_circle_outline,
          color: isSelected ? Colors.blue : Colors.grey,
        ),
      ),
    );
  }
}
