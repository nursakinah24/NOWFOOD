import 'package:cloud_firestore/cloud_firestore.dart';

class SaveFood {
  String id, name, description, phoneNumber, address, ownerId, imageUrl, status;
  int price;

  SaveFood({
    required this.id,
    required this.name,
    required this.description,
    required this.phoneNumber,
    required this.address,
    required this.ownerId,
    required this.imageUrl,
    required this.price,
    required this.status,
  });

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "phoneNumber": phoneNumber,
        "address": address,
        "ownerId": ownerId,
        "imageUrl": imageUrl,
        "price": price,
      };

  static SaveFood fromSnap(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;

    return SaveFood(
      id: snapshot['id'] ?? '',
      name: snapshot['name'] ?? '',
      description: snapshot['description'] ?? '',
      phoneNumber: snapshot['phoneNumber'] ?? '',
      address: snapshot['address'] ?? '',
      ownerId: snapshot['ownerId'] ?? '',
      imageUrl: snapshot['imageUrl'] ?? '',
      price: snapshot['price'] ?? '',
      status: snapshot['status'] ?? '',
    );
  }

  factory SaveFood.fromMap(Map<String, dynamic> map) {
    return SaveFood(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      description: map['description'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      address: map['address'] ?? '',
      ownerId: map['ownerId'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      price: map['price'] ?? '',
      status: map['status'] ?? '',
    );
  }
}
