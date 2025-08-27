import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/form_pendaftaran_controller.dart';

class FormPendaftaranView extends GetView<FormPendaftaranController> {
  const FormPendaftaranView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Form Pendaftaran',
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
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlue[50]!, Colors.lightBlue[100]!],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // Header Card
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(25),
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
                          Icons.person_add,
                          size: 50,
                          color: Colors.lightBlue[600],
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Daftar Akun Baru',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue[800],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Lengkapi data diri Anda dengan benar',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.lightBlue[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                // Form Card
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        // Nama Lengkap Field
                        Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: controller.nameError.value.isNotEmpty
                                    ? Colors.red
                                    : Colors.lightBlue[200]!,
                              ),
                              color: Colors.lightBlue[25],
                            ),
                            child: TextField(
                              onChanged: (value) {
                                controller.name.value = value;
                                controller.validateName(name: value);
                              },
                              decoration: InputDecoration(
                                labelText: 'Nama Lengkap',
                                prefixIcon: Icon(
                                  Icons.person,
                                  color: Colors.lightBlue[600],
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.lightBlue[700],
                                ),
                                errorText: controller.nameError.value.isNotEmpty
                                    ? controller.nameError.value
                                    : null,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Jenis Kelamin Dropdown
                        Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: controller.genderError.value.isNotEmpty
                                    ? Colors.red
                                    : Colors.lightBlue[200]!,
                              ),
                              color: Colors.lightBlue[25],
                            ),
                            child: DropdownButtonFormField<String>(
                              value: controller.gender.value.isEmpty
                                  ? null
                                  : controller.gender.value,
                              hint: Text(
                                'Pilih Jenis Kelamin',
                                style: TextStyle(color: Colors.lightBlue[700]),
                              ),
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
                                controller.validateGender(gender: value ?? '');
                              },
                              decoration: InputDecoration(
                                labelText: "Jenis Kelamin",
                                prefixIcon: Icon(
                                  Icons.wc,
                                  color: Colors.lightBlue[600],
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.lightBlue[700],
                                ),
                                errorText:
                                    controller.genderError.value.isNotEmpty
                                        ? controller.genderError.value
                                        : null,
                              ),
                              dropdownColor: Colors.white,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Tanggal Lahir
                        Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color:
                                    controller.dateOfBirthError.value.isNotEmpty
                                        ? Colors.red
                                        : Colors.lightBlue[200]!,
                              ),
                              color: Colors.lightBlue[25],
                            ),
                            child: ListTile(
                              leading: Icon(
                                Icons.calendar_today,
                                color: Colors.lightBlue[600],
                              ),
                              title: Text(
                                controller.dateOfBirth.value == null
                                    ? 'Pilih Tanggal Lahir'
                                    : DateFormat('dd MMMM yyyy')
                                        .format(controller.dateOfBirth.value!),
                                style: TextStyle(
                                  color: controller.dateOfBirth.value == null
                                      ? Colors.lightBlue[700]
                                      : Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                              trailing: Icon(
                                Icons.arrow_drop_down,
                                color: Colors.lightBlue[600],
                              ),
                              onTap: () async {
                                DateTime? selectedDate = await showDatePicker(
                                  context: context,
                                  initialDate: controller.dateOfBirth.value ??
                                      DateTime.now(),
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime.now(),
                                  builder: (context, child) {
                                    return Theme(
                                      data: Theme.of(context).copyWith(
                                        colorScheme: ColorScheme.light(
                                          primary: Colors.lightBlue[600]!,
                                          onPrimary: Colors.white,
                                          surface: Colors.white,
                                        ),
                                      ),
                                      child: child!,
                                    );
                                  },
                                );
                                if (selectedDate != null) {
                                  controller.dateOfBirth.value = selectedDate;
                                  controller.validateDateOfBirth(
                                      tanggalLahir: selectedDate);
                                }
                              },
                              subtitle: controller
                                      .dateOfBirthError.value.isNotEmpty
                                  ? Text(
                                      controller.dateOfBirthError.value,
                                      style: const TextStyle(color: Colors.red),
                                    )
                                  : null,
                            ),
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Nomor Telepon Field
                        Obx(
                          () => Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: controller.phoneError.value.isNotEmpty
                                    ? Colors.red
                                    : Colors.lightBlue[200]!,
                              ),
                              color: Colors.lightBlue[25],
                            ),
                            child: TextField(
                              onChanged: (value) {
                                controller.phone.value = value;
                                controller.validatePhone(phone: value);
                              },
                              keyboardType: TextInputType.phone,
                              decoration: InputDecoration(
                                labelText: 'Nomor Telepon',
                                prefixIcon: Icon(
                                  Icons.phone,
                                  color: Colors.lightBlue[600],
                                ),
                                border: InputBorder.none,
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 16,
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.lightBlue[700],
                                ),
                                errorText:
                                    controller.phoneError.value.isNotEmpty
                                        ? controller.phoneError.value
                                        : null,
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Submit Button
                        Container(
                          width: double.infinity,
                          height: 55,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            gradient: LinearGradient(
                              colors: [
                                Colors.lightBlue[400]!,
                                Colors.lightBlue[600]!
                              ],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.lightBlue.withOpacity(0.3),
                                spreadRadius: 2,
                                blurRadius: 8,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              controller.submitForm();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.transparent,
                              shadowColor: Colors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.send,
                                  color: Colors.white,
                                  size: 24,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Daftar Sekarang',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
