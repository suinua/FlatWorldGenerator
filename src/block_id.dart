class BlockId {
  final int value;

  BlockId(this.value) : assert(value >= 1000);

  List<int> toUnit8List() {
    var separatedValue = value.toString().split('');
    return separatedValue.map((e) => 48 + int.parse(e)).toList();
  }
}
