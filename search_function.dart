import 'package:flutter/material.dart';

List<Map<String, dynamic>> doctors = [
  {
    "id": "1",
    "name": "Dr Anand Pro",
    "type": "senio",
    "profession": "heart",
    "stars": "5"
  },
  {
    "id": "2",
    "name": "Dr Anu Gupta",
    "type": "senio",
    "profession": "love",
    "stars": "4"
  },
  {"id": "2", "name": "a", "type": "senio", "profession": "love", "stars": "4"},
  {"id": "2", "name": "b", "type": "senio", "profession": "love", "stars": "4"},
  {"id": "2", "name": "c", "type": "senio", "profession": "love", "stars": "4"},
  {"id": "2", "name": "X", "type": "senio", "profession": "love", "stars": "4"},
  {"id": "2", "name": "Y", "type": "senio", "profession": "love", "stars": "4"},
  {"id": "2", "name": "Z", "type": "senio", "profession": "love", "stars": "4"},
  {
    "id": "2",
    "name": "small",
    "type": "senio",
    "profession": "love",
    "stars": "4"
  },
];

class Search_fun_exp extends StatefulWidget {
  const Search_fun_exp({Key? key}) : super(key: key);

  @override
  State<Search_fun_exp> createState() => _Search_fun_expState();
}

class _Search_fun_expState extends State<Search_fun_exp> {
  List<Map<String, dynamic>> _found = [];
  void initState() {
    _found = doctors;
    super.initState();
  }

  void _runFilter(String enteredKey) {
    List<Map<String, dynamic>> results = [];
    if (enteredKey.isEmpty) {
      results = doctors;
    } else {
      results = doctors
          .where((user) =>
              user['name'].toLowerCase().contains(enteredKey.toLowerCase()))
          .toList();
    }
    setState(() {
      _found = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              child: TextField(
                onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(labelText: "Sesarch"),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: _found.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Card(
                          color: Colors.lightBlue,
                          key: ValueKey(_found[index]["id"].toString()),
                          elevation: 4,
                          margin: EdgeInsets.symmetric(horizontal: 15),
                          child: ListTile(
                            leading: Text(
                              _found[index]['id'].toString(),
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                            title: Text("${_found[index]['name']}"),
                            subtitle: Text(_found[index]['profession']),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
    ));
  }
}
