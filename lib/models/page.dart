import 'package:flutter/material.dart';
import 'package:dars18project/models/mashinalar_list.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Assalomua extends StatefulWidget {
  final int index;
  Assalomua(this.index);
  
  @override
  _AssalomuaState createState() => _AssalomuaState();
}

class _AssalomuaState extends State<Assalomua> {
  
  var _book = Icons.bookmark_border;
  bool _kitob = false;
  @override
  Widget build(BuildContext context) {
    
  final String image = MashinaListi.hammaMashinalar[widget.index].mashinaKattaRasm.toString();
  final String title = MashinaListi.hammaMashinalar[widget.index].mashinaMalumot.toString();
  final String narxi = MashinaListi.hammaMashinalar[widget.index].mashinaNarxi.toString();
  final String nomi = MashinaListi.hammaMashinalar[widget.index].mashinaNomi.toString();

    return SafeArea(
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          floatingActionButton: Container(
            decoration: BoxDecoration(
                color: Colors.black,
              borderRadius: BorderRadius.circular(20.0)
            ),
            alignment: Alignment.center,
            width: 200.00,
            height: 50.0,
            child: TextButton(
              onPressed: () {
                setState(() {
                  showDialog(
                    barrierDismissible: false,
                      context: context,
                      builder: (context){
                        return AlertDialog(
                          title: Text("Haridingiz Uchun Raxmat"),
                          content: Text("Nomi: $nomi\nNarxi: $narxi"),
                          actions: [
                            Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 25.0),
                                  height: 230.0,
                                    width: 230.0,
                                    child: Image.asset("assets/images/" + "$image")),

                            Container(
                              margin: EdgeInsets.only(right: 25.0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  shadowColor: Colors.black,
                                  elevation: 0.8,
                                  primary: Colors.redAccent,
                                ),
                                  onPressed: (){
                                  setState(() {
                                    Navigator.pushReplacement(
                                      context, MaterialPageRoute(
                                      builder: (context) => MashinaListi(),),);
                                  });
                                  },
                                  child: Text("Close"),
                              ),
                            ),
                              ],
                            ),
                          ],
                        );
                      });
                });
              },
              child: Text("Harid Qilish",style: TextStyle(color: Colors.white, fontSize: 20.0),),
          ),
          ),
          body: CustomScrollView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              SliverAppBar(
                floating: false,
                pinned: true,
                stretch: true,
                snap: false,
                actions: [
                  Container(
                    width: 384.0,
                    color: Colors.black.withOpacity(0.5),
                      //margin: EdgeInsets.only(left: 250.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: (){
                                setState(() {
                                  if (_kitob) {
                                  _book = Icons.bookmark_border;
                                  _kitob = false;
                                  Fluttertoast.showToast(msg: "Not Save");
                                } else {
                                  _book = Icons.bookmark;
                                  _kitob = true;
                                  Fluttertoast.showToast(msg: "Save");
                                }
                                });
                              },
                              icon: Icon(
                                _book,
                                color: Colors.red,
                                ),),
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.shopping_cart))
                        ],
                      ),
                    ),
                ],
                iconTheme: IconThemeData(
                  color: Colors.redAccent,
                ),
                backgroundColor: Colors.white,
                expandedHeight: 350.0,
                flexibleSpace: FlexibleSpaceBar(
                  stretchModes: [
                    //StretchMode.blurBackground,
                    StretchMode.zoomBackground,
                  ],
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0)
                      ),
                      image: DecorationImage(
                        image:  AssetImage("assets/images/" + '$image'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Text(""),
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15.0, top: 15.0),
                          child: Text("$nomi",style: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold),),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 15.0, top: 15.0),
                          child: Text("$narxi",style: TextStyle(fontSize: 25.0, color: Colors.black, fontWeight: FontWeight.bold),textAlign: TextAlign.right,),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.all(10.0),
                      child: Text("$title", style: TextStyle(fontSize: 16.0, ),),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
    );
  }
}
