import 'package:flutter/material.dart';
import 'package:hostingwebsite/providers/appProvider.dart';
import 'package:provider/provider.dart';

import 'package:hostingwebsite/widgets/hostingWidget.dart';
class VpsHosting extends StatefulWidget {
  const VpsHosting({Key key}) : super(key: key);

  @override
  _VpsHostingState createState() => _VpsHostingState();
}

class _VpsHostingState extends State<VpsHosting> {
  @override
  Widget build(BuildContext context) {

    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: Container(
        height: 500,
        child: ListView.separated(
          separatorBuilder: (context,index)=>SizedBox(height: 20,),
            itemCount: appProvider.vpsHosting.length,
            itemBuilder: (context,index){
              return HostingWidget(
                hostingModel: appProvider.vpsHosting[index],
              );
            }),
      ),
    );
  }
}
