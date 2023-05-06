import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Railway_provider.dart';
import '../model/Railway_model.dart';


class RailwayScreen extends StatefulWidget {
  const RailwayScreen({Key? key}) : super(key: key);

  @override
  State<RailwayScreen> createState() => _RailwayScreenState();
}

class _RailwayScreenState extends State<RailwayScreen> {
  RailwayProvider? RailwayProviderTrue;
  RailwayProvider? RailwayProviderFalse;

  @override
  Widget build(BuildContext context) {
    RailwayProviderTrue = Provider.of<RailwayProvider>(context, listen: true);
    RailwayProviderFalse = Provider.of<RailwayProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Railway"),backgroundColor: Colors.black,centerTitle: true),
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white54,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        TextField(
                          controller: RailwayProviderTrue!.trainc,
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search,color: Colors.black),
                              suffixIconColor: Colors.black,
                            label: Text("Search Train",style: TextStyle(color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                width: 2,
                                color: Colors.black,
                              ),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                FutureBuilder(
                 future: RailwayProviderTrue?.Railway(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      RailwayModal Rmodel = RailwayModal();
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 478,
                            width: double.infinity,
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.black,
                      ),
                    );
                  },
                ),
              ],
            ),
            ),
        );
    }
}