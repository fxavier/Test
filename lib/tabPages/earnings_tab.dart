import 'package:flutter/material.dart';
import 'package:mz_taxi_driver_app/widgets/app_text.dart';

class EarningsTab extends StatefulWidget {
  const EarningsTab({Key? key}) : super(key: key);

  @override
  State<EarningsTab> createState() => _EarningsTabState();
}

class _EarningsTabState extends State<EarningsTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: AppText(
        fontSize: 20,
        text: "Earnings",
        color: Colors.black,
      ),
    );
  }
}
