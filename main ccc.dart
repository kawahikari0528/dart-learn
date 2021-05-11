class Spacecraft {
  String name;
  DateTime? launchDate;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name, this.launchDate) {
    // Initialization code goes here.
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  int? get launchYear => launchDate?.year; // read-only non-final property

  // Method.
  void describe() {
    print('Spacecraft: $name');
    var launchDate = this.launchDate; // Type promotion doesn't work on getters.
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}
var oneSecond = Duration(seconds : 1);
Stream<String> report(Spacecraft craft, Iterable<String> objects) async* {
  for (var object in objects) {
    await Future.delayed(oneSecond);
    yield '${craft.name} flies by $object';
  }
}
void main() async
{
  Spacecraft spacecraft = Spacecraft('spacecraft',DateTime.now());
  Stream<String>result = report(spacecraft, ['ABC','DEF','EFG']);
  await for(String s in result){
    print(s);
  }
  result.listen((s) { 
    print(s);
  });
  print('코드 종료');
}