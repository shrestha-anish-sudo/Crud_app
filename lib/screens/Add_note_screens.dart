import 'package:crud_app/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  String _title = '';
  String _priority = 'Low';
  String btnText = "Add Note";
  String titleText = "Add Note";
  DateTime _date = DateTime.now();
  final _formkey = GlobalKey<FormState>();
  TextEditingController _dateController = TextEditingController();
  final DateFormat _dateformatter = DateFormat('MMM dd, YYYY');
  final List<String> _priorities = ['Low', 'Medium', 'High'];

  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateformatter.format(date);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.blueAccent,
          body: GestureDetector(
            onTap: () {},
            child: SingleChildScrollView(
              child: Container(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () => Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (_) => HomeScreen(),
                          ),
                        ),
                        child: Icon(
                          Icons.arrow_back,
                          size: 30,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Add Note',
                        style: TextStyle(
                          color: Colors.deepPurpleAccent,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Form(
                        key: _formkey,
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: TextFormField(
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                                onTap: _handleDatePicker,
                                decoration: InputDecoration(
                                    labelText: 'Title',
                                    labelStyle: TextStyle(fontSize: 18),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: TextFormField(
                                readOnly: true,
                                controller: _dateController,
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                                onTap: _handleDatePicker,
                                decoration: InputDecoration(
                                    labelText: 'Date',
                                    labelStyle: TextStyle(fontSize: 18),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    )),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 20.0),
                              child: DropdownButtonFormField<String>(
                                items: _priorities.map((String priority) {
                                  return DropdownMenuItem<String>(
                                    value: priority,
                                    child: Text(
                                      priority,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                      ),
                                    ),
                                  );
                                }).toList(),
                                style: const TextStyle(
                                  fontSize: 18,
                                ),
                                decoration: InputDecoration(
                                    labelText: 'Priority',
                                    labelStyle: TextStyle(
                                      fontSize: 18,
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(10))),
                                onChanged: (value) {
                                  setState(() {
                                    _priority = value.toString();
                                  });
                                },
                                value: _priority,
                                // decoration: const InputDecoration(
                                //   labelText: 'Priority',
                                //   labelStyle: TextStyle(fontSize: 18),
                                // ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 20),
                              height: 60,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(30),

                              ),
                              child: ElevatedButton(onPressed: (){

                              }, child: Text(
                                btnText,style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.white
                                ),
                              )),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )),
    );
  }
}
