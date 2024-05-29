class StateType{
  final bool _flag;
  String _token;
  StateType(this._flag, this._token);
  bool getState(){
    return _flag;
  }
  String getToken(){
    return _token;
  }
}