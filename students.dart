import 'dart:convert'; 

class Students {
  List<Map<String, String>> people;

  Students(this.people);

  
  void sort(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));
  }


  void output() {
    for (var person in people) {
      print(person);
    }
  }

  void plus(Map<String, String> person) {
    people.add(person);
  }


  void remove(String field) {
    people.removeWhere((person) => person['first'] == field);
  }
}

void main() {
  
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

 
  List<Map<String, dynamic>> dynamicList = List<Map<String, dynamic>>.from(jsonDecode(json));


  List<Map<String, String>> peopleList = dynamicList.map((e) => Map<String, String>.from(e)).toList();


  Students students = Students(peopleList);

 
  students.sort('first');
  print("After sorting by first name:");
  students.output();


  students.plus({"first": "Jane", "last": "Doe", "email": "jane.doe@example.com"});
  print("\nAfter adding Jane Doe:");
  students.output();

  students.remove('Adam');
  print("\nAfter removing Adam:");
  students.output();
}
