import 'package:crud_app/Database/Database.dart';
import 'package:crud_app/Models/Note_models.dart';
import 'package:crud_app/screens/Add_note_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Note>> _notelist;
  final DateFormat _dateFormatter = DateFormat('MMM DD, YYYY');
  DatabaseHelper _databaseHelper = DatabaseHelper.instance;
  void initstate() {
    _updateNoteList();
    super.initState();
  }

  _updateNoteList() {
    _notelist = DatabaseHelper.instance.getNoteList();
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
              return const Padding(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'My Notes',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '0 - 10',
                      style: TextStyle(
                        color: Colors.deepPurple,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(
                      height: 10,
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

// class AddNotesScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add Note'),
//       ),
//       body: Center(
//         child: Text('Add your note here!'),
//       ),
//     );
//   }
// }
