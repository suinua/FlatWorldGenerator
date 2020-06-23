import 'package:meta/meta.dart';

import 'block_count.dart';
import 'block_data_value.dart';
import 'block_id.dart';

class BlockLayer {
  final BlockId id;
  final BlockDataValue data;
  final BlockCount count;

  BlockLayer({@required this.id, @required this.data, @required this.count});
}
