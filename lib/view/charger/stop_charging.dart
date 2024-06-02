import 'package:evoltsoft/utils/colors.dart';
import 'package:evoltsoft/utils/widgets/button_widgets.dart';
import 'package:evoltsoft/view/charger/download_invoice.dart';
import 'package:flutter/material.dart';

import '../../utils/widgets/stats_widget.dart';

class StopCharging extends StatefulWidget {
  const StopCharging({super.key});

  @override
  State<StopCharging> createState() => _StopChargingState();
}

class _StopChargingState extends State<StopCharging> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appThemeColor,
      appBar: AppBar(
        title: const Text('ChargerID-001'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.cancel)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Charging',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.bolt,
                          color: Colors.white,
                        ),
                        Text(
                          '99%',
                          style:
                              TextStyle(fontSize: 15, color: Color(0xff69E199)),
                        ),
                      ],
                    ),
                    Text(
                      '0h 0m remain',
                      style: TextStyle(fontSize: 11, color: Colors.white),
                    ),
                  ],
                ),
                Container(
                  height: h * 0.1,
                  width: w * 0.3,
                  decoration: const BoxDecoration(
                      // color: Colors.pink,
                      image: DecorationImage(
                    image: AssetImage('assets/cars/blue.png'),
                  )),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 0.3,
            ),
            const Center(
              child: Text(
                '00.00kWh',
                style: TextStyle(fontSize: 45, color: Color(0xff69E199)),
              ),
            ),
            const Divider(
              thickness: 0.3,
            ),

            // Container(
            //   width: w * 1,
            //   height: h * 0.23,
            // decoration: const BoxDecoration(
            //     // color: Colors.pink,
            //     image: DecorationImage(
            //         image: AssetImage('assets/cars/white1.png'),
            //         fit: BoxFit.contain)),
            // ),
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
            const Spacer(),
            ButtonWidget(
                h: h,
                w: w,
                title: 'Stop Charging',
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DownloadInvoice()));
                }),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
