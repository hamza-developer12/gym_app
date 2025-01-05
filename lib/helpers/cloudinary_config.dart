import 'package:cloudinary/cloudinary.dart';

class CloudinaryConfig {
  static final _cloudName = 'deatjtqsi';
  static final _apiKey = '653975348347914';
  static final _apiSecret = 'e0yKuHJrAltzCMn2E-oyy_c7sPA';

  static final _cloudinary = Cloudinary.signedConfig(
    apiKey: _apiKey,
    apiSecret: _apiSecret,
    cloudName: _cloudName,
  );
  static Future<CloudinaryResponse> uploadImage(String filePath) async {
    final response = await _cloudinary.upload(
      file: filePath,
      folder: "gym_app",
      resourceType: CloudinaryResourceType.image,
    );
    return response;
  }

  static Future<CloudinaryResponse> deleteImage(String publicId) async {
    final response = await _cloudinary.destroy(publicId);
    return response;
  }
}
