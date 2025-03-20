import 'package:flutter/material.dart';

class InternetExceptionWidget extends StatelessWidget {
  final VoidCallback onRetryConnection;

  const InternetExceptionWidget({super.key, required this.onRetryConnection});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.cloud_off_rounded, color: Colors.red),
          SizedBox(height: 50),
          Text("No Internet Connection available."),
          SizedBox(height: 10),
          ElevatedButton(
            onPressed: onRetryConnection,
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              minimumSize: Size(double.infinity, 50),
            ),
            child: Text("Retry"),
          ),
        ],
      ),
    );
  }
}
