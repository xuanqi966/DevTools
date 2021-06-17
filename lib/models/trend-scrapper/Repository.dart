import 'Contributor.dart';

class Repository {
  final String title;
  final String url;
  final String language;
  final String stars;
  final String forks;
  final String starsNow;
  final String descriptions;
  final List<Contributor> contributors;

  Repository(
      {this.title,
      this.url,
      this.language,
      this.stars,
      this.forks,
      this.descriptions,
      this.starsNow,
      this.contributors});
}
