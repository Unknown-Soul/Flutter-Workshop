import 'package:flutter/material.dart';
import 'quotes.dart';

class QuoteCard extends StatelessWidget {

  final Quote quote;  // final because stateless widget don't change
  final Function delete;
  QuoteCard({this.quote,  this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                quote.text,
                style: TextStyle(
                  fontSize: 19.0,
                  color: Colors.grey[600],
                )),
            SizedBox(height: 6.0),
            Text(
              quote.author,
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey[800],
              ),
            ),
            SizedBox(height: 8.0),
            FlatButton.icon(
                onPressed: delete, /// although data is not defined in this file so we cannot modify it , So we need to pass this to main file
                icon: Icon(Icons.delete),
                label: Text('Delete')
            )
          ],
        ),
      ),
    );
  }
}
