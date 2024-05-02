import 'dart:developer';
import 'dart:ffi';
import 'dart:typed_data';

class ProductModel {
  int? Id, RamCapacity, Quantity, StorageCapacity, Year;
  Double? Price, Screen_size, Discount;
  String? Brand,
      Model,
      Color,
      Processor,
      CameraResolution,
      OS,
      AvailabilityState,
      Description;
  Uint32List? Image, Video;
  bool? Favorite, Cart;

  ProductModel(
      {this.Id,
      this.Brand,
      this.Model,
      this.StorageCapacity,
      this.Color,
      this.Price,
      this.Screen_size,
      this.RamCapacity,
      this.Processor,
      this.CameraResolution,
      this.OS,
      this.AvailabilityState,
      this.Favorite,
      this.Cart,
      this.Description,
      this.Image,
      this.Video,
      this.Quantity,
      this.Discount});

  ProductModel.fromJson(Map mp) {
    log(mp.toString());
    Id = mp['ID'];
    Brand = mp['Brand'];
    Model = mp['Model'];
    StorageCapacity = mp['StorageCapacity'];
    Color = mp['Color'];
    Price = mp['Price'];
    Screen_size = mp['Screen_size'];
    RamCapacity = mp['RamCapacity'];
    Processor = mp['Processor'];
    CameraResolution = mp['CameraResolution'];
    OS = mp['OS'];
    AvailabilityState = mp['AvailabilityState'];
    Favorite = mp['Favorite'];
    Cart = mp['Cart'];
    Description = mp['Description'];
    Image = mp['Image'];
    Video = mp['Video'];
    Quantity = mp['Quantity'];
    Discount = mp['Discount'];
    Year = mp['Year'];
  }
}
