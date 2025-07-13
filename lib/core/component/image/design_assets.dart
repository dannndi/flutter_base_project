import 'dart:io';

sealed class DesignAssets {}

class NetworkAssets extends DesignAssets {
  final String url;
  NetworkAssets(this.url);
}

class FileAssets extends DesignAssets {
  final File file;
  FileAssets(this.file);
}

class PngAssets extends DesignAssets {
  final String path;
  PngAssets(this.path);
}

class SvgAssets extends DesignAssets {
  final String path;
  SvgAssets(this.path);
}
