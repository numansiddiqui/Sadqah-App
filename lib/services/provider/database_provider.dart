import 'package:fluttbase/services/functions/databse_services.dart';
import 'package:fluttbase/services/model/campaign_model.dart';
import 'package:fluttbase/services/model/user_model.dart';
import 'package:flutter/material.dart';

class DatabaseProvider extends ChangeNotifier {
  final _db = DatabaseService();

  List<CampaignPost> _allCampaignPosts = [];
  List<CampaignPost> get allCampaignPosts => _allCampaignPosts;

  Future<UserProfile?> getUser(String uid) => _db.getUserFromFirebase(uid);

  Future<void> updateUserName(String name) => _db.updateUserName(name);

  Future<void> postCampaign(String description, date, amount, title, imageUrl) async {
    await _db.postCampaignInFirebase(description, date, amount, title, imageUrl);
  }

  
}
