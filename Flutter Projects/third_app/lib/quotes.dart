class Quote{
  String text;
  String author;

  // constructor to assign value to Text and Author
  Quote({this.text, this.author});
  // above statement can also be written as below function
  // Quote({String text, String author}){ // {} suggest these are named parameters
  //   this.text = text;
  //   this.author = author;
  // }
}

// class Quote is called like this

//Quote myquote = Quote(Text:'Be yourself; everyone else is already taken' , Author:  'Oscar Wilde');
// these are named parameter