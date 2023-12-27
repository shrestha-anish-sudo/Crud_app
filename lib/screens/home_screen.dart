import 'package:crud_app/screens/Add_note_screens.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Widget _buildnotes(int index) {
    return Padding(
      padding: EdgeInsets.symmetric(
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
          Divider(
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
            Navigator.push(context, CupertinoPageRoute(builder: (_) => AddNotesScreen(),));


          },
          child: const Icon(Icons.add),
        ),
        body: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 80),
            itemCount: 10,
            itemBuilder: (BuildContext, int index) {
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
                        '0 of 10',
                        style: TextStyle(
                          color: Colors.deepPurple,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return _buildnotes(index);
            }),
      ),
    );
  }
}
