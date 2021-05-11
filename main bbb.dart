abstract class Describable {
  void describe();

  void describeWithEmphasis() {
    print('=========');
    describe();
    print('=========');
  }
}

class Unit extends Describable {
  @override
  void describe(){
    print('unit');
  }
}

class Animal implements Describable{
  @override
  void describe() {
    print('describe');
  }

  @override
  void describeWithEmphasis() {
    print('describewithemphasis');
  }

}

void main(){
  Animal animal = Animal();
  animal.describe();
  animal.describeWithEmphasis();
}