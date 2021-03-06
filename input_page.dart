

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'SahaltWidget.dart';
import 'IconContent.dart';
import 'Routemap.dart';
const activecolour=Color(0XFF1D1E33);
const inactivecolour=Color(0XFF111328);
enum Bottom {
  EBOOKS,
  NEARSTATION,
  LOCKER,
  MULTIPLEROUTE,
  FAVIROTE,
  MAP,
}
class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();

  String text(String s) {}
}

class _InputPageState extends State<InputPage> {
  Bottom selectedBottom;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        centerTitle:true,
          title: Text('SAHALT'),
          actions: <Widget>[
      // action button
      IconButton(
        icon : Icon(Icons.search,
        ),
        onPressed: (){
          var model;
          model.isSearching=true;
          model.refresh();
      },


    ),
            IconButton(
              icon: Icon(Icons.list,


              ),

              onPressed: (){
              },

            ),
],
      ),
      body:Column(
        children: <Widget>[
          Expanded(child:Row(
            children: <Widget>[

              Expanded(
                child:SahaltWidget(
                  onPress:(){
                    setState(() {
                      selectedBottom=Bottom.EBOOKS;
                    });
                  },
                  colour: selectedBottom==Bottom.EBOOKS?activecolour:inactivecolour,
                  cChild: IconContent(icon:Icons.book,
                  label: 'EBOOKS',
                  ),


                ),
          ),
              Expanded(
          child:SahaltWidget(
            onPress: (){
              setState(() {
                selectedBottom=Bottom.NEARSTATION;
              });
            },
            colour:selectedBottom==Bottom.NEARSTATION?activecolour:inactivecolour,
            cChild: IconContent(icon:Icons.location_on,
              label: 'NEAR STATION',
              ),
          ),
              ),
            ],
          ),

          ),
          Expanded(child:Row(
    children: <Widget>[
    Expanded(
      child:SahaltWidget(
        onPress: (){
          setState(() {
            selectedBottom=Bottom.LOCKER;
          });
        },

      colour: selectedBottom==Bottom.LOCKER?activecolour:inactivecolour,
      cChild:IconContent(icon:Icons.lock_outline,
      label: 'LOCKER',
      ),
      ),
    ),
    Expanded(
      child:GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Routemap()
          ));
          setState(() {
            selectedBottom=Bottom.MULTIPLEROUTE;
          });
        },
        child: SahaltWidget(

            colour: selectedBottom==Bottom.MULTIPLEROUTE?activecolour:inactivecolour,
        cChild: IconContent(icon:Icons.drive_eta,label: 'MULTIPLE ROUTE'
          ,)
    ),
      ),
    ),
    ],
    ),
          ),


          Expanded(child:Row(
            children: <Widget>[

              Expanded(
                child:SahaltWidget(
                  onPress: (){
                    setState(() {
                      selectedBottom=Bottom.FAVIROTE;

                    });
                  },
                  colour: selectedBottom==Bottom.FAVIROTE?activecolour:inactivecolour,
                    cChild: IconContent(icon: Icons.favorite,label: 'FAVIROTE',
                    ),
                ),
              ),
              Expanded(
    child:SahaltWidget(
      onPress: (){
        setState(() {
          selectedBottom=Bottom.MAP;
        });
      },
        colour:selectedBottom==Bottom.MAP?activecolour:inactivecolour,
                cChild: IconContent(icon: Icons.map,label: 'MAP',
    )
    ),
    ),
    ],
    ),
    ),
    ],
    ),
    );
  }
}



