import 'package:evoltsoft/utils/colors.dart';
import 'package:flutter/material.dart';

class SessionScreen extends StatefulWidget {
  const SessionScreen({super.key});

  @override
  State<SessionScreen> createState() => _SessionScreenState();
}

class _SessionScreenState extends State<SessionScreen> {
  List chargerNames = [
    'Apart Hotel | 21kW',
    'Glasic Charger',
    'Hotel De Vella'
  ];
  List kiloWatList = ['8.12', '5.23', '13.5'];
  List minList = ['30 Min', '12 Min', '45 Min'];
  List timeList = ['Todays 1:15 PM', 'Todays 23:23 PM', 'Todays 5:15 PM'];
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appThemeColor,
      appBar: AppBar(
        title: const Text('Sessions'),
      ),
      body: Column(
        children: [
          Container(
            height: 40,
            width: w * 0.8,
            decoration: BoxDecoration(
                color: dotColor, borderRadius: BorderRadius.circular(10)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 30,
                  width: w * 0.35,
                  decoration: BoxDecoration(
                      color: const Color(0xff1D2939),
                      borderRadius: BorderRadius.circular(10)),
                  child: const Center(
                    child: Text(
                      'Club Sessions',
                      style: TextStyle(color: Colors.white, fontSize: 12),
                    ),
                  ),
                ),
                const Text(
                  'Guest Sessions',
                  style: TextStyle(color: Colors.white54, fontSize: 12),
                )
              ],
            ),
          ),
          Expanded(
              child: ListView.builder(
            padding: const EdgeInsets.all(0),
            itemCount: chargerNames.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      chargerNames[index],
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Text(
                      kiloWatList[index],
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ],
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      timeList[index],
                      style:
                          const TextStyle(fontSize: 10, color: Colors.white70),
                    ),
                    Text(
                      minList[index],
                      style:
                          const TextStyle(fontSize: 10, color: Colors.white70),
                    ),
                  ],
                ),
              );
            },
          ))
        ],
      ),
    );
  }
}
