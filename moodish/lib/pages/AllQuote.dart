//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:midterm_app/controllers/note_controller.dart';
import 'package:midterm_app/models/Note.dart';
import 'package:midterm_app/models/NotesOperation.dart';
import 'package:provider/provider.dart';

class AllQuote extends StatefulWidget {
  final NoteController controller;

  AllQuote({required this.controller});
  
  @override
  _AllQuoteState createState() => _AllQuoteState();
}

class _AllQuoteState extends State<AllQuote> {
  List<Note> notes = List.empty();
  bool isLoading = false;

  void initState() {
    super.initState();

    widget.controller.onSync.listen(
      (bool syncState) => setState(() => isLoading = syncState),
    );
  }

  void _getNotes() async {
    var newNotes = await widget.controller.fetchNotes();

    setState(() => notes = newNotes);
  }

  Widget get body => isLoading
          ? CircularProgressIndicator()
          : ListView.builder(
            itemCount: notes.isEmpty ? 1 : notes.length,
            itemBuilder: (ctx, index) {
              if (notes.isEmpty) {
                return Text('Tap button to fetch notes');
              }
              return ListTile(
                title: Text(notes[index].quoteText),
                //subtitle: Text(notes[index].date),
                //subtitle: Text(formattedDate(notes[index].date)),
                subtitle: Text('${notes[index].date}'),
              );
            },
          );
  //UI ของมิดเทอม
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: _getNotes,
        //() {
        //  Navigator.pushNamed(context, '/9');
        //},
        child: Icon(
          Icons.add,
          size: 30,
        ),
      ),
      appBar: AppBar(
        title: Text('All your quote'),
      ),
      body: Center(child: body)
      //Consumer<NotesOperation>(
      //  builder: (context, NotesOperation data, child) {
      //    return ListView.builder(
      //      itemCount: data.getNotes.length,
      //      itemBuilder: (context, index) {
      //        return NotesCard(data.getNotes[index]);
      //      },
      //    );
      //  },
      //),
    );
  }
}

class NotesCard extends StatelessWidget {
  final now = DateTime.now();
  final Note note;
  NotesCard(this.note);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      height: 120,
      decoration: BoxDecoration(
          color: Color(0xFFFFC392), borderRadius: BorderRadius.circular(15)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '${now.day}' +
                  ' / ' +
                  '${now.month}' +
                  ' / ' +
                  '${now.year}' +
                  ' at ' +
                  '${now.hour} : ${now.minute}',
              style: TextStyle(color: Colors.white)),
          //Center(
          //  child: Padding(
          //    padding: const EdgeInsets.all(12.0),
          //    child: Text(
          //      note.quote,
          //      style: TextStyle(
          //          fontSize: 18,
          //          fontWeight: FontWeight.w400,
          //          color: Color(0xFF5F478C)),
          //    ),
          //  ),
          //),
          SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
