import '../domain/company.dart';
import '../domain/place.dart';

class ScannedCode {
  ScannedCode(this._value);

  final String _value;

  final String _separator = ',';

  Place toPlace() {
    var items = _value.split(_separator);
    return Place(
      name: items[0],
      id: items[1],
      company: Company(id: '', name: items[2]),
    );
  }
}
