const backendURL = "http://192.168.100.11:8000/";

class APIs {
  static const String login = "api/login";
  static const String register = "api/register";
  static const String logout = "api/logout";
  static const String getnewsfeed = 'api/newsfeed';
  static const String searchNewsFeed = 'api/newsfeed/search/{name}';
  static const String getNearestHospitals = 'api/hospitals/{lat}/{lng}';
}
