import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:society/services/models/state_models.dart';

import '../../services/get_api.dart';
import '../../services/models/city_models.dart';

class AdminGetCityPage extends StatefulWidget {
  final String cityId;

  AdminGetCityPage({Key? key, required this.cityId}) : super(key: key);

  @override
  _AdminGetCityPageState createState() => _AdminGetCityPageState();
}

class _AdminGetCityPageState extends State<AdminGetCityPage> {
  late Future<List<GetCityModel>> GetCity;
  late int cityIdInt;

  @override
  void initState() {
    cityIdInt = int.parse(widget.cityId.toString());
    log(cityIdInt.toString());
    super.initState();
    GetCity = Esociety().fetchCity(id: cityIdInt);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select Your City"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: FutureBuilder<List<GetCityModel>>(
                // future: ApiServices().getStates(),
                future: GetCity,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        shrinkWrap: true,
                        physics: ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 12),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10),
                                  child: Text(
                                    snapshot.data![index].name.toString(),
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ),
                                Divider()
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
