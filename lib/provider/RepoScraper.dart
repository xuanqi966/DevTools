import 'package:dev_tools/util/my-logger.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

import '../models/trend-scrapper/Repository.dart';
import '../models/trend-scrapper/Contributor.dart';

class RepoScraper with ChangeNotifier {
  final logger = getLogger('RepoScraper');

  static final gitHubAddress = 'https://github.com';
  final _rootAddress = 'https://github.com/trending';

  SharedPreferences _localStorage;

  bool _isNothingFound = false;

  String _defaultSpoken = 'Any';
  String _defaultLanguage = 'Any';
  String _defaultDateRange = 'Today';

  String _currAddress;
  String _spoken;
  String _language;
  String _date;

  Map<String, String> _spokenMap = {'Any': ''};
  Map<String, String> _languageMap = {'Any': ''};
  Map<String, String> _dateMap = {};

  List<Repository> _repositories = [];

  bool _isError = false;

  // ======================= Main Functions =============================== //

  Future<void> initScraper() async {
    logger.i('initScraper | Started initialising...');
    await getFilterData();
    await loadFilters();
    updateCurrAddress();
    await loadScraper();
    notifyListeners();
    logger.i('initScraper | Initalisation complete!');
  }

  Future<void> loadScraper() async {
    logger.i('loadScraper | Started loading with address $_currAddress');
    _repositories = [];

    try {
      final response = await http.get(Uri.parse(_currAddress));
      logger.i(
          'loadScraper | HTTP request returned with status ${response.statusCode}');

      if (response.statusCode == 200) {
        var document = parse(response.body);
        var elements = document.getElementsByClassName('Box-row');

        logger.i(
            'loadScraper | ${elements.length} elements retrieved from web page');

        if (elements.length == 0) {
          _isNothingFound = true;
        } else {
          _isNothingFound = false;
          elements.forEach((element) {
            var nameElement = element
                .getElementsByClassName('h3 lh-condensed')[0]
                .children[0];
            var infoElement = element
                .getElementsByClassName('f6 color-text-secondary mt-2')[0];

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

            _repositories.add(repo);
          });
        }
      }
      _isError = false;
      notifyListeners();
      logger.i('loadScraper | Loading complete!');
    } catch (_) {
      _isError = true;
      notifyListeners();
      logger.i('loadScraper | Connection failed.');
    }
  }

  Future<void> updateScraper() async {
    logger.i('updateScraper | Started to update...');
    updateCurrAddress();
    storeFilterData();
    await loadScraper();
    logger.i('updateScraper | Updating complete!');
  }

  Future<void> loadFilters() async {
    logger
        .i('loadFilters | Started to load filters with address $_rootAddress');
    try {
      final response = await http.get(Uri.parse(_rootAddress));
      logger.i(
          'loadFilters | HTTP request returned with status ${response.statusCode}');

      if (response.statusCode == 200) {
        var document = parse(response.body);
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
      _isError = false;
      notifyListeners();
      logger.i('loadFilters | Loading complete!');
    } catch (_) {
      _isError = true;
      logger.i('loadFilters | Connection error occured.');
      notifyListeners();
    }
  }

  Future<void> getFilterData() async {
    _localStorage = await SharedPreferences.getInstance();
    _spoken = _localStorage.getString('Spoken') ?? 'Any';
    _language = _localStorage.getString('Language') ?? 'Any';
    _date = _localStorage.getString('Date') ?? 'Today';
    logger.i(
        'getFilterData | Loading complete. Spoken: $_spoken, Language: $_language, DateRange: $_date');
  }

  void storeFilterData() {
    _localStorage.setString('Spoken', _spoken);
    _localStorage.setString('Language', _language);
    _localStorage.setString('Date', _date);
    logger.i(
        'storeFilterData | Storing complete. Spoken: $_spoken, Language: $_language, DateRange: $_date');
  }

  // ======================== Scrapping-related helper functions ============== //

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

    if (contributorBlock == null) {
      return [];
    }

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

  String getSpokenUrl(String url) {
    return url.split('?')[1];
  }

  String getLangUrl(String url) {
    return url.split('/')[2].split('?')[0];
  }

  String getDateUrl(String url) {
    return url.split('?')[1];
  }

  // ======================== Helper functions ============================== //

  void updateCurrAddress() {
    logger.i(
        'updateCurrAddress | Starting... Address: $_currAddress, Spoken: $_spoken, Language: $_language, DateRange: $_date');

    if (_language == 'Any') {
      if (_date == 'Any') {
        if (_spoken == 'Any') {
          _currAddress = _rootAddress;
        } else {
          _currAddress = _rootAddress + '?' + _spokenMap[_spoken];
        }
      } else {
        if (_spoken == 'Any') {
          _currAddress = _rootAddress + '?' + _dateMap[_date];
        } else {
          _currAddress =
              _rootAddress + '?' + _dateMap[_date] + '&' + _spokenMap[_spoken];
        }
      }
    } else {
      if (_spoken == 'Any') {
        _currAddress = _rootAddress +
            '/' +
            _languageMap[_language] +
            '?' +
            (_date == 'Any' ? 'since=daily' : _dateMap[_date]);
      } else {
        _currAddress = _rootAddress +
            '/' +
            _languageMap[_language] +
            '?' +
            (_date == 'Any' ? 'since=daily' : _dateMap[_date]) +
            '&' +
            _spokenMap[_spoken];
      }
    }
    logger.i('updateCurrAddress | Complete! Address: $_currAddress');
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

  void setDefaultFilter() {
    _spoken = _defaultSpoken;
    _language = _defaultLanguage;
    _date = _defaultDateRange;
  }

  void clearRepos() {
    _repositories = [];
    notifyListeners();
  }

  // ======================== getters ============== //
  List<Repository> get getRepos {
    return _repositories;
  }

  Map<String, String> get getSpokenMap {
    return {..._spokenMap};
  }

  Map<String, String> get getLanMap {
    return {..._languageMap};
  }

  Map<String, String> get getDateMap {
    return {..._dateMap};
  }

  String get getSpoken {
    return _spoken;
  }

  String get getLanguage {
    return _language;
  }

  String get getDate {
    return _date;
  }

  bool get isNothingFound {
    return _isNothingFound;
  }

  bool get isError {
    return _isError;
  }
}
