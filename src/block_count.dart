class BlockCount {
  final int value;

  BlockCount(this.value) : assert(value >= 100);

  List<int> toUnit8List() {
    var separatedValue = value.toString().split('');
    return separatedValue.map((e) => 48 + int.parse(e)).toList();
  }
}
