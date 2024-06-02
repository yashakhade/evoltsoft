import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evoltsoft/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CmilesScreen extends StatefulWidget {
  const CmilesScreen({super.key});

  @override
  State<CmilesScreen> createState() => _CmilesScreenState();
}

class _CmilesScreenState extends State<CmilesScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appThemeColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Image.asset('assets/Background.png'),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '€158.00',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Image.asset('assets/world.png')
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14, top: h * 0.06),
                  child: const Text(
                    'Available to spend',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffA1BBFF),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14, top: h * 0.15),
                  child: const Text(
                    'Earnings this month',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xffA1BBFF),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 14, top: h * 0.176),
                  child: const Text(
                    '€156.00',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 40,
                    width: w * 0.38,
                    margin: const EdgeInsets.only(right: 6, bottom: 5),
                    decoration: BoxDecoration(
                        color: dotColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Center(
                      child: Text(
                        'Request Transfer',
                        style: TextStyle(fontSize: 11, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () async {
                      final random = Random();

                      for (int i = 0; i < 20; i++) {
                        await FirebaseFirestore.instance
                            .collection('cmiles')
                            .add({
                          'addedOn': DateTime.now(),
                          'kiloWat': random.nextDouble() *
                              100, // Random value between 0 and 100
                          'price': random.nextDouble() *
                              50, // Random value between 0 and 50
                        });
                      }
                    },
                    child: const Text(
                      'Transactions',
                      style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    'See All',
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  )
                ],
              ),
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                stream:
                    FirebaseFirestore.instance.collection('cmiles').snapshots(),
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    return const Center(child: Text('Something went wrong'));
                  }

                  if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                    return const Center(child: Text('No data available'));
                  }
                  return ListView.builder(
                    padding: const EdgeInsets.all(0),
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext context, int index) {
                      final DocumentSnapshot document =
                          snapshot.data!.docs[index];
                      final Map<String, dynamic> data =
                          document.data() as Map<String, dynamic>;

                      final addedOn = (data['addedOn'] as Timestamp).toDate();
                      final formattedTime =
                          DateFormat('h:mm a').format(addedOn);
                      final formattedDate = DateFormat.yMMMd().format(addedOn);
                      final currentTime = DateTime.now();
                      final todayDate = DateTime(
                          currentTime.year, currentTime.month, currentTime.day);
                      final isToday = todayDate ==
                          DateTime(addedOn.year, addedOn.month, addedOn.day);

                      final addedOnText =
                          isToday ? 'Today, $formattedTime' : formattedDate;

                      String price = data['price'].toStringAsFixed(2);
                      if (price.length > 5) {
                        price = price.substring(0, 5);
                      }

                      String kiloWat = data['kiloWat'].toStringAsFixed(2);
                      if (kiloWat.length > 4) {
                        kiloWat = kiloWat.substring(0, 4);
                      }

                      return ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Charging Session',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.white),
                            ),
                            Text(
                              '€$price',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              addedOnText,
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.white70),
                            ),
                            Text(
                              '$kiloWat kW',
                              style: const TextStyle(
                                  fontSize: 10, color: Colors.white70),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
