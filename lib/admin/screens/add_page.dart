import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_smart_home_ui/provider/meal_data.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart' as syspath;
import 'package:path/path.dart' as path;
import 'package:provider/provider.dart';
import '../widgets/sub_page.dart';

// ignore: must_be_immutable
class AddScreen extends StatefulWidget {
  
  String cat;
  AddScreen(this.cat);

  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _titleController = TextEditingController();
  final _priceController = TextEditingController();
  final _descriptionController = TextEditingController();

  late String _vegNonVegValue;
  late String _fromTime;
  late String _tillTime;

  late File _selectedImage;

  void clearImage() {
    setState(() {
      _selectedImage;
    });
  }

  Future<void> getImage() async {
    final image = await ImagePicker()
        .getImage(source: ImageSource.camera, maxHeight: 600);
    if (image == null) {
      return;
    }
    setState(() {
      _selectedImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    //final routeAurgs =
      //  ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    //final category = routeAurgs['category'];
    final mealDataProvider = Provider.of<MealDesData>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Item'),
      ),
      // Add Button
      bottomNavigationBar: Container(
        margin: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        height: MediaQuery.of(context).size.height * 0.05,
        width: double.infinity,
        child: RaisedButton(
          color: Colors.purple,
          child: Text(
            'Add Item',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            // local validation
            if (_descriptionController == null ||
                _fromTime == null ||
                _priceController == null ||
                _selectedImage == null ||
                _tillTime == null ||
                _titleController == null ||
                _vegNonVegValue == null) {
              setState(() {
                _descriptionController.clear();
                _fromTime;
                _priceController.clear();
                _selectedImage;
                _tillTime;
                _titleController.clear();
                _vegNonVegValue;
              });
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    actions: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Text(
                              'Error',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              'Could not add the item. Please try again later.',
                              style: TextStyle(fontSize: 15),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              FlatButton(
                                child: Text(
                                  'Close',
                                  style: TextStyle(fontSize: 15),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  );
                },
              );
            } else {
              mealDataProvider.addItem(
                categorie: widget.cat,
                context: context,
                des: _descriptionController.text,
                ft: _fromTime,
                price: int.parse(_priceController.text),
                savedImage: _selectedImage,
                title: _titleController.text,
                tt: _tillTime,
              );
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: Form(
        child: Container(
          margin: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // title
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: TextFormField(
                        controller: _titleController,
                        decoration: InputDecoration(
                          hintText: 'Enter Title',
                          labelStyle: TextStyle(color: Colors.black),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                    // category
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.75,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: Center(
                        child: Text(widget.cat),
                      ),
                    ),
                  ],
                ),
                // Image Picker
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        clipBehavior: Clip.antiAlias,
                        height: MediaQuery.of(context).size.height * 0.25,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                          color: Colors.grey,
                        ),
                        child: _selectedImage == null
                            ? Center(
                                child: Text(
                                  'Select an Image!',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              )
                            : Image.file(
                                _selectedImage,
                                fit: BoxFit.cover,
                              ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.05,
                        width: MediaQuery.of(context).size.width * 0.3,
                        child: RaisedButton(
                          child: _selectedImage == null
                              ? Text(
                                  'Upoad an Image',
                                )
                              : Text('Clear'),
                          onPressed:
                              _selectedImage == null ? getImage : clearImage,
                        ),
                      )
                    ],
                  ),
                ),
                // Description
                Container(
                  margin: EdgeInsets.only(top: 20),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width,
                  child: TextFormField(
                    controller: _descriptionController,
                    maxLength: 100,
                    minLines: null,
                    maxLines: null,
                    expands: true,
                    decoration: InputDecoration(
                      hintText: 'Description',
                      labelText: 'Description',
                      labelStyle: TextStyle(color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Veg / Non-Veg
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: DropdownButton<String>(
                          autofocus: true,
                          value: _vegNonVegValue,
                          hint: Text('  Veg/Non-Veg'),
                          icon: Icon(Icons.arrow_drop_down_outlined),
                          onChanged: (newValue) {
                            setState(() {
                              _vegNonVegValue = newValue!;
                            });
                          },
                          items: <String>['  Veg', '  Non-Veg']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      // Set Price
                      Container(
                        height: MediaQuery.of(context).size.height * 0.07,
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: TextFormField(
                          keyboardType: TextInputType.number,
                          controller: _priceController,
                          decoration: InputDecoration(
                            hintText: 'Enter Price',
                            labelStyle: TextStyle(color: Colors.black),
                            enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0)),
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // From Time
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: FlatButton(
                          child: _fromTime == null
                              ? Text('Select starting time')
                              : Text('From: $_fromTime'),
                          onPressed: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              setState(() {
                                String selectedHour = value!.hour.toString();
                                String selectedMin = value.minute.toString();
                                _fromTime = selectedHour + ':' + selectedMin;
                                // print(_fromDate);
                              });
                            });
                          },
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.08,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: FlatButton(
                          child: _tillTime == null
                              ? Text('Select ending time')
                              : Text('Till: $_tillTime'),
                          onPressed: () {
                            showTimePicker(
                              context: context,
                              initialTime: TimeOfDay.now(),
                            ).then((value) {
                              setState(() {
                                String selectedHour = value!.hour.toString();
                                String selectedMin = value.minute.toString();
                                _tillTime = selectedHour + ':' + selectedMin;
                                // print(_fromDate);
                              });
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
