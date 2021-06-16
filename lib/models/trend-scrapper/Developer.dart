import 'Repository.dart';

class Developer {
  final String userName;
  final String accName;
  final String accUrl;
  final String avatorUrl;
  final Repository repository;

  Developer(
      {this.userName,
      this.accName,
      this.accUrl,
      this.avatorUrl,
      this.repository});
}
