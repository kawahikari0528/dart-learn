class Spacecraft {
  String name1;
  DateTime? launchDate;

  // Constructor, with syntactic sugar for assignment to members.
  Spacecraft(this.name1, this.launchDate) {
    name1 = name1 + '님';
  }

  // Named constructor that forwards to the default one.
  Spacecraft.unlaunched(String name) : this(name, null);

  int? get launchYear {
     return launchDate?.year;
  } // read-only non-final property

  // Method.
  void describe() {
    print('Spacecraft: $name1');
    var launchDate = this.launchDate; // Type promotion doesn't work on getters.
    if (launchDate != null) {
      int years = DateTime.now().difference(launchDate).inDays ~/ 365;
      print('Launched: $launchYear ($years years ago)');
    } else {
      print('Unlaunched');
    }
  }
}

class Orbiter extends Spacecraft {
  double altitude;

  Orbiter(String name, DateTime launchDate, this.altitude)
      : super(name, launchDate);

  @override
  void describe() {
    print('---자식의 정보---');
    super.describe();
    print('altitude: $altitude');
  }
}

mixin Piloted {
  int astronauts = 1;

  void describeCrew() {
    print('Number of astronauts: $astronauts');
  }
}

abstract class MockSpaceship implements Spacecraft {
  @override
  DateTime? launchDate;

  @override
  String name;

  MockSpaceship(this.launchDate, this.name);


  @override
  void describe() {
    // TODO: implement describe
  }

  @override
  // TODO: implement launchYear
  int? get launchYear => null;
  // ···
}
void main(){
  
}