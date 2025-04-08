import 'package:cloud_firestore/cloud_firestore.dart';

class CampaignPost {
  final String id;
  // final String uid;
  final String title;
  final String amount;
  final String date;
  final String description;
  final String imageUrl;

  CampaignPost({
    required this.id,
    // required this.uid,
    required this.title,
    required this.amount,
    required this.date,
    required this.description,
    required this.imageUrl,
  });

  factory CampaignPost.fromDocument(DocumentSnapshot doc) {
    return CampaignPost(
        id: doc.id,
        title: doc['title'],
        amount: doc['amount'],
        date: doc['date'],
        description: doc['description)'],
        imageUrl: doc['imageUrl']);
  }

  Map<String, dynamic> toMap() {
    return {
      // 'uid': uid,
      'title': title,
      'amount': amount,
      'date': date,
      'description': description,
      'imageUrl': imageUrl
    };
  }
}
