import 'package:flutter/services.dart';
import 'package:camera/camera.dart';

class CameraService {
  static List<CameraDescription>? _cameras;

  static Future<List<CameraDescription>> get cameras async {
    _cameras ??= await availableCameras();
    return _cameras!;
  }

  /// Camera controller
  static Future<CameraController> get controller async => await getController();

  /// Get the camera controller
  static Future<CameraController> getController() async {
    List<CameraDescription> cameras = await availableCameras();
    CameraController controller = CameraController(cameras.first, ResolutionPreset.max);
    await controller.initialize();
    return controller;
  }

  /// Get the camera video controller
  static Future<CameraController> videoController() async {
    List<CameraDescription> cameras = await availableCameras();
    CameraController controller;
    controller = CameraController(cameras.first, ResolutionPreset.veryHigh, enableAudio: true);
    await controller.initialize();
    await controller.lockCaptureOrientation(DeviceOrientation.landscapeLeft);
    return controller;
  }

  /// Get camera
  static Future<CameraController> getCamera({CameraLensDirection? direction}) async {
    List<CameraDescription> cameras = await CameraService.cameras;
    int cameraIndex = 0;

    if (cameras.isEmpty) {
      throw Exception();
    }

    if (direction != null) {
      int index = cameras.indexWhere((camera) => camera.lensDirection == direction);
      if (index != -1) {
        cameraIndex = index;
      }
    }

    CameraController controller = CameraController(cameras[cameraIndex], ResolutionPreset.veryHigh);
    await controller.initialize();
    return controller;
  }

  /// Rotate camera
  static Future<CameraController> rotate(CameraLensDirection direction) async {
    List<CameraDescription> cameras = await CameraService.cameras;
    CameraDescription camera = cameras.firstWhere((element) => element.lensDirection == direction);

    int frontIndex = cameras.indexWhere((element) => element.lensDirection == CameraLensDirection.front);
    int backIndex = cameras.indexWhere((element) => element.lensDirection == CameraLensDirection.back);

    if (direction == CameraLensDirection.back && frontIndex != -1) {
      camera = cameras.firstWhere((element) => element.lensDirection == CameraLensDirection.front);
    }

    if (direction == CameraLensDirection.front && backIndex != -1) {
      camera = cameras.firstWhere((element) => element.lensDirection == CameraLensDirection.back);
    }

    CameraController controller = CameraController(camera, ResolutionPreset.max);
    await controller.initialize();
    return controller;
  }
}
