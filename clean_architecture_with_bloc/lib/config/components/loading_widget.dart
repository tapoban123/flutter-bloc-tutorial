import 'package:flutter/material.dart';

class LoadingWidget extends StatelessWidget {
  final double? height;
  final double? width;

  const LoadingWidget({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: height ?? 20,
        width: width ?? 20,
        child: CircularProgressIndicator.adaptive(),
      ),
    );
  }
}
