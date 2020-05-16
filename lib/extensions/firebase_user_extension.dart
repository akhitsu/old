part of 'extensions.dart';

extension FirebaseUserExtension on FirebaseUser {
  User convertToUser({String name = "No Name", String lokasi = "Medan"}) =>
      User(this.uid, this.email, name: name, lokasi: lokasi);

  Future<User> fromFireStore() async => UserServices.getUser(this.uid);
}
