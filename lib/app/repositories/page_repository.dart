import 'package:moderator_app/app/repositories/repository.dart';
import 'package:moderator_app/app/models/index.dart';
import 'package:moderator_app/app/constants/index.dart';

class PageRepository extends Repository {
  Future<HomePageData?> homePageData() async {
    return await getData<HomePageData>(
      homePageDataEndPoint,
      body: {},
    );
  }

  Future<HtmlPage> aboutPage() async {
    return await getData<HtmlPage>(
      aboutPageEndPoint,
      body: {},
    );
  }

  Future<HtmlPage> termsPage() async {
    return await getData<HtmlPage>(
      termsPageEndPoint,
      body: {},
    );
  }

  Future<HtmlPage> policyPage() async {
    return await getData<HtmlPage>(
      policyPageEndPoint,
      body: {},
    );
  }
}