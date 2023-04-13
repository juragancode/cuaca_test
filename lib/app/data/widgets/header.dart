import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:simple_shadow/simple_shadow.dart';

import '../../modules/home/controllers/controller_city.dart';
import '../../modules/home/controllers/controller_cuaca.dart';
import '../components/list_city.dart';
import 'icon_cuaca.dart';

Widget header() {
  return GetBuilder<ControllerCuaca>(
    builder: (value) {
      var cuaca = value.selectCuaca;
      return GetBuilder<ControllerCity>(
        builder: (value2) {
          return Column(
            children: [
              InkWell(
                onTap: () {
                  Get.bottomSheet(
                    const ListCity(),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value2.selectedCity!.kecamatan!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 5),
                    const Icon(
                      CupertinoIcons.chevron_down,
                      size: 20,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
              const SizedBox(height: 5),
              Text(value2.selectedCity!.kota!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                  )),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cuaca!.tempC.toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 120,
                    ),
                  ),
                  // SizedBox(width: 5),
                  Text(
                    "\u00B0",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w200,
                      fontSize: 70,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FutureBuilder<void>(
                    future: initializeDateFormatting('id_ID', null),
                    builder:
                        (BuildContext context, AsyncSnapshot<void> snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return Text(
                          DateFormat('EEEE, dd MMMM yyyy', 'id_ID')
                              .format(cuaca.jamCuaca!),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        );
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  SizedBox(width: 10),
                  Text(
                    "${cuaca.jamCuaca!.hour.toString().padLeft(2, '0')}:${cuaca.jamCuaca!.minute.toString().padLeft(2, '0')}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Text(
                cuaca.cuaca!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 25),
              SimpleShadow(
                opacity: 0.7, // Default: 0.5
                offset: Offset(15, 10), // Default: Offset(2, 2)
                sigma: 10, // Default: 2
                child: iconCuaca(
                  cuaca,
                  size: 160,
                ),
              )
            ],
          );
        },
      );
    },
  );
}
