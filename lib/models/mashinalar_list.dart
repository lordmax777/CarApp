import 'package:dars18project/models/mashina.dart';
import 'package:dars18project/models/strings.dart';
import 'package:flutter/material.dart';

class MashinaListi extends StatelessWidget {
  static List<Mashina> hammaMashinalar = [];
  @override
  Widget build(BuildContext context) {
    hammaMashinalar = malumotOlibKel();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Arendaga Mashinalar",style: TextStyle(color: Colors.white),),
        titleSpacing: 80.0,
      ),
      body: listTayyorla(),
    );
  }

  List<Mashina> malumotOlibKel(){
    List<Mashina> mashinalar = [];
    for(int i = 0; i < 10; i++){
      String kichikRasm = Strings.MASHINA_NOMLARI[i].toLowerCase() + "${i}.jpg";
      String kattaRasm = Strings.MASHINA_NOMLARI[i].toLowerCase() + "_katta" + "${i}.jpg";

      Mashina qoshiladiganMashina = Mashina(
        Strings.MASHINA_NOMLARI[i],
        Strings.MASHINA_YILI[i],
        Strings.MASHINA_MALUMOTLARI[i],
        Strings.MASHINA_NARXLARI[i],
        "$i.jpg",
        "$i.jpg",);
      mashinalar.add(qoshiladiganMashina);
    }
    return mashinalar;
  }

  listTayyorla(){
    return ListView.builder(
        itemBuilder: (ctx, index){  
          return GestureDetector(
            child: Container(
              margin: EdgeInsets.only(top: 20.0,left: 10.0, right: 10.0),
              height: 150.0,
              alignment: Alignment.bottomLeft  ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                image: DecorationImage(
                  image: AssetImage("assets/images/" + '${hammaMashinalar[index].mashinaKattaRasm}'),
                fit: BoxFit.cover,
                ),
              ),
             child: Container(
               margin: EdgeInsets.only(left: 15.0, right: 20.0),
               child: Row(
                 children: [
                   Container(
                     margin: EdgeInsets.only(top: 150.0),
                     child: CircleAvatar(
                       radius: 20.0,
                       backgroundImage: AssetImage("assets/logotip/" + '${hammaMashinalar[index].mashinaKichikRasm}'),
                     ),
                   ),
                   Container(
                     margin: EdgeInsets.only(top: 160.0,left: 15.0),
                     child: Column(
                       children: [
                         Text("${Strings.MASHINA_NOMLARI[index]}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Colors.white),),
                         Text("${Strings.MASHINA_YILI[index]}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0,color: Colors.white),),
                       ],
                     ),
                   ),
                 ],
               ),
             ),
            ),
            onTap: (){
              Navigator.pushNamed(ctx, "/carInfo/$index");
            },
          );
        },
        itemCount: 10,
        itemExtent: 240.0,
    );
  }

}
