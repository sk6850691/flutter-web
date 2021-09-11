import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class MyCustomWidget extends StatefulWidget {
  final String title;
  final String subtitle;

  const MyCustomWidget({Key key, this.title, this.subtitle}) : super(key: key);

  @override
  _MyCustomWidgetState createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {

  savevalue(value)async{
    SharedPreferences prefernces = await SharedPreferences.getInstance();
        prefernces.setString('price', value);
  }

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
        child: GestureDetector(
          onTap: (){
            print(widget.title);
          },
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


                    }
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}