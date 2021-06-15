import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;

import '../models/trend-scrapper/Repository.dart';
import '../models/trend-scrapper/Contributor.dart';

class TrendScraper with ChangeNotifier {
  // global constant declarations
  static final rootAddress = 'https://github.com/trending';
  static final trendingAddress = 'https://github.com/trending';

  // local variable declarations
  bool _isInit =
      true; // Tracks whether app is loading the website for the first time
  String _baseAddress = rootAddress;

  // Repositories are loaded everytime the page rebuilds
  List<Repository> _trendyRepos = [];

  // Maps containing filter information are ONLY loaded when page builds for the first time
  Map<String, String> _spokenMap = {'Any': ''};
  Map<String, String> _languageMap = {'Any': ''};
  Map<String, String> _dateMap = {};

  // Variables keeping track of the state of filter selections
  String _spoken = 'Any';
  String _language = 'Any';
  String _date = 'Today';

  // Helper function declarations
  List<Repository> get getRepos {
    return _trendyRepos;
  }

  Map<String, String> getSpokenMap() {
    return {..._spokenMap};
  }

  Map<String, String> getLanMap() {
    return {..._languageMap};
  }

  Map<String, String> getDateMap() {
    return {..._dateMap};
  }

  String getSpoken() {
    return _spoken;
  }

  String getLanguage() {
    return _language;
  }

  String getDate() {
    return _date;
  }

  void updateSpoken(String spoken) {
    _spoken = spoken;
  }

  void updateLanguage(String language) {
    _language = language;
  }

  void updateDate(String date) {
    _date = date;
  }

  // This function sets baseAddress and loads repositories
  Future<void> loadAddress() async {
    _baseAddress =
        (_isInit) ? rootAddress : getFilteredUrl(_spoken, _language, _date);
    await loadRepos();
    notifyListeners();
  }

  Future<void> loadRepos() async {
    _trendyRepos = [];

    final response = await http.get(Uri.parse(_baseAddress));

    if (response.statusCode == 200) {
      var document = parse(response.body);
      if (_isInit) {
        // Loading Maps of filter information ONLY at the initial round
        _isInit = false;
        loadFilterData(document);
      }

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
        List<Contributor> contributors = getContributors(infoElement);

        Repository repo = Repository(
            title: title,
            url: url,
            language: langauge,
            stars: stars,
            forks: forks,
            starsNow: starsNow,
            descriptions: descriptions,
            contributors: contributors);

        _trendyRepos.add(repo);
      });
    }
    notifyListeners();
  }

  Future<void> loadFilterData(Document document) {
    var elements = document.getElementsByClassName('select-menu-list');

    Element spokenElement = elements[0];
    Element languageElement = elements[1];
    Element durationElement = elements[2];

    List<Element> spokenLanguages =
        spokenElement.getElementsByClassName('select-menu-item');
    List<Element> languages =
        languageElement.getElementsByClassName('select-menu-item');
    List<Element> durations =
        durationElement.getElementsByClassName('select-menu-item');

    spokenLanguages.forEach((element) {
      String title = element.text.trim();
      String url = getSpokenUrl(element.attributes['href']);
      _spokenMap[title] = url;
    });
    languages.forEach((element) {
      String title = element.text.trim();
      String url = getLangUrl(element.attributes['href']);
      _languageMap[title] = url;
    });
    durations.forEach((element) {
      String title = element.text.trim();
      String url = getDateUrl(element.attributes['href']);
      _dateMap[title] = url;
    });
  }

  // ======================== Helper functions ============================== //

  String getRepoDescriptions(Element element) {
    var descriptionElement =
        element.getElementsByClassName('col-9 color-text-secondary my-1 pr-4');
    return descriptionElement.length == 0
        ? ("N.A")
        : (descriptionElement[0].text.trim());
  }

  String getRepoLang(Element element) {
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
    var elements =
        element.getElementsByClassName('octicon octicon-repo-forked');
    return (elements.length == 0) ? 'N.A' : elements[0].parent.text.trim();
  }

  List<Contributor> getContributors(Element element) {
    var contributorBlock = element
        .getElementsByClassName('d-inline-block mr-3')
        .firstWhere((element) => element.text.trim() == 'Built by',
            orElse: () => null);

    var contributors = contributorBlock.children;

    return contributors.length == 0
        ? []
        : contributors.map((e) {
            return Contributor(
                e.attributes['href'], e.children[0].attributes['src']);
          }).toList();
  }

  String getStarsTdy(Element element) {
    var elements = element.getElementsByClassName('octicon octicon-star');
    return (elements.length < 2) ? 'N.A' : elements[1].parent.text.trim();
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

  String getFilteredUrl(String spoken, String lang, String date) {
    String baseAddress = trendingAddress;

    if (lang == 'Any') {
      if (date == 'Any') {
        if (spoken == 'Any') {
          return baseAddress;
        } else {
          return baseAddress + '?' + _spokenMap[spoken];
        }
      } else {
        if (spoken == 'Any') {
          return baseAddress + '?' + _dateMap[date];
        } else {
          return baseAddress + '?' + _dateMap[date] + '&' + _spokenMap[spoken];
        }
      }
    } else {
      if (spoken == 'Any') {
        return baseAddress +
            '/' +
            _languageMap[lang] +
            '?' +
            (date == 'Any' ? 'since=daily' : _dateMap[date]);
      } else {
        return baseAddress +
            '/' +
            _languageMap[lang] +
            '?' +
            (date == 'Any' ? 'since=daily' : _dateMap[date]) +
            '&' +
            _spokenMap[spoken];
      }
    }
  }

  String getSpokenUrl(String url) {
    return url.split('?')[1];
  }

  String getLangUrl(String url) {
    return url.split('/')[2].split('?')[0];
  }

  String getDateUrl(String url) {
    return url.split('?')[1];
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
