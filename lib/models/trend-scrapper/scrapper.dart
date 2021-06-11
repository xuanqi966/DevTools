import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;

main() async {
  // Variable declarations
  List<String> repoNames = [];
  List<String> repoUrls = [];
  List<String> repoLangs = [];
  List<String> repoStars = [];
  List<String> repoForks = [];
  List<List<String>> repoContributorUrls = [];
  List<List<String>> repoContributorAvatorUrls = [];
  List<String> repoStarsTdy = [];
  List<String> repoDescriptions = [];

  final response = await http.get(Uri.parse('https://github.com/trending'));

  // Web logic begins
  if (response.statusCode == 200) {
    var document = parse(response.body);

    var elements = document.getElementsByClassName('Box-row');
    // eles.forEach((element) {
    //   if (element.attributes['class'] == 'd-inline-block') {
    //     contributorUrls.add(element.attributes['href']);
    //     avatarUrl.add(element.children[0].attributes['src']);
    //   }
    // });

    elements.forEach((element) {
      var nameElement =
          element.getElementsByClassName('h3 lh-condensed')[0].children[0];
      repoNames.add(getRepoName(nameElement));
      repoUrls.add(getRepoUrl(nameElement));
      var descriptionElement = element
          .getElementsByClassName('col-9 color-text-secondary my-1 pr-4');
      descriptionElement.length == 0
          ? print("No description")
          : print(descriptionElement[0].text.trim());

      var infoElement =
          element.getElementsByClassName('f6 color-text-secondary mt-2')[0];
    });

    // Testing on first element
    // var element = elements[0];
    // var infoElement =
    //     element.getElementsByClassName('f6 color-text-secondary mt-2')[0];
    // repoContributorUrls.add(getContributorUrls(infoElement));

    // print(repoNames);
    print(repoStarsTdy);
  } else {
    throw Exception();
  }
}

String getStarsTdy(Element element) {
  var starElement =
      element.getElementsByClassName('d-inline-block float-sm-right')[0];
  return starElement.text.trim();
}

List<String> getContributorAvatorUrls(Element element) {
  return element
      .getElementsByTagName('a')
      .where((e) => e.attributes['class'] == 'd-inline-block')
      .map((e) => e.children[0].attributes['src'])
      .toList();
}

List<String> getContributorUrls(Element element) {
  return element
      .getElementsByTagName('a')
      .where((e) => e.attributes['class'] == 'd-inline-block')
      .map((e) => e.attributes['href'])
      .toList();
}

String getRepoFork(Element element) {
  var elements =
      element.getElementsByClassName('Link--muted d-inline-block mr-3');
  return (elements.length == 0) ? 'N.A' : elements[1].text.trim();
}

String getRepoStar(Element element) {
  var elements =
      element.getElementsByClassName('Link--muted d-inline-block mr-3');
  return (elements.length == 0) ? 'N.A' : elements[0].text.trim();
}

String getRepoLang(Element element) {
  var langElement = element.getElementsByClassName('d-inline-block ml-0 mr-3');
  return (langElement.length == 0) ? 'N.A' : langElement[0].text.trim();
}

String getRepoUrl(Element element) {
  return element.attributes['href'];
}

String getRepoName(Element element) {
  return element.text
      .trim()
      .split(new RegExp(r'(?:\r?\n|\r)'))
      .where((s) => s.trim().length != 0)
      .join("")
      .replaceAll(" ", "")
      .replaceAll('/', ' / ');
}
