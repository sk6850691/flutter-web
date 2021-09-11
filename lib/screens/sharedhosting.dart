import 'package:flutter/material.dart';
import 'package:hostingwebsite/providers/appProvider.dart';
import 'package:hostingwebsite/screens/payments.dart';
import 'package:provider/provider.dart';

import 'package:hostingwebsite/screens/SharedHostingCartScreen.dart';
import 'package:hostingwebsite/widgets/BannnerWidget.dart';
import 'package:hostingwebsite/widgets/hostingWidget.dart';
class SharedHosting extends StatefulWidget {
  const SharedHosting({Key key}) : super(key: key);

  @override
  _SharedHostingState createState() => _SharedHostingState();
}

class _SharedHostingState extends State<SharedHosting> {
  @override
  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(

        child: Column(
          children:[

            Container(
              height: 200,


              child: Row(
                children: appProvider.sharedHostingBanners.map((e) => BannerWidget(bannerModel: e,)).toList(),
              ),
            ),



            Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.separated(
                physics: NeverScrollableScrollPhysics(),

                itemBuilder: (context,index){
              return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SharedHostingCartScreen()));
                  },
                  child: HostingWidget(hostingModel: appProvider.sharedHostings[index],));
            },
                separatorBuilder: (context,index)=>SizedBox(height: 10,),
                itemCount: appProvider.sharedHostings.length),
          ),
       ] ),
      ),
    );
  }
}
