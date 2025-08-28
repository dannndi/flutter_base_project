import 'package:base_project/core/component/image/design_assets.dart';

/// using this class on 'web' wont work
/// because web cannot access / have 'File' class
class FileAssets extends DesignAssets {
  final dynamic file;

  FileAssets(this.file);
}
