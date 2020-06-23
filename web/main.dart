import 'dart:html';

import 'dart:typed_data';

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
        id: firstBlockIdElement.valueAsNumber,
        data: firstBlockDataElement.valueAsNumber,
        count: firstBlockCountElement.valueAsNumber);

    NumberInputElement secondBlockIdElement = querySelector('#secondBlockId');
    NumberInputElement secondBlockDataElement =
        querySelector('#secondBlockData');
    NumberInputElement secondBlockCountElement =
        querySelector('#secondBlockCount');
    var secondBlockLayer = BlockLayer(
        id: secondBlockIdElement.valueAsNumber,
        data: secondBlockDataElement.valueAsNumber,
        count: secondBlockCountElement.valueAsNumber);

    NumberInputElement thirdBlockIdElement = querySelector('#thirdBlockId');
    NumberInputElement thirdBlockDataElement = querySelector('#thirdBlockData');
    NumberInputElement thirdBlockCountElement =
        querySelector('#thirdBlockCount');
    var thirdBlockLayer = BlockLayer(
        id: thirdBlockIdElement.valueAsNumber,
        data: thirdBlockDataElement.valueAsNumber,
        count: thirdBlockCountElement.valueAsNumber);

    convert(biomeIdElement.valueAsNumber, firstBlockLayer, secondBlockLayer,
        thirdBlockLayer);
  });
}

void convert(int biomeId, BlockLayer firstBlockLayer,
    BlockLayer secondBlockLayer, BlockLayer thirdBlockLayer) {
  var biomeIdIndex = 64;

  var firstBlockDataIndex = 122;
  var firstBlockIdIndex = 147;
  var firstBlockCountIndex = 170;

  var secondBlockDataIndex = 213;
  var secondBlockIdIndex = 238;
  var secondBlockCountIndex = 264;

  var thirdBlockDataIndex = 304;
  var thirdBlockIdIndex = 329;
  var thirdBlockCountIndex = 352;

  var contents = getLevelData();

  intToUni8List(biomeId).asMap().forEach((key, element) {
    contents[biomeIdIndex + key] = element;
  });

  intToUni8List(firstBlockLayer.id).asMap().forEach((key, element) {
    contents[firstBlockIdIndex + key] = element;
  });
  intToUni8List(firstBlockLayer.data).asMap().forEach((key, element) {
    contents[firstBlockDataIndex + key] = element;
  });
  intToUni8List(firstBlockLayer.count).asMap().forEach((key, element) {
    contents[firstBlockCountIndex + key] = element;
  });

  intToUni8List(secondBlockLayer.id).asMap().forEach((key, element) {
    contents[secondBlockIdIndex + key] = element;
  });
  intToUni8List(secondBlockLayer.data).asMap().forEach((key, element) {
    contents[secondBlockDataIndex + key] = element;
  });
  intToUni8List(secondBlockLayer.count).asMap().forEach((key, element) {
    contents[secondBlockCountIndex + key] = element;
  });

  intToUni8List(thirdBlockLayer.id).asMap().forEach((key, element) {
    contents[thirdBlockIdIndex + key] = element;
  });
  intToUni8List(thirdBlockLayer.data).asMap().forEach((key, element) {
    contents[thirdBlockDataIndex + key] = element;
  });
  intToUni8List(thirdBlockLayer.count).asMap().forEach((key, element) {
    contents[thirdBlockCountIndex + key] = element;
  });

  setUpDownloadButton('level.dat', contents);
}

List<int> intToUni8List(int value) {
  var valueColumn = value.toString().split('');
  return valueColumn.map((e) => 48 + int.parse(e)).toList();
}

void setUpDownloadButton(String saveFileName, Uint8List data) {
  var blob = Blob([data], 'octet/stream');
  AnchorElement downloadLink = querySelector('#download');
  downloadLink.href = Url.createObjectUrlFromBlob(blob);
  downloadLink.text = 'ダウンロード';
  downloadLink.download = saveFileName;
  downloadLink.style.display = '';
}
