import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hostingwebsite/models/bannermodel.dart';
import 'package:hostingwebsite/models/hostingmodel.dart';

class FirebaseService{



  Future<List<HostingModel>>getvps(){

    return FirebaseFirestore.instance.collection('VpsHosting').get().then((value) {

      List<HostingModel> vpshosting = [];

      for(DocumentSnapshot snapshot in  value.docs){
        vpshosting.add(HostingModel.fromSnapshot(snapshot));
      }
      return vpshosting;



    });
  }

  Future<List<HostingModel>> getSharedHosting(){
 return FirebaseFirestore.instance.collection('SharedHosting').get().then((value){

   List<HostingModel> sharedHostings = [];
   for(DocumentSnapshot snapshot in value.docs){
     sharedHostings.add(HostingModel.fromSnapshot(snapshot));
   }
   return sharedHostings;
 })   ;
  }
  Future<List<BannerModel>> getSharedBanner(){
    return FirebaseFirestore.instance.collection('SharedHostingBanners').get().then((value){

      List<BannerModel> sharedBanners= [];
      for(DocumentSnapshot snapshot in value.docs){
        sharedBanners.add(BannerModel.fromSnapshot(snapshot));
      }
      return sharedBanners;
    });
  }


}