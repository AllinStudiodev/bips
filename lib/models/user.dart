part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String profilePicture;
  final String site;

  User(this.id, this.email, {this.name, this.profilePicture, this.site});

  User copyWith({String name, String profilePicture, String site}) => User(
        this.id,
        this.email,
        name: name ?? this.name,
        profilePicture: profilePicture ?? this.profilePicture,
        site: site ?? this.site,
      );

  @override
  String toString() {
    return "[$id] = $name, $email";
  }

  @override
  List<Object> get props => [id, email, name, profilePicture, site];
}
