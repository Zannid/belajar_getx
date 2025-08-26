import 'package:belajar_getx/app/modules/FormPendaftaran/views/result_screen_view.dart';
import 'package:get/get.dart';

class FormPendaftaranController extends GetxController {
  RxString name = ''.obs;
  RxString gender = ''.obs;
  Rxn<DateTime> dateOfBirth = Rxn<DateTime>();
  RxString phone = ''.obs;

  RxString nameError = ''.obs;
  RxString genderError = ''.obs;
  RxString dateOfBirthError = ''.obs;
  RxString phoneError = ''.obs;

  void validateName({required String name}) {
    if (name.length < 3) {
      nameError.value = 'Minimal 3 karakter';
    } else if(name.length > 6) {
      nameError.value = 'Maksimal 6 karakter';
    }else {
      nameError.value = '';
    }
  }

  void validateGender({required String? gender}) {
    if (gender == null || gender.isEmpty) {
      genderError.value = 'Pilih jenis kelamin';
    } else {
      genderError.value = '';
    }
  }

  void validateDateOfBirth({required DateTime? tanggalLahir}) {
    if (tanggalLahir == null) {
      dateOfBirthError.value = 'Pilih tanggal lahir';
    } else {
      final now = DateTime.now();
      final age = now.year - tanggalLahir.year;
      if (age < 1) {
        dateOfBirthError.value = 'Usia minimal 1 tahun';
      } else {
        dateOfBirthError.value = '';
      }
    }
  }

  void validatePhone({required String phone}) {
    if (!GetUtils.isPhoneNumber(phone)) {
      phoneError.value = 'Nomor telepon tidak valid';
    } else {
      phoneError.value = '';
    }
  }

  void submitForm() {
    validateName(name: name.value);
    validateGender(gender: gender.value);
    validateDateOfBirth(tanggalLahir: dateOfBirth.value);
    validatePhone(phone: phone.value);

    if (nameError.value.isEmpty &&
        genderError.value.isEmpty &&
        dateOfBirthError.value.isEmpty &&
        phoneError.value.isEmpty) {
      Get.to(() => ResultScreenView(
        name: name.value,
        gender: gender.value,
        dateOfBirth: dateOfBirth.value!,
        phone: phone.value,
      ));
    } else {
      Get.snackbar('Error', 'Periksa kembali data yang dimasukkan.');
      
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
