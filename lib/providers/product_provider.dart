import 'dart:io';

import 'package:cloudinary/cloudinary.dart';
import 'package:flutter/material.dart';
import 'package:gym_app/helpers/cloudinary_config.dart';
import 'package:gym_app/helpers/ui_helper.dart';
import 'package:gym_app/services/api_services.dart';
import 'package:image_picker/image_picker.dart';

class ProductProvider extends ChangeNotifier {
  final _apiServices = ApiServices();
  bool _loading = false;
  bool get loading => _loading;
  CloudinaryResponse? _response;

  // Image picker variables
  File? _image;
  File? get image => _image;
  final imagePicker = ImagePicker();
  XFile? pickedImage;
  Future<void> getImage() async {
    pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _image = File(pickedImage!.path);
      notifyListeners();
    } else {
      notifyListeners();
    }
  }

  Future<void> addProduct(
      BuildContext context, Map<String, dynamic> data) async {
    try {
      _loading = true;
      notifyListeners();

      if (data['productName'].isEmpty ||
          data['price'].isEmpty ||
          data['description'].isEmpty) {
        UiHelper.errorFlushMessage(context, "All fields are required");
        return;
      }
      if (_image == null) {
        UiHelper.errorFlushMessage(context, "Please select an image");
        return;
      }
      _response = await CloudinaryConfig.uploadImage(image!.path);
      if (_response != null) {
        data['image'] = _response!.secureUrl;
        data['publicId'] = _response!.publicId;
        await _apiServices.addRecord("products", "", data);
        _image = null;
        Navigator.pop(context);
        UiHelper.successFlushMessage(context, "Product added successfully");
      }
    } catch (error) {
      UiHelper.errorFlushMessage(context, "Error: $error");
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<List<Map<String, dynamic>>> getProducts() async {
    final products = await _apiServices.getRecords("products");
    return products
        .map((product) => product.data() as Map<String, dynamic>)
        .toList();
  }

  Future<void> updateProduct(
      BuildContext context, Map<String, dynamic> data) async {
    try {
      _loading = true;
      notifyListeners();
      if (data['productName'].isEmpty ||
          data['price'].isEmpty ||
          data['description'].isEmpty) {
        UiHelper.errorFlushMessage(context, "All fields are required");
        return;
      }
      await _apiServices.updateRecordById("products", data['id'], data);
      _image = null;
      Navigator.pop(context);
      UiHelper.successFlushMessage(context, "Product updated successfully");
    } catch (error) {
      UiHelper.errorFlushMessage(context, "Error: $error");
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(
      BuildContext context, String id, String publicId) async {
    try {
      _loading = true;
      notifyListeners();
      if (publicId.isNotEmpty) {
        await CloudinaryConfig.deleteImage(publicId);
      }
      await _apiServices.deleteById("products", id);
      Navigator.pop(context);
      UiHelper.successFlushMessage(context, "Product deleted successfully");
    } catch (error) {
      UiHelper.errorFlushMessage(context, "Error: $error");
    } finally {
      _loading = false;
      notifyListeners();
    }
  }

  void resetImage() {
    _image = null;
    pickedImage = null;
  }
}
