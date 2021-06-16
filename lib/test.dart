import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;

main() async {
  final response =
      await http.get(Uri.parse('https://github.com/trending/developers'));
  print('connecting');

  // Web logic begins
  if (response.statusCode == 200) {
    var document = parse(response.body);
    print('connected');
    //   var headerElement = document.getElementsByClassName(
    //       'Box-header d-lg-flex flex-items-center flex-justify-between');
    //   var menuElements =
    //       headerElement[0].getElementsByClassName('select-menu-list');
    //   var languages = menuElements[0].getElementsByClassName('select-menu-item');
    //   var dateRanges = menuElements[1].getElementsByClassName('select-menu-item');
    //   dateRanges.forEach((element) {
    //     print(element.attributes['href'].split('?')[1]);
    //   });

    var boxElements = document.getElementsByClassName('Box-row d-flex');
    boxElements.forEach((element) {
      // var avatarElement =
      //     element.getElementsByClassName('rounded avatar-user')[0];
      // String avatorLink = avatarElement.attributes['src'];
      // print(avatorLink);
      var titleElement = element.getElementsByClassName('h3 lh-condensed')[0];
      // var nameElement =
      //     element.getElementsByClassName('f4 text-normal mb-1')[0];
      var link = titleElement.children[0].attributes['href'];
      // print(titleElement.text.trim());
      // print(nameElement.text.trim());
      print(link);

      // var repoTitleElement = element.getElementsByClassName('h4 lh-condensed');
      // var repoDescElement =
      //     element.getElementsByClassName('f6 color-text-secondary mt-1');
      // String desc =
      //     repoDescElement.length == 0 ? 'N.A' : repoDescElement[0].text.trim();
      // String link = repoTitleElement.length == 0
      //     ? 'N.A'
      //     : repoTitleElement[0].children[0].attributes['href'];
      // String title = repoTitleElement.length == 0
      //     ? 'N.A'
      //     : repoTitleElement[0].text.trim();
      // print(title);
      //   });
    });
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
