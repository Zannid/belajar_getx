import 'package:belajar_getx/app/data/models/alquran.dart';
import 'package:belajar_getx/app/data/models/post.dart';
import 'package:belajar_getx/app/service/alquran_service.dart';
import 'package:belajar_getx/app/service/post_service.dart';
import 'package:get/get.dart';

class AlquranController extends GetxController {
  final AlquranService api = Get.put<AlquranService>(AlquranService());

  RxList alquran = <Alquran>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchAlquran();
  }

void fetchAlquran() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await api.fetchAlquran();
      if (response.statusCode == 200) {
        var data = (response.body as List)
            .map((json) => Alquran.fromJson(json))
            .toList();
        alquran.assignAll(data);
      } else {
        errorMessage('Error: ${response.statusText}');
      }
    } catch (e) {
      errorMessage('Exception: $e');
    } finally {
      isLoading(false);
    }
  }

}
