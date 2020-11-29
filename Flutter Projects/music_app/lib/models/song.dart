class Song{
  String _name;
  String _Songname;
  String _url;
  String _audioURL;


  String get audioURL => _audioURL;

  set audioURL(String value) {
    _audioURL = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get Songname => _Songname;

  String get url => _url;

  set url(String value) {
    _url = value;
  }

  set Songname(String value) {
    _Songname = value;
  }

  @override
  String toString() {
    return 'Song{_name: $_name, _Songname: $_Songname, _url: $_url}';
  }
}