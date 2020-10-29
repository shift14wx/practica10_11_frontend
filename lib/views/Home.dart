import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var menuItems =[
    {
      "title":"pets",
      "icon":Icons.android,
      "url" : "/pets"
    },
    {
      "title":"owners",
      "icon":Icons.person,
      "url": "/owners"
    },
    {
      "title":"species",
      "icon":Icons.date_range,
      "url": "/species"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("veterinaria practica 10"),
      ),
      body: CustomScrollView(
        shrinkWrap: true,
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network('https://gestiondeclinicasveterinarias.com/wp-content/uploads/2019/11/vet-3895477_640.jpg',fit: BoxFit.cover,),
              title: Text("Veterinaria",style: TextStyle(color: Colors.black),),
            ),
          ),
         SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10
            ),
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index){
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, menuItems[index]["url"]);
                      },
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              color: Colors.blue,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(0, 3), // changes position of shadow
                                ),
                              ]
                            ),
                            child: Center(
                              child: Text(menuItems[index]["title"] ,style: TextStyle(color: Colors.white),),
                            ),
                          ),
                          // Positioned(
                          //   top: 0,
                          //   child: Icon(Icons.build),
                          // ),
                        ],
                      )
                    ),
                  );
                },
              childCount:3

            )
          )
        ],
      ),
    );
  }
}
