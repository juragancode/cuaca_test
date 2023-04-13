import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

Widget animasi() {
  return Container(
    width: Get.width,
    height: 50,
    color: Colors.transparent,
    child: WaveWidget(
      config: CustomConfig(
        colors: [
          Colors.white,
          Colors.white.withOpacity(0.3),
          Colors.white.withOpacity(0.7),
        ],
        durations: [5000, 6000, 7000],
        heightPercentages: [0.2, 0.2, 0.2],
        blur: const MaskFilter.blur(BlurStyle.solid, 5),
      ),
      waveAmplitude: 35.00,
      waveFrequency: 3,
      backgroundColor: Colors.transparent,
      size: const Size(
        double.infinity,
        double.infinity,
      ),
    ),
  );
}
