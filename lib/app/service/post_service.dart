import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PostService extends GetConnect {
  String? token;
  final box = GetStorage();

  final String baseUrl = 'http://127.0.0.1:8000/api'; // simpan di field

  @override
  void onInit() {
    httpClient.baseUrl = baseUrl;
    super.onInit();
  }

  void setToken(String tkn) {
    token = tkn;
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Authorization'] = 'Bearer $token';
      return request;
    });
  }

  // ambil semua post
  Future<Response> fetchPosts() async {
    try {
      final token = box.read("token");
      return await get(
        "/posts",
        headers: {"Authorization": "Bearer $token"},
      );
    } catch (e) {
      return Response(statusCode: 500, statusText: e.toString());
    }
  }

  // tambah post baru
  Future<Response> postPost(
      String title, String content, String status, String foto) {
    return post(
      '/posts',
      {
        'title': title,
        'content': content,
        'status': status,
        'foto': foto,
      },
    );
  }

  // update post
  Future<Response> updatePost(
      int id, String title, String content, String status, String foto) {
    return put(
      '/posts/$id',
      {
        'title': title,
        'content': content,
        'status': status,
        'foto': foto,
      },
    );
  }

  // hapus post
  Future<Response> deletePost(int id) {
    return delete('/posts/$id');
  }
}
