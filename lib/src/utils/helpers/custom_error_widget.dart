

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final FlutterErrorDetails errorDetails;
  const CustomErrorWidget({
    super.key,
    required this.errorDetails,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.pinkAccent.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline_outlined,
                color: Colors.red,
                size: 50.0,
              ),
              const SizedBox(height: 10.0),
              const Text(
                'Error Occurred!',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10.0),
              Text(
                kReleaseMode
                    ? 'Oops.. Something went wrong'
                    : errorDetails.exceptionAsString(),
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
