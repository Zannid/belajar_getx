import 'package:get/get.dart';

import '../middlewares/auth_middleware.dart';
import '../modules/Al-Quran/bindings/al_quran_binding.dart';
import '../modules/Al-Quran/views/al_quran_view.dart';
import '../modules/FormPendaftaran/bindings/form_pendaftaran_binding.dart';
import '../modules/FormPendaftaran/views/form_pendaftaran_view.dart';
import '../modules/Post/bindings/post_binding.dart';
import '../modules/Post/views/post_view.dart';
import '../modules/auth/bindings/auth_binding.dart';
import '../modules/auth/views/login_view.dart';
import '../modules/auth/views/register_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';

import '../modules/Post/views/post_detail_view_view.dart'; // cek: mungkin sebaiknya `post_detail_view.dart`

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME; // pakai , bukan var

  static final routes = <GetPage>[
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.FORM_PENDAFTARAN,
      page: () => FormPendaftaranView(),
      binding: FormPendaftaranBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.POST,
      page: () => PostView(),
      binding: PostBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.AL_QURAN,
      page: () => AlQuranView(),
      binding: AlQuranBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}
