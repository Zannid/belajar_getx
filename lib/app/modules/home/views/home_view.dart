import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HomeView',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.lightBlue[600],
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.lightBlue[400]!, Colors.lightBlue[700]!],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue[50]!, Colors.lightBlue[100]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            // ✅ Bisa di-scroll
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Welcome Card
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      gradient: LinearGradient(
                        colors: [Colors.white, Colors.lightBlue[50]!],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Column(
                      children: [
                        Icon(
                          Icons.home,
                          size: 60,
                          color: Colors.lightBlue[600],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Welcome to HomeView',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue[800],
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Everything is working perfectly!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.lightBlue[600],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                // Counter Button
                _menuButton(
                  icon: Icons.calculate,
                  label: 'Go to Counter',
                  onTap: () => Get.toNamed('/counter'),
                  gradient: true,
                ),

                const SizedBox(height: 20),

                // Form Registration Button
                _menuButton(
                  icon: Icons.app_registration,
                  label: 'Form Pendaftaran',
                  onTap: () => Get.toNamed('/form-pendaftaran'),
                ),

                const SizedBox(height: 20),

                // Get Post Button
                _menuButton(
                  icon: Icons.post_add,
                  label: 'Get Post',
                  onTap: () => Get.toNamed('/post'),
                ),

                const SizedBox(height: 20),

                // Al-Quran Button
                _menuButton(
                  icon: Icons.menu_book,
                  label: 'Al-Quran',
                  onTap: () => Get.toNamed('/al-quran'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
    bool gradient = false,
  }) {
    return Container(
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        gradient: gradient
            ? LinearGradient(
                colors: [Colors.lightBlue[400]!, Colors.lightBlue[600]!])
            : null,
        border: gradient
            ? null
            : Border.all(color: Colors.lightBlue[400]!, width: 2),
        color: gradient ? null : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.lightBlue.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon,
                color: gradient ? Colors.white : Colors.lightBlue[600],
                size: 24),
            const SizedBox(width: 10),
            Text(
              label,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: gradient ? Colors.white : Colors.lightBlue[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
