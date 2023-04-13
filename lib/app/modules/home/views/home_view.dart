import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../data/components/list_cuaca.dart';
import '../../../data/widgets/header.dart';

import '../controllers/controller_city.dart';
import '../controllers/controller_cuaca.dart';
import '../../../data/widgets/animasi.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // ControllerCuaca controllerCity = Get.put(ControllerCuaca());
  ControllerCity controllerCity = Get.put(ControllerCity());

  @override
  void initState() {
    super.initState();
    controllerCity.getCity();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ControllerCity>(
      builder: (value1) {
        return value1.load
            ? const Scaffold(
                backgroundColor: Colors.white,
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              )
            : value1.errorMessage == null
                ? GetBuilder<ControllerCuaca>(
                    builder: (value) {
                      return value.load
                          ? const Scaffold(
                              backgroundColor: Colors.white,
                              body: Center(
                                child: CircularProgressIndicator(),
                              ),
                            )
                          : value.errorMessage == null
                              ? Scaffold(
                                  backgroundColor: Colors.white,
                                  body: SingleChildScrollView(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          decoration: BoxDecoration(
                                            gradient: LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color.fromARGB(
                                                    255, 108, 39, 176),
                                                Color.fromARGB(
                                                    255, 88, 180, 255)
                                              ],
                                            ),
                                          ),
                                          child: Column(
                                            children: [
                                              const SizedBox(
                                                height: 50,
                                              ),
                                              value.selectCuaca == null
                                                  ? const SizedBox(
                                                      width: 0,
                                                      height: 0,
                                                    )
                                                  : header(),
                                              // const SizedBox(height: 10),
                                              animasi(),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          color: Colors.white,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.fromLTRB(
                                                  25,
                                                  15,
                                                  15,
                                                  15,
                                                ),
                                                child: Row(
                                                  children: [
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Text(
                                                          "Hari ini",
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 18,
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                          height: 10,
                                                        ),
                                                        Container(
                                                          width: 60,
                                                          height: 2,
                                                          color: Colors.black,
                                                        )
                                                      ],
                                                    ),
                                                    const SizedBox(width: 20),
                                                    Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            Get.defaultDialog(
                                                                title:
                                                                    "Saatnya Upgrate Aplikasi Anda",
                                                                middleText:
                                                                    "Fitur hanya tersedia versi Premium");
                                                          },
                                                          child: Flexible(
                                                            child: Container(
                                                              color:
                                                                  Colors.white,
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .fromLTRB(
                                                                  15,
                                                                  4,
                                                                  15,
                                                                  15,
                                                                ),
                                                                child:
                                                                    const Text(
                                                                  "Besok",
                                                                  style:
                                                                      TextStyle(
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w600,
                                                                    fontSize:
                                                                        18,
                                                                    color: Colors
                                                                        .grey,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                              SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    const SizedBox(
                                                      width: 20,
                                                    ),
                                                    for (var i = 0;
                                                        i <
                                                            value.modelListCuaca
                                                                .length;
                                                        i++)
                                                      GestureDetector(
                                                        onTap: () {
                                                          value
                                                              .selectIndexCuaca(
                                                                  i);
                                                        },
                                                        child: listCuaca(
                                                          value.modelListCuaca[
                                                              i],
                                                        ),
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : Scaffold(
                                  backgroundColor: Colors.white,
                                  body: Center(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(value.errorMessage ?? "error"),
                                        TextButton(
                                          onPressed: () {
                                            value.getCuca(value1
                                                .selectedCity!.id
                                                .toString());
                                          },
                                          child: const Text("reload"),
                                        )
                                      ],
                                    ),
                                  ),
                                );
                    },
                  )
                : Scaffold(
                    backgroundColor: Colors.white,
                    body: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(value1.errorMessage ?? "error"),
                          TextButton(
                            onPressed: () {
                              value1.getCity();
                            },
                            child: const Text("reload"),
                          ),
                        ],
                      ),
                    ),
                  );
      },
    );
  }
}
