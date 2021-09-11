import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
class Domain extends StatefulWidget {
  const Domain({Key key}) : super(key: key);

  @override
  _DomainState createState() => _DomainState();
}

class _DomainState extends State<Domain> {

  var params = {
    'mashape-key': 'b6efda66aemsh297601ef6ef965cp12cd6ajsn9c577c04aa38',
    'query': 'google',
    'defaults': 'club,coffee',
    'registrar': 'dnsimple.com',
    'location': 'de'


  };

  getDomain()async{
    Response response = await Dio().get('https://domainr.p.rapidapi.com/v2/search',
        queryParameters:params ,

    options: Options(
      headers: {
        'x-rapidapi-host': 'domainr.p.rapidapi.com',
        'x-rapidapi-key': 'b6efda66aemsh297601ef6ef965cp12cd6ajsn9c577c04aa38'
      }
    )
    );
    print(response);





  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(

          color: Colors.blue,
          onPressed: (){
            getDomain();
          },
        ),
      ),
    );
  }
}
