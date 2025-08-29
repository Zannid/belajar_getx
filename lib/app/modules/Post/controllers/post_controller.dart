import 'package:belajar_getx/app/data/models/post.dart';
import 'package:belajar_getx/app/service/post_service.dart';
import 'package:get/get.dart';

class PostController extends GetxController {
  final PostService postService = Get.put<PostService>(PostService());

  RxList<Post> posts = <Post>[].obs;
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
        // ambil list dari key "data"
        final List<dynamic> data = response.body['data'];

        final postsData =
            data.map((postJson) => Post.fromJson(postJson)).toList();

        posts.assignAll(postsData);
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
