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
    NumberInputElement biomeIdElement = querySelector('#biomeId');

    NumberInputElement firstBlockIdElement = querySelector('#firstBlockId');
    NumberInputElement firstBlockDataElement = querySelector('#firstBlockData');
    NumberInputElement firstBlockCountElement =
        querySelector('#firstBlockCount');

    var firstBlockLayer = BlockLayer(
        id: BlockId(firstBlockIdElement.valueAsNumber),
        data: BlockDataValue(firstBlockDataElement.valueAsNumber),
        count: BlockCount(firstBlockCountElement.valueAsNumber));

    NumberInputElement secondBlockIdElement = querySelector('#secondBlockId');
    NumberInputElement secondBlockDataElement =
        querySelector('#secondBlockData');
    NumberInputElement secondBlockCountElement =
        querySelector('#secondBlockCount');

    var secondBlockLayer = BlockLayer(
        id: BlockId(secondBlockIdElement.valueAsNumber),
        data: BlockDataValue(secondBlockDataElement.valueAsNumber),
        count: BlockCount(secondBlockCountElement.valueAsNumber));

    NumberInputElement thirdBlockIdElement = querySelector('#thirdBlockId');
    NumberInputElement thirdBlockDataElement = querySelector('#thirdBlockData');
    NumberInputElement thirdBlockCountElement =
        querySelector('#thirdBlockCount');

    var thirdBlockLayer = BlockLayer(
        id: BlockId(thirdBlockIdElement.valueAsNumber),
        data: BlockDataValue(thirdBlockDataElement.valueAsNumber),
        count: BlockCount(thirdBlockCountElement.valueAsNumber));

    convert(BiomeId(biomeIdElement.valueAsNumber), firstBlockLayer,
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
