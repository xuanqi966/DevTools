import 'package:dev_tools/models/trend-scrapper/Repository.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:html/parser.dart';
import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../models/trend-scrapper/Developer.dart';

class DevScraper with ChangeNotifier {
  final _rootAddress = 'https://github.com/trending/developers';

  SharedPreferences _localStorage;

  String _currAddress;
  String _language;
  String _dateRange;

  Map<String, String> _languageMap = {'Any': ''};
  Map<String, String> _dateRangeMap = {};

  List<Developer> _developers = [];

  // ======================= Main Functions =============================== //

  Future<void> initScraper() async {
    await getFilterData();
    updateCurrAddress();
    await loadFilters();
    await loadScraper();
    notifyListeners();
  }

  Future<void> loadScraper() async {
    _developers = [];
    final response = await http.get(Uri.parse(_currAddress));

    if (response.statusCode == 200) {
      var document = parse(response.body);
      var elements = document.getElementsByClassName('Box-row d-flex');
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
    notifyListeners();
  }

  Future<void> updateScraper() async {
    updateCurrAddress();
    storeFilterData();
    await loadScraper();
  }

  Future<void> loadFilters() async {
    final response = await http.get(Uri.parse(_rootAddress));
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
        String suffix = element.attributes['href'].split('/')[3].split('?')[0];
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
    notifyListeners();
  }

  Future<void> getFilterData() async {
    _localStorage = await SharedPreferences.getInstance();
    _language = _localStorage.getString('DevLanguage') ?? 'Any';
    _dateRange = _localStorage.getString('DateRange') ?? 'Today';
  }

  void storeFilterData() {
    _localStorage.setString('DevLanguage', _language);
    _localStorage.setString('DateRange', _dateRange);
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
    print(_language);
    print(_dateRange);
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
  }

  void updateLanguage(String language) {
    _language = language;
  }

  void updateDateRange(String dateRange) {
    _dateRange = dateRange;
  }

  void clearDevelopers() {
    _developers = [];
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

  Map get getLanguageMa {
    return _languageMap;
  }

  Map get getDateRangeMap {
    return _dateRangeMap;
  }

  List<Developer> get getDevelopers {
    return _developers;
  }
}
