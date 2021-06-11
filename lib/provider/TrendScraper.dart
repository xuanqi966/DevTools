import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;

import '../models/trend-scrapper/Repository.dart';
import '../models/trend-scrapper/Contributor.dart';

class TrendScraper with ChangeNotifier {
  String _baseAddress = '';
  List<Repository> _trendyRepos = [];

  List<Repository> get getRepos {
    return _trendyRepos;
  }

  void setAddress(String address) {
    _baseAddress = address;
    loadRepos();
    notifyListeners();
  }

  void loadRepos() async {
    final response = await http.get(Uri.parse(_baseAddress));

    if (response.statusCode == 200) {
      var document = parse(response.body);
      var elements = document.getElementsByClassName('Box-row');

      elements.forEach((element) {
        var nameElement =
            element.getElementsByClassName('h3 lh-condensed')[0].children[0];
        var infoElement =
            element.getElementsByClassName('f6 color-text-secondary mt-2')[0];

        String title = getRepoName(nameElement);
        String url = getRepoUrl(nameElement);
        String langauge = getRepoLang(infoElement);
        String stars = getRepoStar(infoElement);
        String forks = getRepoFork(infoElement);
        String starsNow = getStarsTdy(infoElement);
        String descriptions = getRepoDescriptions(element);
        List<Contributor> contributos = getContributors(infoElement);

        Repository repo = Repository(
            title: title,
            url: url,
            language: langauge,
            stars: stars,
            forks: forks,
            starsNow: starsNow,
            descriptions: descriptions,
            contributors: contributos);

        _trendyRepos.add(repo);
      });
    }
  }

  // ======================== Helper functions ============================== //

  String getRepoDescriptions(Element element) {
    var descriptionElement =
        element.getElementsByClassName('col-9 color-text-secondary my-1 pr-4');
    return descriptionElement.length == 0
        ? ("No description")
        : (descriptionElement[0].text.trim());
  }

  String getStarsTdy(Element element) {
    var starElement =
        element.getElementsByClassName('d-inline-block float-sm-right')[0];
    return starElement.text.trim();
  }

  List<Contributor> getContributors(Element element) {
    return element
        .getElementsByTagName('a')
        .where((e) => e.attributes['class'] == 'd-inline-block')
        .map((e) {
      return Contributor(e.attributes['href'], e.children[0].attributes['src']);
    }).toList();
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
    var langElement =
        element.getElementsByClassName('d-inline-block ml-0 mr-3');
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

  // =================== Helper functions for testing ====================== //
  void printRepoTitle() {
    _trendyRepos.forEach((repo) {
      print(repo.title);
    });
  }

  void printRepoUrl() {
    _trendyRepos.forEach((repo) {
      print(repo.url);
    });
  }

  void printRepoLanguage() {
    _trendyRepos.forEach((repo) {
      print(repo.language);
    });
  }

  void printRepoStars() {
    print(_trendyRepos.length);
    _trendyRepos.forEach((repo) {
      print(repo.stars);
    });
  }

  void printRepoForks() {
    _trendyRepos.forEach((repo) {
      print(repo.forks);
    });
  }

  void printRepoDesc() {
    _trendyRepos.forEach((repo) {
      print(repo.descriptions);
    });
  }

  void printRepoStarsNow() {
    _trendyRepos.forEach((repo) {
      print(repo.starsNow);
    });
  }

  void printRepoContributors() {
    _trendyRepos.forEach((repo) {
      print(repo.contributors);
    });
  }
}
