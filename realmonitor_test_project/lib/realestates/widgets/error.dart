import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorScreen extends StatelessWidget {
  //
  final String message;
  final String lottieAnimationAsset;
  final void onReload;

  const ErrorScreen(
      {super.key, required this.message,
      required this.lottieAnimationAsset,
      required this.onReload});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              width: 260,
              height: 260,
              child: Lottie.asset(lottieAnimationAsset),
            ),
            SizedBox(height: 32,),
            Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            TextButton(
              onPressed: () => onReload,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(
                    Icons.refresh_sharp,
                    size: 24.0,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text('Tap to retry'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
