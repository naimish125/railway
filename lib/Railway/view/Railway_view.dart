import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Railway_provider.dart';

class RailwayScreen extends StatefulWidget {
  const RailwayScreen({Key? key}) : super(key: key);

  @override
  State<RailwayScreen> createState() => _RailwayScreenState();
}

class _RailwayScreenState extends State<RailwayScreen> {
  RailwayProvider? RailwayProviderTrue;
  RailwayProvider? RailwayProviderFalse;

  @override
  void initState() {
    super.initState();
    Provider.of<RailwayProvider>(context, listen: false).callApi();
  }

  @override
  Widget build(BuildContext context) {
    RailwayProviderTrue = Provider.of<RailwayProvider>(context, listen: true);
    RailwayProviderFalse = Provider.of<RailwayProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Railway"),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        backgroundColor: Colors.black,
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 100,
                width: double.infinity,
                color: Colors.white,
                child: Text(
                  "${RailwayProviderTrue!.dataList[0].train_num}",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            );
          },
          itemCount: 2,
        ),
      ),
    );
  }
}
