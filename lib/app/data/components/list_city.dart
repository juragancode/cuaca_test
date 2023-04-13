import 'package:cuaca_test/app/modules/home/controllers/controller_city.dart';
import 'package:cuaca_test/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

final HomeController controller = Get.find();

class ListCity extends StatefulWidget {
  const ListCity({Key? key}) : super(key: key);

  @override
  _ListCityState createState() => _ListCityState();
}

class _ListCityState extends State<ListCity> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: GetBuilder<ControllerCity>(
        builder: (value) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              shadowColor: Colors.transparent,
              leading: IconButton(
                iconSize: 30,
                icon: Icon(
                  CupertinoIcons.back,
                ),
                color: Colors.black,
                onPressed: () {
                  Get.back();
                },
              ),
              // title: TextField(
              //   controller: searchController,
              //   decoration: InputDecoration(
              //     hintText: "Search",
              //     hintStyle: TextStyle(color: Colors.grey),
              //     border: InputBorder.none,
              //   ),
              //   onChanged: filterSearchResults,
              // ),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              child: SingleChildScrollView(
                child: Wrap(
                  children: [
                    for (var item in value.modelListCity!)
                      InkWell(
                        onTap: () {
                          value.selec(item);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(7.5),
                          decoration: BoxDecoration(
                            color: item == value.selectedCity
                                ? Color.fromARGB(255, 150, 45, 255)
                                : Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: item == value.selectedCity
                                  ? Color.fromARGB(255, 150, 45, 255)
                                  : Colors.grey.shade400,
                            ),
                          ),
                          padding: const EdgeInsets.fromLTRB(
                            9.5,
                            7.5,
                            9.5,
                            7.5,
                          ),
                          child: Text(
                            item.kecamatan ?? "kota",
                            style: TextStyle(
                              color: item == value.selectedCity
                                  ? Colors.white
                                  : Colors.grey.shade900,
                              fontSize: 16,
                              fontWeight: item == value.selectedCity
                                  ? FontWeight.bold
                                  : FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
