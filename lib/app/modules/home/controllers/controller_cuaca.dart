import 'dart:developer';

import 'package:cuaca_test/app/models/cuaca_model.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ControllerCuaca extends GetxController {
  bool load = true;
  String? errorMessage;
  List<ModelListCuaca> modelListCuaca = [];
  ModelListCuaca? selectCuaca;

  selectIndexCuaca(int index) {
    selectCuaca = modelListCuaca[index];
    update();
  }

  getCuca(String id) async {
    load = true;
    errorMessage = null;
    update();

    try {
      var res = await Dio(
        BaseOptions(
          sendTimeout: Duration(milliseconds: 8000),
          connectTimeout: Duration(milliseconds: 8000),
          receiveTimeout: Duration(milliseconds: 8000),
          responseType: ResponseType.plain,
        ),
      ).get("https://ibnux.github.io/BMKG-importer/cuaca/$id.json");

      if (res.statusCode == 200) {
        modelListCuaca = modelListCuacaFromJson(res.data);
        selectCuaca = modelListCuaca[0];
        load = false;
        log(res.data);
        update();
      } else {
        errorMessage = "Error " + res.statusCode.toString();
        load = false;
        log(res.statusCode.toString());
        update();
      }
    } on DioError catch (e) {
      load = false;
      errorMessage = e.message;
      log(e.message.toString());

      update();
    }
  }
}
