import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:telemed/test/bottomsheet_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bottom Sheet Example")),
      body: Center(
        child: ElevatedButton(
          onPressed: () => showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            backgroundColor: Colors.transparent,
            builder: (_) => DraggableScrollableSheet(
              expand: false,
              initialChildSize: 0.9,
              minChildSize: 0.5,
              maxChildSize: 0.95,
              builder: (_, controller) =>
                  BottomSheetContent(scrollController: controller),
            ),
          ),
          child: Text("Open Bottom Sheet"),
        ),
      ),
    );
  }
}

class BottomSheetContent extends StatelessWidget {
  final ScrollController scrollController;
  BottomSheetContent({super.key, required this.scrollController});

  final controller = Get.put(BottomSheetController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: PageView.builder(
        controller: controller.pageController,
        physics: NeverScrollableScrollPhysics(),
        itemCount: 3,
        itemBuilder: (context, index) {
          switch (index) {
            case 0:
              return _form1();
            case 1:
              return _form2();
            case 2:
              return _form3(context);
            default:
              return Container();
          }
        },
      ),
    );
  }

  Widget _form1() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Select Items"),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Column(
                children: List.generate(8, (index) {
                  return Card(child: Center(child: Text("Item ${index + 1}")));
                }),
              ),
            ),
          ),
          TextField(
            maxLines: 5,
            decoration: InputDecoration(labelText: "Description"),
            onChanged: (val) => controller.description.value = val,
          ),
          ElevatedButton(onPressed: controller.nextPage, child: Text("Next"))
        ],
      ),
    );
  }

  Widget _form2() {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();
    final scheduleCtrl = TextEditingController();

    // This will hold the dynamic list of TextEditingController pairs for the forms
    RxList<Map<String, TextEditingController>> dynamicForms = <Map<String, TextEditingController>>[].obs;

    // Initially, adding one pre-existing form to the list
    dynamicForms.add({
      'name': TextEditingController(),
      'desc': TextEditingController(),
      'schedule': TextEditingController(),
    });

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Add a new set of text fields when pressed
          ElevatedButton(
            onPressed: () {
              dynamicForms.add({
                'name': TextEditingController(),
                'desc': TextEditingController(),
                'schedule': TextEditingController(),
              });
            },
            child: Text("Add More"),
          ),

          // Display dynamically generated forms in a scrollable view
          Expanded(
            child: SingleChildScrollView(
              controller: scrollController,
              child: Obx(() => Column(
                children: List.generate(dynamicForms.length, (index) {
                  var form = dynamicForms[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name TextField
                        TextField(
                          controller: form['name'],
                          decoration: InputDecoration(labelText: "Medicine Name ${index + 1}"),
                        ),
                        // Description TextField
                        TextField(
                          controller: form['desc'],
                          decoration: InputDecoration(labelText: "Medicine Description ${index + 1}"),
                        ),
                        // Schedule TextField
                        TextField(
                          controller: form['schedule'],
                          decoration: InputDecoration(labelText: "Schedule ${index + 1}"),
                        ),
                        // Delete button for this form (deletes the first form if more than one exists)
                        if (dynamicForms.length > 1)
                          IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () {
                              dynamicForms.removeAt(index);
                            },
                          ),
                      ],
                    ),
                  );
                }),
              )),
            ),
          ),

          // A "Next" button to go to the next page (this button will stay at the bottom)
          ElevatedButton(onPressed: controller.nextPage, child: Text("Next"))
        ],
      ),
    );
  }



  Widget _form3(BuildContext context) {
    final nameCtrl = TextEditingController();
    final descCtrl = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(controller: nameCtrl, decoration: InputDecoration(labelText: "Lab Test Name")),
          TextField(controller: descCtrl, decoration: InputDecoration(labelText: "Lab Test Description")),
          ElevatedButton(
            onPressed: () => controller.addLabTest(nameCtrl.text, descCtrl.text),
            child: Text("Add More"),
          ),
          Obx(() => Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: controller.labTests.length,
              itemBuilder: (_, i) => ListTile(
                title: Text(controller.labTests[i]['name'] ?? ''),
                subtitle: Text(controller.labTests[i]['desc'] ?? ''),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => controller.removeLabTest(i),
                ),
              ),
            ),
          )),
          ElevatedButton(onPressed: (){
            controller.currentPage.value = 0;
            Get.back();
            Get.to( ()=> const NextScreen());
            }, child: Text("Submit"))
        ],
      ),
    );
  }
}

class NextScreen extends StatelessWidget {
  const NextScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(title: Text("Next Screen")),
      body: Center(child: Text("Submission Complete!")));
}

//
// var jsonData = pm.response.json();
// pm.environment.set("access_token", jsonData.access_token);
