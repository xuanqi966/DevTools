import './provider/TrendScraper.dart';

main() async {
  var scraper = TrendScraper();
  scraper.setAddress('https://github.com/trending');
  await scraper.loadRepos();
  scraper.printRepoUrl();
}
