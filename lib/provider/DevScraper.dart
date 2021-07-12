import 'package:dev_tools/models/trend-scrapper/Repository.dart';
import 'package:dev_tools/util/my-logger.dart';
import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/trend-scrapper/Developer.dart';

class DevScraper with ChangeNotifier {
  final _rootAddress = 'https://github.com/trending/developers';

  SharedPreferences _localStorage;

  bool _isNothingFound = false;

  String _defaultLanguage = 'Any';
  String _defaultDateRange = 'Today';

  String _currAddress;
  String _language;
  String _dateRange;

  Map<String, String> _languageMap = {'Any': ''};
  Map<String, String> _dateRangeMap = {};

  List<Developer> _developers = [];

  bool _isError = false;

  // ======================= For debugging ================================ //
  final log = Logger(printer: MyLogPrinter('DevScraper'));

  // ======================= Main Functions =============================== //

  Future<void> initScraper() async {
    log.i('initScraper | Started initialising...');
    await getFilterData();
    await loadFilters();
    updateCurrAddress();
    await loadScraper();
    notifyListeners();
    log.i('initScraper | Initalisation complete!');
  }

  Future<void> loadScraper() async {
    log.i('loadScraper | Started loading with address $_currAddress');
    _developers = [];

    try {
      final response = await http
          .get(Uri.parse(_currAddress))
          .catchError((e) => print(e.error));
      log.i(
          'loadScraper | HTTP request returned with status ${response.statusCode}');
      if (response.statusCode == 200) {
        var document = parse(response.body);
        var elements = document.getElementsByClassName('Box-row d-flex');
        log.i(
            'loadScraper | ${elements.length} elements retrieved from web page');
        if (elements.length == 0) {
          _isNothingFound = true;
        } else {
          _isNothingFound = false;
          elements.forEach((element) {
            Repository repo = Repository(
                title: getRepoName(element),
                url: getRepoUrl(element),
                language: null,
                stars: null,
                forks: null,
                starsNow: null,
                descriptions: getRepoDesc(element),
                contributors: null);
            Developer dev = Developer(
                userName: getUserName(element),
                accName: getAccName(element),
                accUrl: getAccUrl(element),
                avatorUrl: getAvatorUrl(element),
                repository: repo);
            _developers.add(dev);
          });
        }
      }
      _isError = false;
      notifyListeners();
      log.i('loadScraper | Loading complete!');
    } catch (_) {
      _isError = true;
      notifyListeners();
    }
  }

  Future<void> updateScraper() async {
    log.i('updateScraper | Started to update...');
    updateCurrAddress();
    storeFilterData();
    await loadScraper();
    log.i('updateScraper | Updating complete!');
  }

  Future<void> loadFilters() async {
    log.i('loadFilters | Started to load filters with address $_rootAddress');

    try {
      final response = await http
          .get(Uri.parse(_rootAddress))
          .catchError((e) => print(e.error));
      log.i(
          'loadFilters | HTTP request returned with status ${response.statusCode}');
      if (response.statusCode == 200) {
        var document = parse(response.body);
        var headerElement = document.getElementsByClassName(
            'Box-header d-lg-flex flex-items-center flex-justify-between');
        var menuElements =
            headerElement[0].getElementsByClassName('select-menu-list');

        var languages =
            menuElements[0].getElementsByClassName('select-menu-item');
        languages.forEach((element) {
          String title = element.text.trim();
          String suffix =
              element.attributes['href'].split('/')[3].split('?')[0];
          _languageMap[title] = suffix;
        });

        var dateRanges =
            menuElements[1].getElementsByClassName('select-menu-item');
        dateRanges.forEach((element) {
          String title = element.text.trim();
          String suffix = element.attributes['href'].split('?')[1];
          _dateRangeMap[title] = suffix;
        });
      }
      _isError = false;
      notifyListeners();
      log.i('loadFilters | Loading complete!');
    } catch (_) {
      _isError = true;
      notifyListeners();
    }
  }

  Future<void> getFilterData() async {
    _localStorage = await SharedPreferences.getInstance();
    _language = _localStorage.getString('DevLanguage') ?? 'Any';
    _dateRange = _localStorage.getString('DateRange') ?? 'Today';
    log.i(
        'getFilterData | Loading complete. Language: $_language, DateRange: $_dateRange');
  }

  void storeFilterData() {
    _localStorage.setString('DevLanguage', _language);
    _localStorage.setString('DateRange', _dateRange);
    log.i(
        'storeFilterData | Filter data stored. Language: $_language, DateRange: $_dateRange');
  }

  // ======================== Scrapping-related helper functions ============== //
  String getUserName(Element element) {
    var titleElement = element.getElementsByClassName('h3 lh-condensed')[0];
    return titleElement.text.trim();
  }

  String getAccName(Element element) {
    var nameElements = element.getElementsByClassName('f4 text-normal mb-1');
    if (nameElements.isEmpty) {
      return 'N.A';
    } else {
      var nameElement = nameElements[0];
      return nameElement.text.trim();
    }
  }

  String getAccUrl(Element element) {
    var titleElement = element.getElementsByClassName('h3 lh-condensed')[0];
    return titleElement.children[0].attributes['href'];
  }

  String getAvatorUrl(Element element) {
    var avatarElement =
        element.getElementsByClassName('rounded avatar-user')[0];
    return avatarElement.attributes['src'];
  }

  String getRepoName(Element element) {
    var repoTitleElement = element.getElementsByClassName('h4 lh-condensed');
    return repoTitleElement.length == 0
        ? 'N.A'
        : repoTitleElement[0].text.trim();
  }

  String getRepoUrl(Element element) {
    var repoTitleElement = element.getElementsByClassName('h4 lh-condensed');
    return repoTitleElement.length == 0
        ? 'N.A'
        : repoTitleElement[0].children[0].attributes['href'];
  }

  String getRepoDesc(Element element) {
    var repoDescElement =
        element.getElementsByClassName('f6 color-text-secondary mt-1');
    return repoDescElement.length == 0 ? 'N.A' : repoDescElement[0].text.trim();
  }

  // ========================= Util functions =================== //

  void updateCurrAddress() {
    log.i(
        'updateCurrAddress | Starting... Address: $_currAddress, Language: $_language, DateRange: $_dateRange');
    if (_language == 'Any') {
      if (_dateRange == 'Today') {
        _currAddress = _rootAddress;
      } else {
        _currAddress = _rootAddress + '?' + _dateRangeMap[_dateRange];
      }
    } else {
      if (_dateRange == 'Today') {
        _currAddress =
            _rootAddress + '/' + _languageMap[_language] + '?since=daily';
      } else {
        _currAddress = _rootAddress +
            '/' +
            _languageMap[_language] +
            '?' +
            _dateRangeMap[_dateRange];
      }
    }
    log.i('updateCurrAddress | Complete! Address: $_currAddress');
  }

  void updateLanguage(String language) {
    _language = language;
  }

  void updateDateRange(String dateRange) {
    _dateRange = dateRange;
  }

  void setDefaultFilter() {
    _language = _defaultLanguage;
    _dateRange = _defaultDateRange;
  }

  void clearDevelopers() {
    _developers = [];
    notifyListeners();
  }

  //================================ Getters =================================//
  String get getCurrAddress {
    return _currAddress;
  }

  String get getLanguage {
    return _language;
  }

  String get getDateRange {
    return _dateRange;
  }

  Map get getLanguageMap {
    return _languageMap;
  }

  Map get getDateRangeMap {
    return _dateRangeMap;
  }

  List<Developer> get getDevelopers {
    return _developers;
  }

  bool get isNothingFound {
    return _isNothingFound;
  }

  bool get isError {
    return _isError;
  }
}
