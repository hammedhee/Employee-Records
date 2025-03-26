import 'dart:io';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:supabase_crud/model/crud_model.dart';
import 'package:supabase_crud/viewmodel/employeeprovider.dart';
import 'package:supabase_crud/viewmodel/image_provider.dart';

class Addpage extends StatefulWidget {
  const Addpage({super.key});

  @override
  State<Addpage> createState() => _AddpageState();
}

class _AddpageState extends State<Addpage> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController positionController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Provider.of<Employeeprovider>(context, listen: false).getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 180,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepOrangeAccent, Colors.amberAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.person_add, size: 50, color: Colors.white),
                Text(
                  'Add New Employee',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Gap(30),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Consumer<ImagePro>(
                          builder:
                              (context, value, child) => GestureDetector(
                                onTap: () {
                                  value.addImage();
                                },
                                child: CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.amber,
                                  backgroundImage:
                                      value.imageFil != null
                                          ? FileImage(
                                            File(value.imageFil!.path),
                                          )
                                          : null,
                                ),
                              ),
                        ),
                      ],
                    ),
                    textInputCard("Full Name", Icons.person, nameController),
                    Gap(15),
                    textInputCard("Position", Icons.work, positionController),
                    Gap(15),
                    textInputCard(
                      "Salary",
                      Icons.monetization_on,
                      salaryController,
                    ),
                    Gap(15),
                    textInputCard("Phone Number", Icons.phone, phoneController),
                    Gap(40),
                    Consumer<Employeeprovider>(
                      builder:
                          (context, value, child) => ElevatedButton(
                            onPressed:
                                _validateAndSubmit, // Validation before saving
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                horizontal: 80,
                                vertical: 15,
                              ),
                              backgroundColor: Colors.deepOrangeAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                                side: BorderSide(color: Colors.amber, width: 2),
                              ),
                              elevation: 8,
                              shadowColor: Colors.black12,
                            ),
                            child: Text(
                              "SAVE",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _validateAndSubmit() {
    if (nameController.text.isEmpty ||
        positionController.text.isEmpty ||
        salaryController.text.isEmpty ||
        phoneController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            "Please fill all fields!",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } else {
      context.read<Employeeprovider>().addDtataPro(
        CrudModel(
          imagePath: context.read<ImagePro>().imgUrl,
          salary: salaryController.text,
          name: nameController.text,
          position: positionController.text,
          phone: phoneController.text,
        ),
      );

      salaryController.clear();
      nameController.clear();
      positionController.clear();
      phoneController.clear();
      Navigator.pop(context);
    }
  }

  Widget textInputCard(
    String label,
    IconData icon,
    TextEditingController controller,
  ) {
    return Card(
      color: Colors.white,
      shadowColor: Colors.black,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
            prefixIcon: Icon(icon, color: Colors.deepOrangeAccent),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
