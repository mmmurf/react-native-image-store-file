'use strict';

var RNImageStoreFileManager = require('react-native').NativeModules.RNImageStoreFileManager;

module.exports = {

  writeImageStoreFileAsync(imageTag, path) {
    return RNImageStoreFileManager.writeImageStoreFile(imageTag, path);
  }

}
