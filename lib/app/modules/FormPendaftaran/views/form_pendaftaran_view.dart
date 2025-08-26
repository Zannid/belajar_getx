import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/form_pendaftaran_controller.dart';

class FormPendaftaranView extends GetView<FormPendaftaranController> {
  const FormPendaftaranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // controller sudah ada dari GetView, jadi nggak perlu Get.put lagi
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form Pendaftaran'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.name.value = value;
                    controller.validateName(name: value);
                  },
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    errorText: controller.nameError.value.isNotEmpty
                        ? controller.nameError.value
                        : null,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Obx(
                () => DropdownButtonFormField<String>(
                  value: controller.gender.value.isEmpty
                      ? null
                      : controller.gender.value,
                  hint: const Text('Pilih Jenis Kelamin'),
                  items: ['Laki-laki', 'Perempuan']
                      .map(
                        (gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    controller.gender.value = value ?? '';
                  },
                  decoration: InputDecoration(
                    labelText: "Jenis Kelamin",
                    errorText: controller.genderError.value.isNotEmpty ? controller.genderError.value : null,
                  ),
                ),
              ),
              SizedBox(height: 20), 
              Obx(() => ListTile(
                    title: Text(controller.dateOfBirth.value == null
                        ? 'Pilih Tanggal Lahir'
                        : DateFormat('dd-MM-yyyy')
                            .format(controller.dateOfBirth.value!)),
                    trailing: Icon(Icons.calendar_today),
                    onTap: () async {
                      DateTime? selectedDate = await showDatePicker(
                        context: context,
                        initialDate: controller.dateOfBirth.value ?? DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      );
                      if (selectedDate != null) {
                        controller.dateOfBirth.value = selectedDate;
                        controller.validateDateOfBirth(tanggalLahir: selectedDate);
                      }
                    },
                    subtitle: controller.dateOfBirthError.value.isNotEmpty
                        ? Text(
                            controller.dateOfBirthError.value,
                            style: TextStyle(color: Colors.red),
                          )
                        : null,
                  )),
                  SizedBox(height: 20),
              Obx(
                () => TextField(
                  onChanged: (value) {
                    controller.phone.value = value;
                    controller.validatePhone(phone: value);
                  },
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Nomor Telepon',
                    errorText: controller.phoneError.value.isNotEmpty
                        ? controller.phoneError.value
                        : null,)
                )),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.submitForm();
                  },
                  child: Text('Submit'))
            ],
          ),
        ),
      ),
    );
  }
}
