import 'package:flutter/material.dart';
import 'package:third_app/Quote_Card.dart';
import 'quotes.dart';


void main() {
  runApp(MaterialApp(
    home: QuoteList(),
  ));
}
  class QuoteList extends StatefulWidget {
  @override
  _QuoteListState createState() => _QuoteListState(); // createState() called by framework when want to create state which return object of QuoteList widget state( _QuoteListState)
  }

  class _QuoteListState extends State<QuoteList> { // contain mutable data
  List<Quote> quotes = [
    Quote(author: 'Oscar Wilde', text: 'Be yourself; everyone else is already taken'),
    Quote(author: 'Oscar Wilde', text: 'I have nothing to declare except my genius'),
    Quote(author: 'Oscar Wilde', text: 'The truth is rarely pure and never simple')
  ];

  /*Widget return type of function*/
  Widget quoteTemplate(quote){
    return QuoteCard(quote:quote); // name parameter
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
     backgroundColor: Colors.grey,
     appBar: AppBar(
       title: Text('Awesome Quotes'),
       centerTitle: true,
       backgroundColor: Colors.red,
     ),
    body: Column(
      // children: quotes.map((quote){// map iterate through list
      //   return Text('${quote.text} - ${quote.author}');
      //   }).toList(),
         children: quotes.map((quote) => QuoteCard(
             quote:quote,
             delete :(){
               setState(() {
                 quotes.remove(quote);
               });
             }
         )).toList(),
    )
    );
  }
  }

