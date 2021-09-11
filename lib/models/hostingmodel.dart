import 'package:cloud_firestore/cloud_firestore.dart';

class HostingModel{

  static const NAME = 'name';

  static const Features = 'Features';
  static const Price = 'Price';


  String _name;

  List _features;

  Map _price;


  get name => _name;
 get features => _features;
 get price => _price;

  HostingModel.fromSnapshot(DocumentSnapshot snapshot){

    _name = snapshot.data()[NAME];

 _features = snapshot.data()[Features];
 _price = snapshot.data()[Price];


  }


}