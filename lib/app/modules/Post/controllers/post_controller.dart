import 'package:belajar_getx/app/data/models/post.dart';
import 'package:belajar_getx/app/service/post_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final PostService postService = Get.put<PostService>(PostService());

  RxList posts = <Post>[].obs;
  RxBool isLoading = true.obs;
  RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    fetchPost();
  }

  void fetchPost() async {
    try {
      isLoading(true);
      errorMessage('');
      final response = await postService.fetchPosts();
      if (response.statusCode == 200) {
        var data = response.body!
        .map((postJson) => Post.fromJson(postJson))
        .toList();
        posts.assignAll(data);
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
