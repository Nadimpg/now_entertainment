class ApiUrlContainer {

  static const baseURL = "https://www.nowentertainment.net/wp-json/wp/v2/";
  ///HomeCategory
  static const homeCategory = "categories";
  ///HomeCategoryPost
  static const homeCategoryPostStart = "posts?categories=";
  static const homeCategoryPostEnd = "&orderby=date";

  ///privacyPolicy
  static const privacyPolicy="pages?slug=privacy-policy";

  ///About us
  static const aboutUs="pages?slug=about-us";

  ///search
  static const search="posts?search=";

  ///termsCondition
  static const termsCondition="pages?slug=terms-of-use";

}
