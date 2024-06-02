import 'package:evoltsoft/utils/colors.dart';
import 'package:evoltsoft/utils/widgets/button_widgets.dart';
import 'package:evoltsoft/view/charger/stop_charging.dart';
import 'package:flutter/material.dart';

import '../../utils/widgets/stats_widget.dart';

class StartCharging extends StatefulWidget {
  const StartCharging({super.key});

  @override
  State<StartCharging> createState() => _StartChargingState();
}

class _StartChargingState extends State<StartCharging> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appThemeColor,
      appBar: AppBar(
        title: const Text('ChargerID-001'),
        actions: const [
          Icon(Icons.settings),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        child: ListView(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              width: w * 1,
              height: h * 0.23,
              decoration: const BoxDecoration(
                  // color: Colors.pink,
                  image: DecorationImage(
                      image: AssetImage('assets/cars/white1.png'),
                      fit: BoxFit.contain)),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' Hôtel de Ville',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "Pl. de l'Hôtel de Ville, Paris • 1.4 km",
                    style: TextStyle(fontSize: 11, color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              children: [
                const Icon(
                  Icons.ac_unit_rounded,
                  color: Colors.white,
                ),
                const Text(
                  '   Type 2 • 30kW',
                  style: TextStyle(fontSize: 11, color: Colors.white),
                ),
                SizedBox(
                  width: w * 0.2,
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
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.3,
            ),
            const Row(
              children: [
                Text(
                  'My Stats',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatsWidget(
                  h: h,
                  w: w,
                  title: '0 Sessions',
                  val: 'Sessions',
                ),
                StatsWidget(
                  h: h,
                  w: w,
                  title: '0.0 kWh',
                  val: 'Used',
                ),
              ],
            ),
            SizedBox(
              height: h * 0.05,
            ),
            ButtonWidget(
                h: h,
                w: w,
                title: 'Start Charging',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const StopCharging()));
                }),
          ],
        ),
      ),
    );
  }
}
