part of 'models.dart';

class User extends Equatable {
  final String id;
  final String email;
  final String name;
  final String lokasi;

  User(this.id, this.email, {this.name, this.lokasi});

  @override
  String toString() {
    return "[$id] - $name, $email, $lokasi";
  }

  @override
  List<Object> get props => [id, email, name, lokasi];
}
