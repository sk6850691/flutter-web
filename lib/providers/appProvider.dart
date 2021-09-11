import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hostingwebsite/models/bannermodel.dart';
import 'package:hostingwebsite/models/hostingmodel.dart';
import 'package:hostingwebsite/services/firebaeservice.dart';
import 'package:shared_preferences/shared_preferences.dart';


enum Status{Uninitialised,Unauthenticated, Authenticated,Authenticating}
class AppProvider with ChangeNotifier {


  FirebaseService service = FirebaseService();
  User user;

  Status status = Status.Unauthenticated;


  FirebaseAuth auth = FirebaseAuth.instance;
  List<HostingModel > vpsHosting = [];
  List<HostingModel>    dedicatedHosting = [];
  List<HostingModel> sharedHostings = [];
  List<BannerModel> sharedHostingBanners = [];

  AppProvider.initialize(){

    getVps();
    getSharedHostings();
    getSharedBanners();


  }
  onAuthStateChanged(User user) {
    if (user == null) {
      status = Status.Unauthenticated;
      notifyListeners();
    } else {
      user = user;
      status = Status.Authenticated;
      notifyListeners();
    }
  }

  void signOut() {
    auth.signOut();
    status = Status.Unauthenticated;
  }


  void savedetails({value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('uid', value.toString());
  }

  Future<String> getDetails() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('uid');
  }


  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleSignInAuthentication = await googleUser
        .authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,

    );

    // ignore: missing_return
    return await auth.signInWithCredential(credential).then((value) {
      savedetails(value: value.user.uid);
      FirebaseFirestore.instance.collection('users').doc(value.user.uid).set({
        "id": value.user.uid,
        "name": value.user.displayName,
        "email": value.user.email
      });
    });
  }


  getVps()async{

    vpsHosting = await service.getvps();
    notifyListeners();

  }

  getSharedHostings()async{
    sharedHostings = await service.getSharedHosting();
    notifyListeners();
  }

  getDedicated(){}


getSharedBanners()async{

  sharedHostingBanners =await service.getSharedBanner();
  notifyListeners();
}

}
