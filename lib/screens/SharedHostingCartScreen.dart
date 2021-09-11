import 'dart:html';

import 'package:checkbox_grouped/checkbox_grouped.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hostingwebsite/screens/payments.dart';
import 'package:hostingwebsite/widgets/highlighttick.dart';
import 'UIFake.dart' if (dart.library.html) 'dart:ui' as ui ;
import 'package:hostingwebsite/models/hostingmodel.dart';
class SharedHostingCartScreen extends StatefulWidget {
  final name;
  final HostingModel hostingModel;

  final  price;

  const SharedHostingCartScreen({Key key,this.name,this.hostingModel,this.price}) : super(key: key);

  @override
  _SharedHostingCartScreenState createState() => _SharedHostingCartScreenState();
}

class _SharedHostingCartScreenState extends State<SharedHostingCartScreen> {

  String domainname = '';
  String wordpressusername = '';
  String WordPressPassword= '';
  GroupController controller = GroupController();
  List price = [];
  String name = 'fe';
  bool tap = false;
  Map<int, bool> itemsSelectedValue = Map();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  @override
  Widget build(BuildContext context) {




    return Scaffold(


      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.only(top: 50),
          child: Padding(
            padding: EdgeInsets.only(left: 50),
            child: Column(
              children:[ Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                     Text(
                      'You are almose there! Complete your order',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                  SizedBox(height: 10,),

                  Text(
                    '1. Choose a Period',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),


            Container(
              height: 200,


              child:  ListView.builder(
                  itemCount: widget.price.length,
                  itemBuilder: (context, index) {
                    String key = widget.price.keys.elementAt(index);
                    bool isCurrentIndexSelected = itemsSelectedValue[index] == null
                        ? false
                        : itemsSelectedValue[index];

                    Container contianer;


                      contianer = new Container(
                        alignment: Alignment.center,
                        height: 100.0,
                        color: isCurrentIndexSelected?Colors.blue:Colors.white,
                        child: new Text('Duration'+ "$key"),


                      );

                      return GestureDetector(

                      onTap: () {

                        itemsSelectedValue[index] = !isCurrentIndexSelected;
                        setState(() {


                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: contianer,
                      ),
                    );
                  })
            )

               /*   StreamBuilder<QuerySnapshot>(
                      stream: FirebaseFirestore.instance.collection('SharedHosting').snapshots(),
                      builder: ((BuildContext context, AsyncSnapshot<QuerySnapshot> snapshots){

                        if(snapshots.data == null)return Center();
                        return Container(
                          child: ListView(
                            children: snapshots.data.docs.map((DocumentSnapshot document) {
                              Map<String,int> data = document.data()['Price'] as Map<String,int>;
                              return Card(child: Text(data['id'].toString()),);
                            }).toList(),

                            ),

                          );

                      })),*/,


              Container(
                height: 200,
                width: 200,
                child: HtmlElementView(viewType: 'rzp-html'),
              ),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Domain Name'
                    ),

                    onChanged: (value){

                      setState(() {
                        domainname = value;
                      });
                    },
                  ),

                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Username for wordpress'
                    ),
                    onChanged: (value){
                      setState(() {
                        wordpressusername = value;
                      });

                      }

                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Enter Password For Wordpress'
                    ),
                    onChanged: (value){
                      setState(() {
                        WordPressPassword = value;
                      });
                    },
                  ),
MaterialButton(
    child: Text('Place Order'),
    color: Colors.red,
    shape: RoundedRectangleBorder(
      borderRadius:BorderRadius.circular(20)

    ),
    minWidth: 600,
    onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>RazorPayWeb(name:'shubhkaran' ,price:100)));
    })

,



                ],
      ),
            ]),
          )
        ),
      ),

    );
  }
}


class MyCustomWidget extends StatefulWidget {
  final String title;
  final String subtitle;

  const MyCustomWidget({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return new Card(
      shape: selected
          ? new RoundedRectangleBorder(
          side: new BorderSide(color: Colors.blue, width: 2.0),
          borderRadius: BorderRadius.circular(4.0))
          : new RoundedRectangleBorder(
          side: new BorderSide(color: Colors.white, width: 2.0),
          borderRadius: BorderRadius.circular(4.0)),
      child: new Padding(
        padding: const EdgeInsets.all(4.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text(widget.title),
            new Text(widget.subtitle),
            new Checkbox(
                value: selected,
                onChanged: (value) {
                  setState(() {
                    selected = value;
                  });
                })
          ],
        ),
      ),
    );
  }
}
