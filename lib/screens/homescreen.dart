import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';
import 'package:hostingwebsite/providers/appProvider.dart';
import 'package:hostingwebsite/screens/SharedHostingCartScreen.dart';
import 'package:hostingwebsite/widgets/hostingWidget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import 'package:hostingwebsite/screens/dedicatedhosting.dart';
import 'package:hostingwebsite/screens/sharedhosting.dart';
import 'package:hostingwebsite/screens/vpshosting.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  SharedHosting sharedHosting ;

  showhomescreen(){

    sharedHosting = SharedHosting();


  }





  int _currentIndex = 0;
  PageController pageController;
  GlobalKey _stackKey = GlobalKey();
  GZXDropdownMenuController dropdownMenuController = GZXDropdownMenuController();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  List<String> _dropDownHeaderItemStrings = ['全城', '品牌', '距离近', '筛选'];
  onTap({index}){

    setState(() {
      pageController.animateToPage(index, duration: Duration(milliseconds: 10), curve: Curves.bounceOut);
    });

  }









  Widget build(BuildContext context) {
    final appProvider = Provider.of<AppProvider>(context);
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(



        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              ListTile(
                leading: Text('Serverkings'),




               title:
                 Container(
                   width: 500,
                   child: Row(
                     children: [

                     Text('Domains',style: GoogleFonts.montserrat(fontSize: 20),),
                     SizedBox(width: 10,),
                     Text('Hosting',style: GoogleFonts.montserrat(fontSize: 20),),
                     SizedBox(
                       width: 10,
                     ),
                     Text('Security',style: GoogleFonts.montserrat(fontSize: 20),)
                   ],),
                 ),

                  trailing:Container(
                    width: 300,
                    child: Row(

                      children: [

                        PopupMenuButton(
                            color: Colors.blue,
                            child: Text('SignIn',style: GoogleFonts.montserrat(fontSize: 20),),
                            itemBuilder: (context){
                              return List.generate(appProvider.sharedHostings.length, (index)  {
                                return PopupMenuItem(child: HostingWidget(hostingModel: appProvider.sharedHostings[index],));

                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        PopupMenuButton(
                            color: Colors.blue,
                            child: Text('Help',style: GoogleFonts.montserrat(fontSize: 20),),
                            itemBuilder: (context){
                              return List.generate(appProvider.sharedHostings.length, (index)  {
                                return PopupMenuItem(child: HostingWidget(hostingModel: appProvider.sharedHostings[index],));

                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        PopupMenuButton(
                            color: Colors.blue,
                            child: Text('About',style: GoogleFonts.montserrat(fontSize: 20),),
                            itemBuilder: (context){
                              return List.generate(appProvider.sharedHostings.length, (index)  {
                                return PopupMenuItem(child: HostingWidget(hostingModel: appProvider.sharedHostings[index],));

                              });
                            }),
                      ],
                    ),
                  )

                  ,

              ),



              Padding(
                padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                child:
             Container(
               



               child: SizedBox(
                 height: screenSize.height * 0.60,
                 width: screenSize.width,
                 child: ClipRRect(
                     borderRadius: BorderRadius.circular(10),
                     child: Image.network('https://cdn.mos.cms.futurecdn.net/NQ4xeRKDaREYqtUg9n8xGc-1200-80.jpg',fit: BoxFit.cover)),
               ),
             )),

              Container(
                padding: EdgeInsets.only(
                  top: screenSize.height / 20,
                  bottom: screenSize.height / 20,
                ),
                width: screenSize.width,
                // color: Colors.black,
                child: Text(
                  'Choose Your Hosting Plan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontFamily: 'Montserrat',
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),


              Padding(
                padding: EdgeInsets.only(left: 80),
                child: Container(
                  height: 300,
                  width: screenSize.width,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context,index)=>SizedBox(height: 10,),
                      itemCount: appProvider.sharedHostings.length,
                      itemBuilder: (context,index){
                        return GestureDetector(
                          onTap: (){
                            
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>SharedHostingCartScreen(

                              name: appProvider.sharedHostings[index].name,
                              price: appProvider.sharedHostings[index].price,
                              hostingModel: appProvider.sharedHostings[index],
                            )));
                          },
                          child: Container(

                              child: HostingWidget(hostingModel: appProvider.sharedHostings[index],)),
                        );
                      }),
                ),
              )
              
            ],
          ),
        ));
  }}