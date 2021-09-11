import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hostingwebsite/models/hostingmodel.dart';
class HostingWidget extends StatefulWidget {
  final HostingModel hostingModel;
  const HostingWidget({Key key,this.hostingModel}) : super(key: key);

  @override
  _HostingWidgetState createState() => _HostingWidgetState();
}

class _HostingWidgetState extends State<HostingWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 300,

      child: Card(
        child: Column(

          children: [
            Text(widget.hostingModel.name,style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 20),),
            Text(widget.hostingModel.price.toString(),style: GoogleFonts.montserrat(fontWeight: FontWeight.bold,fontSize: 20)),
        Container(
            height: 200,
            width: 200,
            child: Column(
              children: widget.hostingModel.features.map<Widget>((e) => Text(e,style: GoogleFonts.montserrat(fontSize: 15,fontWeight: FontWeight.w500),)).toList(),
            ),




        ),
            MaterialButton(


              onPressed: (){},
              color: Colors.red,

              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
              ),
              minWidth: 100,
              child: Text('Add To Cart'),
            )
          ],
        ),
      ),
    );
  }
}
