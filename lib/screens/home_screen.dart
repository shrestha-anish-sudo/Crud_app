import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  Widget _buildnotes(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 25.0,
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('Note Title'),
            subtitle: Text('December 14, 2023 - high'),
            trailing: Checkbox(
              onChanged: (value) {
                print(value);
              },
              activeColor: Theme.of(context).primaryColor,
              value: true,
            ),
          ),
          const Divider(
            height: 5,
            color: Colors.deepPurpleAccent,
            thickness: 2.0,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blueAccent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (_) => AddNotesScreen(),
              ),
            );
          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
          padding: const EdgeInsets.symmetric(vertical: 80),
          itemCount: 10,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const Text(
                      'My Notes',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '0 - 10',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
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
                            child: TextField(
                              readOnly: true,
                              controller: _dateController,
                              style: const TextStyle(
                                fontSize: 18,
                              ),
                              onTap: _handleDatePicker,
                              decoration: const InputDecoration(
                                labelText: 'Title',
                                labelStyle: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: DropdownButtonFormField<String>(
                              items: _priorities.map((String priority) {
                                return DropdownMenuItem<String>(
                                  value: priority,
                                  child: Text(priority,style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                  ),),
                                );
                              }).toList(),
                              style: TextStyle(
                                fontSize: 18,
                                decoration: InputDecoration(
                                  labelText: 'Priority',
                                  labelStyle: TextStyle(
                                    fontSize: 18,
                                    
                                  )
                                )
                              )
                              onChanged: (String? value) {
                                setState(() {
                                  _priority = value!;
                                });
                              },
                              value: _priority,
                              decoration: const InputDecoration(
                                labelText: 'Priority',
                                labelStyle: TextStyle(fontSize: 18),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return _buildnotes(index);
          },
        ),
      ),
    );
  }
}

class AddNotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Note'),
      ),
      body: Center(
        child: Text('Add your note here!'),
      ),
    );
  }
}
