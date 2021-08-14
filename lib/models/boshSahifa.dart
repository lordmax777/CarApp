import 'package:dars18project/models/mashinalar_list.dart';
import 'package:dars18project/models/page.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      // home: MashinaListi(),
      routes: {
        "/": (context) => MashinaListi(),
        "/mashinaListi": (context) => MashinaListi(),
        //"/carInfo/1": (context) => MashinaInfo(),
      },

      initialRoute: "/mashinaListi",

      onGenerateRoute: (stngs) {
        List<String> pathElementlari = stngs.name.toString().split("/");
        if (pathElementlari[1] == "carInfo") {
          return MaterialPageRoute(
            settings: RouteSettings(name: stngs.name),
            builder: (context) {
              return Assalomua(int.parse(pathElementlari[2]));
            },
          );
        }
      },
    );
  }
}