class ModelClass {
  final bool _flag;
  final String _token;

  ModelClass(this._flag, this._token);

  bool getState() {
    return _flag;
  }

  String getToken() {
    return _token;
  }
}
