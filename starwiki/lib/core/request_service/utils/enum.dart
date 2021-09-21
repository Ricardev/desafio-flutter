enum RequestContentType { json,  xWwwFormUrlencoded }

class Timeout {
  static int get connectTimeout => 30000;
  static int get receiveTimeout => 30000;
}
