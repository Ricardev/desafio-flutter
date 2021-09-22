abstract class IRequestProvider {
  void setDataName(String name);

  Future<T> getAsync<T>(
      String url, Function(Map<String, dynamic> json) fromJson);

  Future<T> postAsync<T>(
      String url, T objeto, T Function(Map<String, dynamic> json) fromJson);

  Future<T> putAsync<T>(
      String url, T objeto, T Function(Map<String, dynamic> json) fromJson);

  Future<T> deleteAsync<T>(
      String url, T objeto, T Function(Map<String, dynamic> json) fromJson);
}
