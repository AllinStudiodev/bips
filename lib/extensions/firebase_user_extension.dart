part of 'extensions.dart';

extension FirebaseUserextension on FirebaseUser {
  User convertToUser({
    String name = "No Name",
    String site = "MCM",
  }) =>
      User(this.uid, this.email, name: name, site: site);

  Future<User> fromFireStore() async => await UserServices.getUser(this.uid);
}
