import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  late SharedPreferences logindata;
  String name = '';
  String email = '';
  String phone = '';

  @override
  void initState() {
    super.initState();
    initial();
  }

  void initial() async {
    logindata = await SharedPreferences.getInstance();
    setState(() {
      name = logindata.getString('name')!;
      email = logindata.getString('email')!;
      phone = logindata.getString('phone')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Profile",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              leading: const Text(
                "Name: ",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              title: Text(name),
            ),
            ListTile(
              leading: const Text(
                "Email: ",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              title: Text(email),
            ),
            ListTile(
              leading: const Text(
                "Mobile No: ",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
              ),
              title: Text(phone),
            ),
          ],
        ),
      ),
    );
  }
}
