// import 'dart:js';
import 'package:check_list_app/components/avatar.dart';
import 'package:check_list_app/components/styles.dart';
import 'package:check_list_app/main.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'custom_rect_tween.dart';
import 'hero_dialog_route.dart';
import 'package:check_list_app/utils/constants.dart';
// class AddButton extends StatelessWidget {
//   const AddButton({Key? key}) : super(key: key);

// }

class AddButton extends StatefulWidget {
  const AddButton({super.key});

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(HeroDialogRoute(builder: (context) {
            return AddToDoPopUpCard();
          }));
        },
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: Material(
            color: AppColors.accentColor,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(32)),
            child: const Icon(
              Icons.add_rounded,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ),
    );
  }
}

const String _heroAddTodo = 'add-todo-hero';

// class _AddTodoPopupCard extends StatelessWidget {
//   _AddTodoPopupCard({Key? key}) : super(key: key);

// }

class AddToDoPopUpCard extends StatefulWidget {
  const AddToDoPopUpCard({super.key});

  @override
  State<AddToDoPopUpCard> createState() => _AddToDoPopUpCardState();
}

class _AddToDoPopUpCardState extends State<AddToDoPopUpCard> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _shopNameController = TextEditingController();
  String? avatarURL;
  var _loading = false;
  Future<void> onUpload(String imageURL) async {
    try {
      await supabase.from('Product').upsert(
        {'product_image': imageURL},
      );
      if (mounted) {
        context.showSnackBar(message: 'Updated your profile image!');
      }
    } on PostgrestException catch (error) {
      context.showErrorSnackBar(message: error.message);
    } catch (error) {
      context.showErrorSnackBar(message: 'Unexpected error has occurred');
    }
    if (!mounted) {
      return;
    }
    setState(() {
      avatarURL = imageURL;
    });
  }

  void _addProduct(BuildContext context) async {
    await supabase.from('Product').insert(
      {
        'name': _nameController.text,
        'price': _priceController.text,
        'shop_name': _shopNameController.text,
        'updated_at': DateTime.now().toLocal().toString()
      },
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Hero(
          tag: _heroAddTodo,
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin!, end: end!);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Avatar(imageUrl: avatarURL, onUpload: onUpload),
                    TextField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        hintText: 'Product Name',
                        border: InputBorder.none,
                        fillColor: Color.fromARGB(255, 240, 240, 240),
                        filled: true,
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextField(
                      controller: _priceController,
                      decoration: InputDecoration(
                        hintText: 'Price',
                        border: InputBorder.none,
                        fillColor: Color.fromARGB(255, 240, 240, 240),
                        filled: true,
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    TextField(
                      controller: _shopNameController,
                      decoration: InputDecoration(
                        hintText: 'Shop Name',
                        border: InputBorder.none,
                        fillColor: Color.fromARGB(255, 240, 240, 240),
                        filled: true,
                      ),
                    ),
                    const Divider(
                      color: Colors.white,
                      thickness: 0.2,
                    ),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.accentColor,
                      ),
                      child: TextButton(
                        onPressed: () => _addProduct(context),
                        child: const Text(
                          'Add',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
