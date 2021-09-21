enum RequestContentType { json, x_www_form_urlencoded }

class Timeout {
  static int get connectTimeout => 30000;
  static int get receiveTimeout => 30000;
}
