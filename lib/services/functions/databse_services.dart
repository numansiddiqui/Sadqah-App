import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttbase/services/auth/auth_service.dart';
import 'package:fluttbase/services/model/campaign_model.dart';
import 'package:fluttbase/services/model/user_model.dart';

class DatabaseService {
  final _db = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;

  /* 
   User Profile 
  */

  Future<void> saveUserDataInFirebase(String name, email) async {
    String uid = _auth.currentUser!.uid;

    UserProfile newUser = UserProfile(
      uid: uid,
      name: name,
      email: email,
    );

    Map<String, dynamic> newUserMap = newUser.toMap();

    await _db.collection("User").doc(uid).set(newUserMap);
  }

  // Get user data from firebase
  Future<UserProfile?> getUserFromFirebase(String uid) async {
    try {
      DocumentSnapshot userDoc = await _db.collection("User").doc(uid).get();

      UserProfile user = UserProfile.fromDocument(userDoc);

      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  /*  
    Campaign Posts
  */
  Future<void> postCampaignInFirebase(
      String description, date, amount, title,imageUrl) async {
    try {
      CampaignPost newCampaignPost = CampaignPost(
          id: '',
          title: title,
          amount: amount,
          date: date,
          description: description,
          imageUrl: imageUrl,
          );

      Map<String, dynamic> newCampaignPostMap = newCampaignPost.toMap();

      await _db.collection("Campaigns").add(newCampaignPostMap);
    } catch (e) {
      print(e);
    }
  }

  // Update user data from firebase
  Future<void> updateUserName(String name) async {
    String uid = AuthService().getCurrentUserId();
    try {
      await _db.collection("User").doc(uid).update({"name": name});
    } on FirebaseAuthException catch (e) {
      throw Exception(e.code);
    }
  }
}
