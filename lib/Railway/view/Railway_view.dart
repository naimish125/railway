import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Railway_provider.dart';


class RailwayScreen extends StatefulWidget {
  const RailwayScreen({Key? key}) : super(key: key);

  @override
  State<RailwayScreen> createState() => _RailwayScreenState();
}

class _RailwayScreenState extends State<RailwayScreen> {
  RailwayProvider? RailwayProviderT;
  RailwayProvider? RailwayProviderF;

  @override
  void initState() {
    super.initState();
    Provider.of<RailwayProvider>(context, listen: false).getRailway();
  }

  @override
  Widget build(BuildContext context) {
    RailwayProviderT = Provider.of<RailwayProvider>(context, listen: true);
    RailwayProviderF = Provider.of<RailwayProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white54,
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            "Search Train",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: FutureBuilder(
          future: RailwayProviderF!.getRailway(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else if (snapshot.hasData) {
              List? l1 = snapshot.data;

              return ListView.builder(
                itemCount: l1!.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                     width: double.infinity,
                      decoration: BoxDecoration(color:Colors.white54,borderRadius: BorderRadius.circular(20),border: Border.all(color: Colors.black)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("${l1[index].name}",style:TextStyle(color: Colors.black),),
                           Text("${l1[index].data.days.sun}",style:TextStyle(color: Colors.black),),
                          Text("${l1[index].trainNum}",style:TextStyle(color: Colors.black),),
                           Text("${l1[index].data.classes[2]}",style:TextStyle(color: Colors.black),),
                        ],
                        ),
                      ),


                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator(
              backgroundColor: Colors.black,
            );
          },
        ),
      ),
    );
  }
}