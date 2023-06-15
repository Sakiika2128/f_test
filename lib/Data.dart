import 'package:f_test/main.dart';

class Data{
  int _price;
  String _name;
  Data(this._name, this._price): super();

  @override
  String toString(){
    return _name + ':' + _price.toString() + '円'; 
  }
}