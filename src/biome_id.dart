class BiomeId {
  final int value;

  BiomeId(this.value);

  List<int> toUnit8List() {
    var separatedValue = value.toString().split('');
    return separatedValue.map((e) => 48 + int.parse(e)).toList();
  }
}