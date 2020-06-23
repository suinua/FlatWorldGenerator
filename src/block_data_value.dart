class BlockDataValue {
  final int value;

  BlockDataValue(this.value);

  List<int> toUnit8List() {
    var separatedValue = value.toString().split('');
    return separatedValue.map((e) => 48 + int.parse(e)).toList();
  }
}