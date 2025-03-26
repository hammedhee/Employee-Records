import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:supabase_crud/LoginPage/AddPage/addpage.dart';
import 'package:supabase_crud/LoginPage/loginpage.dart';
import 'package:supabase_crud/viewmodel/employeeprovider.dart';
import 'package:supabase_crud/viewmodel/image_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    super.initState();
    Provider.of<Employeeprovider>(context, listen: false).getData();
    Provider.of<ImagePro>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepOrangeAccent,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (ctx) => Addpage()),
          );
        },
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              ),
              color: Colors.deepOrangeAccent,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.recent_actors_outlined,
                      size: 30,
                      color: Colors.amberAccent,
                    ),
                    Gap(10),
                    Text(
                      'Employee ',
                      style: TextStyle(color: Colors.white, fontSize: 28),
                    ),
                    Text(
                      'Records',
                      style: TextStyle(color: Colors.yellow, fontSize: 28),
                    ),
                  ],
                ),
                Gap(20),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search employee...",
                          prefixIcon: Icon(Icons.search, color: Colors.grey),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: EdgeInsets.symmetric(vertical: 10),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    Gap(10),
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (ctx) {
                              return LoginPage();
                            },
                          ),
                        );
                      },
                      icon: Icon(Icons.settings, color: Colors.white, size: 35),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Consumer<Employeeprovider>(
              builder: (context, value, child) {
                final reversedList = value.dataListpro.reversed.toList();
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: reversedList.length,

                  itemBuilder: (context, index) {
                    final data = reversedList[index];
                    return SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      radius: 30,
                                      backgroundImage: NetworkImage(
                                        data.imagePath.toString(),
                                      ),
                                    ),
                                    Gap(20),
                                    Text(data.name!),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
