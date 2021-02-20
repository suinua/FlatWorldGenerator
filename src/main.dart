import 'dart:html';
import 'dart:typed_data';

import 'biome_id.dart';
import 'block_count.dart';
import 'block_data_value.dart';
import 'block_id.dart';
import 'block_layer.dart';
import 'level_data.dart';

void main() {
  AnchorElement generateButton = querySelector('#generateButton');
  generateButton.onClick.listen((event) {
    InputElement biomeIdElement = querySelector('#biomeId');

    InputElement firstBlockIdElement = querySelector('#firstBlockId');
    InputElement firstBlockDataElement = querySelector('#firstBlockData');
    InputElement firstBlockCountElement =
        querySelector('#firstBlockCount');

    var firstBlockLayer = BlockLayer(
        id: BlockId(int.parse(firstBlockIdElement.value)),
        data: BlockDataValue(int.parse(firstBlockDataElement.value)),
        count: BlockCount(int.parse(firstBlockCountElement.value)));

    InputElement secondBlockIdElement = querySelector('#secondBlockId');
    InputElement secondBlockDataElement =
        querySelector('#secondBlockData');
    InputElement secondBlockCountElement =
        querySelector('#secondBlockCount');

    var secondBlockLayer = BlockLayer(
        id: BlockId(int.parse(secondBlockIdElement.value)),
        data: BlockDataValue(int.parse(secondBlockDataElement.value)),
        count: BlockCount(int.parse(secondBlockCountElement.value)));

    InputElement thirdBlockIdElement = querySelector('#thirdBlockId');
    InputElement thirdBlockDataElement = querySelector('#thirdBlockData');
    InputElement thirdBlockCountElement =
        querySelector('#thirdBlockCount');

    var thirdBlockLayer = BlockLayer(
        id: BlockId(int.parse(thirdBlockIdElement.value)),
        data: BlockDataValue(int.parse(thirdBlockDataElement.value)),
        count: BlockCount(int.parse(thirdBlockCountElement.value)));

    convert(BiomeId(int.parse(biomeIdElement.value)), firstBlockLayer,
        secondBlockLayer, thirdBlockLayer);
  });
}

void convert(BiomeId biomeId, BlockLayer firstBlockLayer,
    BlockLayer secondBlockLayer, BlockLayer thirdBlockLayer) {
  var contents = getLevelData();

  void set(int firstIndex, List<int> list) {
    list.asMap().forEach((key, element) {
      contents[firstIndex + key] = element;
    });
  }

  set(LevelDataIndex.BiomeId,biomeId.toUnit8List());

  set(LevelDataIndex.FirstBlockId,firstBlockLayer.id.toUnit8List());
  set(LevelDataIndex.FirstBlockData,firstBlockLayer.data.toUnit8List());
  set(LevelDataIndex.FirstBlockCount,firstBlockLayer.count.toUnit8List());

  set(LevelDataIndex.SecondBlockId,secondBlockLayer.id.toUnit8List());
  set(LevelDataIndex.SecondBlockData,secondBlockLayer.data.toUnit8List());
  set(LevelDataIndex.SecondBlockCount,secondBlockLayer.count.toUnit8List());

  set(LevelDataIndex.ThirdBlockId,thirdBlockLayer.id.toUnit8List());
  set(LevelDataIndex.ThirdBlockData,thirdBlockLayer.data.toUnit8List());
  set(LevelDataIndex.ThirdBlockCount,thirdBlockLayer.count.toUnit8List());

  setUpDownloadButton('level.dat', contents);
}

void setUpDownloadButton(String saveFileName, Uint8List data) {
  var blob = Blob([data], 'octet/stream');
  AnchorElement downloadLink = querySelector('#download');
  downloadLink.href = Url.createObjectUrlFromBlob(blob);
  downloadLink.text = 'ダウンロード';
  downloadLink.download = saveFileName;
  downloadLink.style.display = '';
}
