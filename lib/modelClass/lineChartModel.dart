class LineModel{
  var date;
  var count;

  LineModel({this.date,this.count});

  @override
  String toString() {
    return '{ ${this.date}, ${this.count} }';
  }
}