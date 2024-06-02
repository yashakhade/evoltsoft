import 'package:evoltsoft/utils/widgets/button_widgets.dart';
import 'package:flutter/material.dart';

import '../../utils/colors.dart';
import 'charger_details.dart';

class ChargerScreen extends StatefulWidget {
  const ChargerScreen({super.key});

  @override
  State<ChargerScreen> createState() => _ChargerScreenState();
}

class _ChargerScreenState extends State<ChargerScreen> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appThemeColor,
      appBar: AppBar(
        title: const Text('My Chargers'),
      ),
      body: Column(
        children: [
          Container(
            height: h * 0.15,
            width: w,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            color: dotColor,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChargerDetails()));
              },
              child: Row(
                children: [
                  Container(
                    height: h,
                    width: w * 0.22,
                    decoration: const BoxDecoration(
                        // color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('assets/cars/white.png'),
                            fit: BoxFit.fill)),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Hôtel de Ville',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Icon(
                                Icons.settings,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "Pl. de l'Hôtel de Ville, Paris • 1.4 km",
                            style: TextStyle(fontSize: 11, color: Colors.white),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '€ 28.00/hour',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Type 2 • 30kW',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Container(
                                height: 20,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.yellow[400],
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Text(
                                    'Charging',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: h * 0.15,
            width: w,
            margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            color: dotColor,
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ChargerDetails()));
              },
              child: Row(
                children: [
                  Container(
                    height: h,
                    width: w * 0.22,
                    decoration: const BoxDecoration(
                        // color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage('assets/cars/grey.png'),
                            fit: BoxFit.fill)),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Ober Mamma',
                                style: TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Icon(
                                Icons.settings,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            "107 Bd Richard-Lenoir, Par.. • 1.4 km",
                            style: TextStyle(fontSize: 11, color: Colors.white),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '€ 26.00/hour',
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Type 2 • 30kW',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              Container(
                                height: 20,
                                width: 80,
                                decoration: BoxDecoration(
                                    color: Colors.green[400],
                                    borderRadius: BorderRadius.circular(10)),
                                child: const Center(
                                  child: Text(
                                    'Available',
                                    style: TextStyle(
                                        fontSize: 11,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(),
          ButtonWidget(h: h, w: w, title: 'Add New Charger', onTap: () {}),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
