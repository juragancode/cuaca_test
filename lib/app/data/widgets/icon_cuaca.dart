import 'package:flutter/material.dart';
import 'package:cuaca_test/app/models/cuaca_model.dart';

Image iconCuaca(
  ModelListCuaca cuaca, {
  double? size = 60,
}) {
  switch (cuaca.cuaca) {
    case "Cerah Berawan":
      return Image.asset(
        'assets/icons/cuaca/cerah_berawan.png',
        width: size,
        height: size,
      );
    case "Cerah":
      return Image.asset(
        'assets/icons/cuaca/cerah.png',
        width: size,
        height: size,
      );
    case "Berawan":
      return Image.asset(
        'assets/icons/cuaca/berawan.png',
        width: size,
        height: size,
      );
    case "Hujan Ringan":
      return Image.asset(
        'assets/icons/cuaca/hujan_ringan.png',
        width: size,
        height: size,
      );
    case "Hujan Sedang":
      return Image.asset(
        'assets/icons/cuaca/hujan_sedang.png',
        width: size,
        height: size,
      );
    case "Hujan Petir":
      return Image.asset(
        'assets/icons/cuaca/hujan_petir.png',
        width: size,
        height: size,
      );
  }
  return Image.asset(
    'assets/icons/cuaca/berawan.png',
    width: size,
    height: size,
  );
}
