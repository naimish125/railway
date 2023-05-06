import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Railway_provider.dart';
import '../model/Railway_model.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeProvider? homeProviderTrue;
  HomeProvider? homeProviderFalse;

  @override
  Widget build(BuildContext context) {
    homeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    homeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text("Railway"),backgroundColor: Colors.black),
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white54,
                ),
                Container(
                  height: 60,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
                FutureBuilder(
                  future: homeProviderTrue!.coronaApiGet(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("${snapshot.error}"),
                      );
                    } else if (snapshot.hasData) {
                      HomeModal homeModal = HomeModal();
                      return Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            height: 478,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Text(
                                  "Train Data",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Container(
                                  height: 52,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.white70,
                                      width: 3,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: TextField(
                                      controller: homeProviderTrue!.trainc,
                                      cursorColor: Colors.white70,
                                      style: TextStyle(
                                        color: Colors.white70,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      decoration: InputDecoration(
                                        suffixIcon: Icon(Icons.search),
                                        suffixIconColor: Colors.white70,
                                        hintText: "search train !",
                                        hintStyle: TextStyle(
                                          color: Colors.white70,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        border: InputBorder.none,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
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