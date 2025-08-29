import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final AuthController c = Get.put(AuthController());

  final emailC = TextEditingController();
  final passC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: emailC,
              decoration: const InputDecoration(labelText: "Email"),
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: passC,
              decoration: const InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            Obx(
              () => c.isLoading.value
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: () {
                        if (emailC.text.isNotEmpty && passC.text.isNotEmpty) {
                          c.login(emailC.text.trim(), passC.text.trim());
                        } else {
                          Get.snackbar(
                            "Error",
                            "Email dan password harus diisi",
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                      child: const Text("Login"),
                    ),
            ),
            TextButton(
              onPressed: () => Get.toNamed(Routes.REGISTER),
              child: const Text("Register"),
            ),
          ],
        ),
      ),
    );
  }
}
