import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:society/forms/users/choose_socity.dart';
import 'package:society/forms/admin/temp.dart';

import '../../../widgets/round_button.dart';
import '../../../widgets/text_field.dart';

class AdminCreateSociety extends StatefulWidget {
  const AdminCreateSociety({Key? key}) : super(key: key);

  @override
  State<AdminCreateSociety> createState() => _AdminCreateSocietyState();
}

class _AdminCreateSocietyState extends State<AdminCreateSociety> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Choose City"),
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 10),
                Text("Country "),
                TextFieldCustom(hint: 'India'),
                SizedBox(height: 10),
                Text("City "),
                TextFieldCustom(hint: 'Bhopal'),
                SizedBox(height: 10),
                Text("Name of society "),
                TextFieldCustom(hint: 'Name of society'),
                SizedBox(height: 10),
                Text("Select Your Building"),
                SizedBox(height: 10),
                DropdownCheckbox(
                  options: [
                    'Houses',
                    'Flats',
                  ],
                ),
                // RoundedButton(title: "OK", onTap: () {}),
                // ExpansionTile(
                //   title: const Text('galaxy Two.'),
                //   children: <Widget>[
                //     Builder(
                //       builder: (BuildContext context) {
                //         return Container(
                //           // padding: const EdgeInsets.all(24),
                //           alignment: Alignment.center,
                //           child: Text("2"),
                //         );
                //       },
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
