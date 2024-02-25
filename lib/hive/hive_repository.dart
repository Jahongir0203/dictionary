
import 'package:hive/hive.dart';

class HiveRepository{

  final Box _box=Hive.box('dictionary');

  saveDictionaries(List<Map<String, dynamic>> dictionaries){
    _box.put('items',dictionaries);
  }

  List<Map<String, dynamic>> getDictionnaries(){
    return _box.get('items', defaultValue: List<Map<String, dynamic>>.of([]));
  }


}
