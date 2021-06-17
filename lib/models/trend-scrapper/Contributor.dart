class Contributor {
  final String repoUrl;
  final String avatorUrl;

  const Contributor(this.repoUrl, this.avatorUrl);

  @override
  String toString() {
    return "URL: " + repoUrl + " Avator: " + avatorUrl;
  }
}
