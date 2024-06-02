import 'package:evoltsoft/utils/colors.dart';
import 'package:evoltsoft/utils/widgets/button_widgets.dart';
import 'package:flutter/material.dart';

class DownloadInvoice extends StatelessWidget {
  const DownloadInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: appThemeColor,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text('Hôtel de Ville'),
      ),
      body: Stack(
        children: [
          Container(
            height: h * 0.25,
            width: w,
            color: Colors.blue,
          ),
          Center(
            child: Container(
              height: h * 0.84,
              width: w * 0.9,
              color: appThemeColor,
              child: Column(
                children: [
                  Image.asset('assets/Frame.png'),
                  const RowWidget(
                    title: 'Transaction ID',
                    val: '9876543234xxx',
                  ),
                  const RowWidget(
                    title: 'Consumption',
                    val: '08.12kWh',
                  ),
                  const RowWidget(
                    title: 'Charging cost',
                    val: '€00.00',
                  ),
                  const RowWidget(
                    title: 'Idle Fee',
                    val: '€00.00',
                  ),
                  const RowWidget(
                    title: 'Total amount',
                    val: '€00.00',
                  ),
                  const Spacer(),
                  ButtonWidget(
                      h: h, w: w, title: 'Download Invoice', onTap: () {})
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RowWidget extends StatelessWidget {
  const RowWidget({
    super.key,
    required this.title,
    required this.val,
  });

  final String title, val;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 11, color: Colors.white70),
              ),
              Text(
                val,
                style: const TextStyle(fontSize: 11, color: Colors.white70),
              ),
            ],
          ),
          const SizedBox(
            height: 9,
          ),
          const Divider(
            thickness: 0.3,
          )
        ],
      ),
    );
  }
}
