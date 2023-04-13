import 'package:cuaca_test/app/data/widgets/icon_cuaca.dart';
import 'package:cuaca_test/app/models/cuaca_model.dart';
import 'package:flutter/material.dart';

Widget listCuaca(ModelListCuaca value) {
  return Container(
    margin: const EdgeInsets.only(right: 20, top: 20),
    color: Colors.transparent,
    child: Column(children: [
      Text(
        '${value.jamCuaca!.hour.toString().padLeft(2, '0')}:${value.jamCuaca!.minute.toString().padLeft(2, '0')}',
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
          color: Color.fromARGB(201, 0, 0, 0),
        ),
      ),
      const SizedBox(height: 30),
      iconCuaca(
        value,
      ),
      const SizedBox(height: 30),
      Text(
        value.tempC! + "\u00B0",
        style: const TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.w500,
        ),
      ),
    ]),
  );
}
