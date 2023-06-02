import 'package:flutter/material.dart';

class RidePage extends StatefulWidget {
  @override
  _RidePageState createState() => _RidePageState();
}

class _RidePageState extends State<RidePage> {
  List<String> postings = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ride'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: postings.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(postings[index]),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  'Make a New Post',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('New Post'),
                          content: TextField(
                            decoration: InputDecoration(
                              hintText: 'Enter your post',
                            ),
                            onChanged: (value) {
                              // Update the post value
                              // You can store the value in a database or a state management solution
                            },
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                // Add the new post to the list
                                setState(() {
                                  postings.add('New Post');
                                });
                                Navigator.pop(context);
                              },
                              child: Text('Post'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Text('Create New Post'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
