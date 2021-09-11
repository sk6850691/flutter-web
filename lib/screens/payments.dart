import 'dart:html';
import 'dart:ui' as ui;
//conditional import
import 'UIFake.dart' if (dart.library.html) 'dart:ui' as ui;
import 'package:flutter/material.dart';

class RazorPayWeb extends StatelessWidget {

 final String name;
 final int price;

  const RazorPayWeb({Key key, this.name, this.price}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //register view factory
    ui.platformViewRegistry.registerViewFactory("rzp-html",(int viewId) {
      IFrameElement element=IFrameElement();
//Event Listener
      window.onMessage.forEach((element) {
        print('Event Received in callback: ${element.data}');
        if(element.data=='MODAL_CLOSED'){
          Navigator.pop(context);
        }else if(element.data=='SUCCESS'){
          print('PAYMENT SUCCESSFULL!!!!!!!');
        }
      });

      element.requestFullscreen();
      element.src='assets/payment.html?name=$name&price=$price';
      element.style.border = 'none';
      return element;
    });
    return Scaffold(
        body: Builder(builder: (BuildContext context) {
          return Container(
            child: HtmlElementView(viewType: 'rzp-html'),
          );
        }));
  }

}