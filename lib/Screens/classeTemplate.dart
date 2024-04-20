import 'package:flutter/material.dart';

class ClassTemplate extends StatelessWidget {
  final String className;
  final List<String> members = ['Student 1', 'Student 2', 'Student 3']; // Example list of class members

  ClassTemplate({required this.className});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _navigateToClassDetails(context);
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8.0),
        padding: EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.blue, // You can customize the color here
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 5.0,
              spreadRadius: 2.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Text(
          className,
          style: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  void _navigateToClassDetails(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ClassDetailsPage(
          className: className,
          members: members,
        ),
      ),
    );
  }
}

class ClassDetailsPage extends StatelessWidget {
  final String className;
  final List<String> members;

  ClassDetailsPage({required this.className, required this.members});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(className),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: members.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(members[index]),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 10.0),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    // Handle sending message
                  },
                ),
                SizedBox(width: 10.0),
                IconButton(
                  icon: Icon(Icons.attach_file),
                  onPressed: () {
                    // Handle attaching file
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
