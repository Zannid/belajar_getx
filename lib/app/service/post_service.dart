import 'dart:io';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PostService extends GetConnect {
  String? token;
  final box = GetStorage();

  final String base = 'http://127.0.0.1:8000/api';

  @override
  void onInit() {
    httpClient.baseUrl = base;
    httpClient.timeout = const Duration(seconds: 30);
    super.onInit();
  }

  void setToken(String tkn) {
    token = tkn;
    httpClient.addRequestModifier<dynamic>((request) {
      request.headers['Authorization'] = 'Bearer $token';
      return request;
    });
  }

  Map<String, String> _headers() {
    final tkn = box.read("token");
    return {
      "Accept": "application/json",
      "Authorization": "Bearer $tkn",
    };
  }

  /// ambil semua post
  Future<Response> fetchPosts() async {
    try {
      return await get("/posts", headers: _headers());
    } catch (e) {
      return Response(statusCode: 500, statusText: e.toString());
    }
  }

  /// tambah post baru
  Future<Response> createPost({
    required String title,
    required String content,
    required int status,
    File? foto,
  }) async {
    final form = FormData({
      'title': title,
      'content': content,
      'status': status.toString(),
      if (foto != null)
        'foto': MultipartFile(foto, filename: foto.path.split('/').last),
    });

    return await post('/posts', form, headers: _headers());
  }

  /// update post
  Future<Response> updatePost({
    required int id,
    required String title,
    required String content,
    required int status,
    File? foto,
  }) async {
    final form = FormData({
      'title': title,
      'content': content,
      'status': status.toString(),
      if (foto != null)
        'foto': MultipartFile(foto, filename: foto.path.split('/').last),
    });

    return await put('/posts/$id', form, headers: _headers());
  }

  /// hapus post
  Future<Response> deletePost(int id) async {
    return await delete('/posts/$id', headers: _headers());
  }
}
