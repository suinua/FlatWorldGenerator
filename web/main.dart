import 'dart:html';
import 'dart:io' as io;

import 'dart:typed_data';
import 'package:meta/meta.dart';

void main() {
  AnchorElement generateButton = querySelector('#generateButton');
  generateButton.onClick.listen((event) {
    NumberInputElement firstBlockIdElement = querySelector('#firstBlockId');
    NumberInputElement firstBlockDataElement = querySelector('#firstBlockData');
    NumberInputElement firstBlockCountElement = querySelector('#firstBlockCount');
    var firstBlockLayer = BlockLayer(id: firstBlockIdElement.valueAsNumber,
        data: firstBlockDataElement.valueAsNumber,
        count: firstBlockCountElement.valueAsNumber);

    NumberInputElement secondBlockIdElement = querySelector('#secondBlockId');
    NumberInputElement secondBlockDataElement = querySelector('#secondBlockData');
    NumberInputElement secondBlockCountElement = querySelector(
        '#secondBlockCount');
    var secondBlockLayer = BlockLayer(id: secondBlockIdElement.valueAsNumber,
        data: secondBlockDataElement.valueAsNumber,
        count: secondBlockCountElement.valueAsNumber);

    NumberInputElement thirdBlockIdElement = querySelector('#thirdBlockId');
    NumberInputElement thirdBlockDataElement = querySelector('#thirdBlockData');
    NumberInputElement thirdBlockCountElement = querySelector('#thirdBlockCount');
    var thirdBlockLayer = BlockLayer(id: thirdBlockIdElement.valueAsNumber,
        data: thirdBlockDataElement.valueAsNumber,
        count: thirdBlockCountElement.valueAsNumber);


    convert(firstBlockLayer, secondBlockLayer, thirdBlockLayer);
  });
}

void convert(BlockLayer firstBlockLayer, BlockLayer secondBlockLayer,
    BlockLayer thirdBlockLayer) {
  var biomeIdIndex = 66;

  var firstBlockDataIndex = 122;
  var firstBlockIdIndex = 147;
  var firstBlockCountIndex = 170;

  var secondBlockDataIndex = 213;
  var secondBlockIdIndex = 238;
  var secondBlockCountIndex = 264;

  var thirdBlockDataIndex = 304;
  var thirdBlockIdIndex = 329;
  var thirdBlockCountIndex = 352;

  var file = io.File('../level.dat');
  file.readAsBytes().then((Uint8List contents) {
    contents[biomeIdIndex] = intToUni8(6);

    contents[firstBlockIdIndex] = intToUni8(firstBlockLayer.id);
    contents[firstBlockDataIndex] = intToUni8(firstBlockLayer.data);
    contents[firstBlockCountIndex] = intToUni8(firstBlockLayer.count);

    contents[secondBlockIdIndex] = intToUni8(secondBlockLayer.id);
    contents[secondBlockDataIndex] = intToUni8(secondBlockLayer.data);
    contents[secondBlockCountIndex] = intToUni8(secondBlockLayer.count);

    contents[thirdBlockIdIndex] = intToUni8(thirdBlockLayer.id);
    contents[thirdBlockDataIndex] = intToUni8(thirdBlockLayer.data);
    contents[thirdBlockCountIndex] = intToUni8(thirdBlockLayer.count);

    setUpDownloadButton('level.dat', contents);
  });
}

int intToUni8(int value) {
  return 48 + value;
}


void setUpDownloadButton(String saveFileName, Uint8List data) {
  var blob = Blob([data], 'octet/stream');
  AnchorElement downloadLink = querySelector('#download');
  downloadLink.href = Url.createObjectUrlFromBlob(blob);
  downloadLink.text = 'ダウンロード';
  downloadLink.download = saveFileName;
  downloadLink.style.display = '';
}

class BlockLayer {
  final int id;
  final int data;
  final int count;

  BlockLayer({@required this.id, @required this.data, @required this.count});
}
