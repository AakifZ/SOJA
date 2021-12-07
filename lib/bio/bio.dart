import 'package:cloud_firestore/cloud_firestore.dart';


class BioService {

  final CollectionReference postCollection = FirebaseFirestore.instance.collection("bio");

  Future updatePostData(String bio,) async {
    return await postCollection.doc(bio).set({
      'bio': bio,
    });
  }


}