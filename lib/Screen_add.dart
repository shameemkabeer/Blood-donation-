import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class Adduser extends StatefulWidget {
  const Adduser({super.key});

  @override
  State<Adduser> createState() => _AdduserState();
}

class _AdduserState extends State<Adduser> {
  final bloodgrps = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];
  String? selectedgrps;
  final CollectionReference donor =
      FirebaseFirestore.instance.collection('donor');

  TextEditingController donorName = TextEditingController();
  TextEditingController donorNumber = TextEditingController();

  void adddonor() {
    final data = {
      'name': donorName.text,
      'phone': donorNumber.text,
      'group': selectedgrps
    };
    donor.add(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Users"),
        backgroundColor: Colors.red,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.name,
                  controller: donorName,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), label: Text("Donor name")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.phone,
                  maxLength: 10,
                  controller: donorNumber,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Phone Number")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      label: Text("Select blood group"),
                    ),
                    items: bloodgrps
                        .map(
                          (e) => DropdownMenuItem(
                            child: Text(e),
                            value: e,
                          ),
                        )
                        .toList(),
                    onChanged: (val) {
                      selectedgrps = val as String?;
                    }),
              ),
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: ElevatedButton(
                    onPressed: () {
                      if (donorName.text.isEmpty ||
                          donorNumber.text.isEmpty ||
                          selectedgrps == null) {
                        // print("nothing found");
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Please enter the values"),
                          ),
                        );
                      } else {
                        adddonor();
                        Navigator.pop(context);
                      }
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      minimumSize: MaterialStateProperty.all(
                        Size(double.infinity, 50),
                      ),
                    ),
                    child: Text(
                      "Submit",
                      style: TextStyle(fontSize: 18),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
