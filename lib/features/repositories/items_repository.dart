import 'package:cantwait28/features/model/items_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemsRepository {
  Stream<List<ItemModel>> getStream() {
    return FirebaseFirestore.instance
        .collection('items')
        .orderBy('release_date')
        .snapshots()
        .map((querySnapshot) {
      return querySnapshot.docs.map((doc) {
        return ItemModel(
            id: doc.id,
            title: doc['title'],
            imageURL: doc['image_url'],
            releaseDate: (doc['release_date'] as Timestamp).toDate());
      }).toList();
    });
  }

  Future<void> add(
      {required String title,
      required String imageURL,
      required DateTime releaseDate}) {
    return FirebaseFirestore.instance.collection('items').add(
      {
        'title': title,
        'image_url': imageURL,
        'release_date': releaseDate,
      },
    );
  }

  Future<ItemModel> get({required String id}) async {
    final doc =
        await FirebaseFirestore.instance.collection('items').doc(id).get();
    return ItemModel(
      id: doc.id,
      title: doc['title'],
      imageURL: doc['image_url'],
      releaseDate: (doc['release_date'] as Timestamp).toDate(),
    );
  }

  Future<void> delete({required String id}) {
    return FirebaseFirestore.instance.collection('items').doc(id).delete();
  }
}
