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

  String spoken = 'spoken_language_code=en';
  String lang = 'c++';
  String date = 'weekly';
  String url = getFilterUrl(spoken, lang, date);
  // print(url);

  final response = await http
      .get(Uri.parse('https://github.com/trending?spoken_language_code=de'));

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

    // var elements = document.getElementsByClassName('select-menu-list');

    // Element spokenElement = elements[0];
    // Element languageElement = elements[1];
    // Element durationElement = elements[2];

    // List<Element> spokenLanguages =
    //     spokenElement.getElementsByClassName('select-menu-item');
    // List<Element> languages =
    //     languageElement.getElementsByClassName('select-menu-item');
    // List<Element> durations =
    //     durationElement.getElementsByClassName('select-menu-item');

    // spokenLanguages.forEach((element) {
    //   // print(element.text.trim());
    //   // print(getSpokenUrl(element.attributes['href']));
    // });
    // languages.forEach((element) {
    //   // print(element.text.trim());
    //   // print(getLangUrl(element.attributes['href']));
    // });
    // durations.forEach((element) {
    //   // print(element.text.trim());
    //   // print(getDateUrl(element.attributes['href']));
    // });
    // print('Spoken languages: ' + spokenLanguages.length.toString());
    // print('Languages: ' + languages.length.toString());
    // print('Durations: ' + durations.length.toString());

    elements.forEach((element) {
      // var nameElement =
      //     element.getElementsByClassName('h3 lh-condensed')[0].children[0];
      // repoNames.add(getRepoName(nameElement));
      // repoUrls.add(getRepoUrl(nameElement));
      // var descriptionElement = element
      //     .getElementsByClassName('col-9 color-text-secondary my-1 pr-4');
      // descriptionElement.length == 0
      //     ? print("No description")
      //     : print(descriptionElement[0].text.trim());

      var infoElement =
          element.getElementsByClassName('f6 color-text-secondary mt-2')[0];

      var emptyList = [];
      emptyList.forEach((element) {
        print(element.toString());
      });
    });

    // Testing on first element
    // var element = elements[0];
    // var infoElement =
    //     element.getElementsByClassName('f6 color-text-secondary mt-2')[0];
    // repoContributorUrls.add(getContributorUrls(infoElement));

  } else {
    throw Exception();
  }
}

// Helper functions for getting url parts =====================================
String getSpokenUrl(String url) {
  return url.split('?')[1];
}

String getLangUrl(String url) {
  return url.split('/')[2].split('?')[0];
}

String getDateUrl(String url) {
  return url.split('?')[1];
}

String getFilterUrl(String spoken, String lang, String date) {
  const baseAddress = 'https://github.com/trending';
  if (lang == 'Any') {
    if (date == 'Any') {
      if (spoken == 'Any') {
        return baseAddress;
      } else {
        return baseAddress + '?' + spoken;
      }
    } else {
      if (spoken == 'Any') {
        return baseAddress + '?' + date;
      } else {
        return baseAddress + '?' + date + '&' + spoken;
      }
    }
  } else {
    if (spoken == 'Any') {
      return baseAddress +
          '/' +
          lang +
          '?' +
          (date == 'Any' ? 'since=daily' : date);
    } else {
      return baseAddress +
          '/' +
          lang +
          '?' +
          (date == 'Any' ? 'since=daily' : date) +
          '&' +
          spoken;
    }
  }
}

// ===========================================================================

String getRepoLang(Element element) {
  // var langElement = element.getElementsByClassName('d-inline-block ml-0 mr-3');
  // return (langElement.length == 0) ? 'N.A' : langElement[0].text.trim();
  var langElement = element.getElementsByTagName('span').firstWhere(
      (element) => element.attributes['itemprop'] == "programmingLanguage",
      orElse: () => null);
  return langElement == null ? 'N.A' : langElement.text.trim();
}

String getRepoStar(Element element) {
  var elements = element.getElementsByClassName('octicon octicon-star');
  return (elements.length == 0) ? 'N.A' : elements[0].parent.text.trim();
}

String getRepoFork(Element element) {
  var elements = element.getElementsByClassName('octicon octicon-repo-forked');
  return (elements.length == 0) ? 'N.A' : elements[0].parent.text.trim();
}

List<Element> getContributors(Element element) {
  var contributorBlock = element
      .getElementsByClassName('d-inline-block mr-3')
      .firstWhere((element) => element.text.trim() == 'Built by',
          orElse: () => null);
  return (contributorBlock == null ? [] : contributorBlock.children);
}

String getStarsTdy(Element element) {
  var elements = element.getElementsByClassName('octicon octicon-star');
  return (elements.length < 2) ? 'N.A' : elements[1].parent.text.trim();
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
