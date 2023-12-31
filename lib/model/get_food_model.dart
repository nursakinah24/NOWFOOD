import 'package:cloud_firestore/cloud_firestore.dart';

class GetFood {
  String id, name, description, phoneNumber, address, ownerId, imageUrl, status;
  int price;

  GetFood({
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

  static GetFood fromSnap(DocumentSnapshot snap) {
    //final data = snap.data() as Map<String, dynamic>;
    var snapshot = snap.data() as Map<String, dynamic>;

    return GetFood(
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

  factory GetFood.fromMap(Map<String, dynamic> map) {
   // final data = snap.data() as Map<String, dynamic>;
    return GetFood(
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
