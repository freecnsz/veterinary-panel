class APIUrls {
  static const String baseUrl = "https://dummyjson.com/";
  static const String products = "products";
  static const String authUrl =
      "https://comnets.arabulucuyuz.net"; // url for authentication
  static const String authenticate =
      "/petapi/Account/Authenticate"; // path for authentication
  static const String getAllProducts = baseUrl + products;
  static const String authentication =
      authUrl + authenticate; // full url for authentication
}
