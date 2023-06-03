# Flutter Product Management App

This Flutter app allows users to manage products by adding, editing, and deleting them from a local SQLite database. Each product consists of a name, price, and image. With this app, users can easily track and modify their product inventory.

## Features

- **Add Product**: Users can add a new product by entering its name, price, and selecting an image from their device's gallery.
- **Edit Product**: Users can edit the information of an existing product, including its name, price, and image.
- **Delete Product**: Users can delete a product from the database, removing it permanently.
- **View Product List**: Users can view a list of all the products, including their names, prices, and images.

## Installation

1. Make sure you have Flutter installed on your machine. If not, refer to the official Flutter documentation for installation instructions.

2. Clone this repository or download the source code.

```bash
git clone https://github.com/AhmedHamed-20/products_task
```

3. Navigate to the project directory.

```bash
cd products_task
```

4. Install the required dependencies.

```bash
flutter pub get
```

5. Run the app.

```bash
flutter run
```

Ensure that you have a compatible device connected or an emulator running to launch the app.

## Usage

1. Once the app is launched, you will be presented with the product list screen.

2. To add a new product, click the "+" button on the app bar. Fill in the required fields (name, price, and image) and click "add product" to add the product to the database.

3. To edit a product, tap on the desired product from the list. Update the information as needed and click "update product" to save the changes.

4. To delete a product, click on delete icon on product details screen.


## Dependencies

This app utilizes the following dependencies:


- dartz: it's a useful package to return two values from any function so we can use it on the error handler.
- equatable: for objects equality solution.
- file_picker: for image picker widget.
- flutter_screenutil: it's a useful package to make widgets and fonts adapt on different screen sizes.
- fluttertoast: to show some messages to user based on his interaction on the app.
- get_it: for dependency injection solution.
- mockito: for mocking firebase services used for unit testing.
- build_runner: to generate mockito mocking classes.
- provider: for state management solution.
- sqflite: for local database solution.
- path_provider: to get a path to store retrieved images from database 


These dependencies handle the local SQLite database, image selection from the device's gallery.
## Screenshots
<img src="https://github.com/AhmedHamed-20/products_task/assets/72945669/1f902ae8-7913-4850-aa99-32cad36e65ed" width="280"> <img src="https://github.com/AhmedHamed-20/products_task/assets/72945669/8531157f-cb48-4a9c-9b10-f8cf54d520a5" width="280"> <img src="https://github.com/AhmedHamed-20/products_task/assets/72945669/cbca0af1-8d97-4161-910c-efdfee815a74" width="280"> <img src="https://github.com/AhmedHamed-20/products_task/assets/72945669/6eb527e0-5ae8-4ec4-afbe-f457469f1a38" width="280">
