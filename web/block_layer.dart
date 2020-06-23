import 'package:meta/meta.dart';

class BlockLayer {
  final int id;
  final int data;
  final int count;

  BlockLayer({@required this.id, @required this.data, @required this.count})
      : assert(id >= 1000),
        assert(data >= 100);
}
