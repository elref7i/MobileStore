// import 'package:flutter/material.dart';
// import 'package:mobile_app/dashboard/modules/users/model/Entity_model/Product_model.dart';

// import '../../../../../Database/repo/local_db_data.dart';

// class AddProductPage extends StatefulWidget {
//   @override
//   _AddProductPageState createState() => _AddProductPageState();
// }

// class _AddProductPageState extends State<AddProductPage> {
//   final _formKey = GlobalKey<FormState>();
//   String _brand = '';
//   String _model = '';
//   int _storageCapacity = 0;
//   String _color = '';
//   int _price = 0;
//   double _screenSize = 0.0;
//   int _ramCapacity = 0;
//   String _processor = '';
//   String _cameraResolution = '';
//   String _os = '';
//   int _year = 0;
//   String _image = '';
//   int _quantity = 0;
//   int _availabilityState = 1;
//   int _discount = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Add New Product'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               _buildTextField('Brand', (value) => _brand = value),
//               _buildTextField('Model', (value) => _model = value),
//               _buildTextField('Storage Capacity', (value) => _storageCapacity = int.tryParse(value) ?? 0, isNumber: true),
//               _buildTextField('Color', (value) => _color = value),
//               _buildTextField('Price', (value) => _price = int.tryParse(value) ?? 0, isNumber: true),
//               _buildTextField('Screen Size', (value) => _screenSize = double.tryParse(value) ?? 0.0, isNumber: true),
//               _buildTextField('RAM Capacity', (value) => _ramCapacity = int.tryParse(value) ?? 0, isNumber: true),
//               _buildTextField('Processor', (value) => _processor = value),
//               _buildTextField('Camera Resolution', (value) => _cameraResolution = value),
//               _buildTextField('OS', (value) => _os = value),
//               _buildTextField('Year', (value) => _year = int.tryParse(value) ?? 0, isNumber: true),
//               _buildTextField('Image URL', (value) => _image = value),
//               _buildTextField('Quantity', (value) => _quantity = int.tryParse(value) ?? 0, isNumber: true),
//               _buildTextField('Discount', (value) => _discount = int.tryParse(value) ?? 0, isNumber: true),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _saveProduct,
//                 child: Text('Save Product'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(String label, Function(String) onSave, {bool isNumber = false}) {
//     return TextFormField(
//       decoration: InputDecoration(labelText: label),
//       keyboardType: isNumber ? TextInputType.number : TextInputType.text,
//       onSaved: (value) => onSave(value ?? ''),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return 'Please enter $label';
//         }
//         return null;
//       },
//     );
//   }

//   void _saveProduct() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       _formKey.currentState?.save();
//       ProductModel newProduct = ProductModel(
//         brand: _brand,
//         model: _model,
//         storageCapacity: _storageCapacity,
//         color: _color,
//         price: _price,
//         screenSize: _screenSize,
//         ramCapacity: _ramCapacity,
//         processor: _processor,
//         cameraResolution: _cameraResolution,
//         os: _os,
//         year: _year,
//         image: _image,
//         quantity: _quantity,
//         availabilityState: _availabilityState,
//         discount: _discount,
//         favorite: 0,
//         cart: 0,
//       );

//       DatabaseRepo dbRepo = DatabaseRepo();
//       await dbRepo.insertProduct(
//         storageCapacity: newProduct.storageCapacity,
//         price: newProduct.price,
//         ramCapacity: newProduct.ramCapacity,
//         year: newProduct.year,
//         quantity: newProduct.quantity,
//         availabilityState: newProduct.availabilityState,
//         brand: newProduct.brand,
//         model: newProduct.model,
//         color: newProduct.color,
//         processor: newProduct.processor,
//         cameraResolution: newProduct.cameraResolution,
//         os: newProduct.os,
//         image: newProduct.image,
//         screenSize: newProduct.screenSize,
//         discount: newProduct.discount,
//       );
//       Navigator.pop(context, newProduct);
//     }
//   }
// }
