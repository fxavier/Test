import 'package:flutter/material.dart';
import 'package:mz_taxi_driver_app/widgets/app_text.dart';

class ProgressDialog extends StatelessWidget {
  final String? message;
  const ProgressDialog({
    Key? key,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.black54,
      child: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              const SizedBox(
                width: 6,
              ),
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
              ),
              const SizedBox(
                width: 26,
              ),
              AppText(
                fontSize: 12,
                text: message!,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
