import 'package:flutter/material.dart';
import 'package:money_manager/db/models/category/category_model.dart';
import 'package:money_manager/screens/category/widgets/radio_button_widget.dart';

import '../../../db/functions/category/category_db.dart';

ValueNotifier<CategoryType> selectedCategoryNotifier = ValueNotifier(CategoryType.income);

Future<void> showCategoryAddPopup(BuildContext context) async {
  final categoryNameController = TextEditingController();
  showDialog(context: context, builder: (ctx){
    return SimpleDialog(
      title: const Text('Add Category'),
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: categoryNameController,
            decoration: const InputDecoration(
              hintText: 'Category Name',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(children: [
            RadioButton(title: 'Income',type: CategoryType.income,),
            RadioButton(title: 'Expense',type: CategoryType.expense,),
          ],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
              onPressed: (){
                if (categoryNameController.text == null || categoryNameController.text.isEmpty){
                  return;
                }
                final category = CategoryModel(
                    id: DateTime.now().millisecondsSinceEpoch.toString(),
                    name: categoryNameController.text,
                    type: selectedCategoryNotifier.value);

                CategoryDb().insertCategory(category);
                Navigator.of(ctx).pop();
              },
              child: const Text('Add')),
        ),
      ],
    );
  });
}

