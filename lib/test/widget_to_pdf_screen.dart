
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';


class PrescriptionViewScreen extends StatelessWidget {

  PrescriptionViewScreen({super.key});

  final controller = Get.find<PrescriptionController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(
        title: "prescription_test".tr,
        actions: [
          Obx((){
            return controller.isDownloading.value
                ? Padding(
              padding: Dimensions.padding(right: 16),
              child: SizedBox(
                  height: Dimensions.height(25),
                  width: Dimensions.width(25),
                  child: const Center(child: CircularProgressIndicator())),
            )
                : IconButton(
              onPressed: () {
                controller.captureAndSavePdf(context);
              },
              icon: const Icon(Icons.download_for_offline, color: Colors.green,),
            );
          }),
        ],
      ),
      body: Obx(() {
        final p = controller.selectedPrescription.value;

        if (p == null) return const Center(child: Text("No prescription selected"));

        // final data = p ?? demoData;

        return SingleChildScrollView(
          child: Container(
            margin: Dimensions.allPadding(16),
            padding: Dimensions.allPadding(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(Dimensions.radius(8)),
            ),
            child: Screenshot(
              controller: controller.screenshotController,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Header Section
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Column
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ClicknCare : Telemedicine Program',
                              style: TextStyle(
                                fontSize: Dimensions.font(12),
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: Dimensions.height(2),),
                            Text(
                              'Online Prescription - No : 01813333',
                              style: TextStyle(
                                fontSize: Dimensions.font(12),
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            SizedBox(height: Dimensions.height(2),),
                            Text(
                              p.doctorName,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            Text(
                              'BMDC Reg. No : ${p.regNo}',
                              style: TextStyle(fontSize: Dimensions.font(10), color: Colors.black54),
                            ),
                            Text(
                              'MBBS, MPH',
                              style: TextStyle(fontSize: Dimensions.font(10), color: Colors.black54),
                            ),
                          ],
                        ),
                      ),
                      // Right Column
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            // Doctor Avatar
                            CircleAvatar(
                              radius: Dimensions.radius(40),
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(
                                AssetsPath.appLogoName,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),

                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black87, width: 1),
                        bottom: BorderSide(color: Colors.black87, width: 1),
                      ),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
                    child: Row(
                      children: [
                        Expanded(
                          child: RichText(
                            text: TextSpan(
                              style: TextStyle(fontSize: Dimensions.font(12), color: Colors.black87),
                              children: [
                                TextSpan(text: "Name : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.font(12))),
                                TextSpan(text: p.patientName),
                                TextSpan(text: " Age : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.font(12))),
                                TextSpan(text: p.age),
                                TextSpan(text: " Gender : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.font(12))),
                                TextSpan(text: p.gender),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            RichText(
                              text: TextSpan(
                                style: TextStyle(fontSize: Dimensions.font(12), color: Colors.black87),
                                children: [
                                  TextSpan(text: "Patient Id : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.font(12))),
                                  TextSpan(text: "1103029", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.font(12))),
                                ],
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                style: TextStyle(fontSize: Dimensions.font(12), color: Colors.black87),
                                children: [
                                  TextSpan(text: "Date : ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.font(12))),
                                  TextSpan(text: "16-06-2025", style: TextStyle(fontWeight: FontWeight.bold, fontSize: Dimensions.font(12))),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ],
                    ),
                  ),
                  Table(
                    border: const TableBorder(
                      verticalInside: BorderSide(color: Colors.black87, width: 1),
                    ),
                    columnWidths: const {
                      0: FlexColumnWidth(1.0),
                      1: FlexColumnWidth(1.0),
                    },
                    children: [
                      TableRow(
                        children: [
                          Padding(
                            padding: Dimensions.allPadding(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Chief Complaints :", style: TextStyle(fontSize: Dimensions.font(10), fontWeight: FontWeight.bold)),
                                SizedBox(height: 4),
                                ...p.complaints.map((c) => Text("- $c", style: TextStyle(fontSize: Dimensions.font(10)))),
                                SizedBox(height: 8),
                                Text("Physical Findings :", style: TextStyle(fontSize: Dimensions.font(10), fontWeight: FontWeight.bold)),
                                SizedBox(height: Dimensions.height(4)),
                                ...p.findings.map((f) => Text(f, style: TextStyle(fontSize: Dimensions.font(10)))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: Dimensions.allPadding(8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Rx", style: TextStyle(fontSize: Dimensions.font(13), fontWeight: FontWeight.bold)),
                                ...p.medicines.asMap().entries.map((entry) {
                                  final i = entry.key + 1;
                                  final m = entry.value;
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 4),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("$i. ${m['name']}", style: TextStyle(fontSize: Dimensions.font(10), fontWeight: FontWeight.bold)),
                                        Text("${m['dosage']}", style: TextStyle(fontSize: Dimensions.font(10))),
                                        Text("${m['duration']}", style: TextStyle(fontSize: Dimensions.font(10))),
                                      ],
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ],
                      ),

                      // TableRow(
                      //   children: [
                      //     Padding(
                      //       padding: const EdgeInsets.all(8),
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           const Text("Required Test :", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                      //           const SizedBox(height: 4),
                      //           ...p.tests.map((t) => Text("- $t", style: const TextStyle(fontSize: 10))),
                      //         ],
                      //       ),
                      //     ),
                      //     Padding(
                      //       padding: const EdgeInsets.all(8),
                      //       child: Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           const Text("Advice :", style: TextStyle(fontSize: 11, fontWeight: FontWeight.bold)),
                      //           const SizedBox(height: 4),
                      //           ...p.advice.map((a) => Text("- $a", style: const TextStyle(fontSize: 10))),
                      //         ],
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black87, width: 1),
                        bottom: BorderSide(color: Colors.black87, width: 1),
                      ),
                    ),
                    padding: Dimensions.symetricPadding(vertical: 6, horizontal: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Required Test (Left side)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Required Test :",
                                style: TextStyle(fontSize: Dimensions.font(10), fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: Dimensions.height(4)),
                              ...p.tests.mapIndexed((index, t) =>
                                  Text("${index + 1}. $t",
                                      style: TextStyle(fontSize: Dimensions.font(10))
                                  )
                              ),
                            ],
                          ),
                        ),

                        // Advice (Right side)
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Advice :",
                                style: TextStyle(fontSize: Dimensions.font(10), fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: Dimensions.height(4)),
                              ...p.advice.mapIndexed((index, a) =>
                                  Text("${index + 1}. $a",
                                      style: TextStyle(fontSize: Dimensions.font(10))
                                  )
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> mapIndexed<T>(T Function(int index, E element) f) {
    var index = 0;
    return map((element) => f(index++, element));
  }
}

/*
*
* import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PrescriptionViewScreen extends StatefulWidget {
  const PrescriptionViewScreen({Key? key}) : super(key: key);

  @override
  State<PrescriptionViewScreen> createState() => _PrescriptionViewScreen();
}

class _PrescriptionViewScreen extends State<PrescriptionViewScreen> {
  // Controllers for form fields
  final doctorNameController = TextEditingController(text: "Dr. Rauf Rahman");
  final regNoController = TextEditingController(text: "A45738");
  final patientNameController = TextEditingController(text: "Aminur Rahman");
  final ageController = TextEditingController(text: "23 Years");
  final genderController = TextEditingController(text: "Male");
  final patientIdController = TextEditingController(text: "1103029");
  final dateController = TextEditingController(text: "16-06-2025");
  final complaintsController = TextEditingController(text: "Abdominal pain\nStinging sensation during urination");
  final findingsController = TextEditingController(text: "Height: 170 cm\nWeight: 70 kg\nBP: 120/80");

  // Lists for dynamic content
  List<Map<String, String>> medicines = [
    {'name': 'Vancomycin', 'dosage': '40 mg 1+0+1', 'duration': '14 days'},
    {'name': 'Spasm-in', 'dosage': '10 mg 1+0+1', 'duration': '10 days'},
    {'name': 'Spasm-in', 'dosage': '10 mg 1+0+1', 'duration': '10 days'},
    {'name': 'Spasm-in', 'dosage': '10 mg 1+0+1', 'duration': '10 days'},
  ];

  List<String> tests = ['Urine C/S and RME'];
  List<String> advice = ['Follow up after 14 days'];

  bool isDownloading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prescription Generator'),
        backgroundColor: Colors.blue[600],
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Doctor Information Section
            _buildSectionTitle("Doctor Information"),
            _buildTextField("Doctor Name", doctorNameController),
            _buildTextField("BMDC Registration No", regNoController),

            const SizedBox(height: 20),

            // Patient Information Section
            _buildSectionTitle("Patient Information"),
            Row(
              children: [
                Expanded(child: _buildTextField("Patient Name", patientNameController)),
                const SizedBox(width: 10),
                Expanded(child: _buildTextField("Age", ageController)),
              ],
            ),
            Row(
              children: [
                Expanded(child: _buildTextField("Gender", genderController)),
                const SizedBox(width: 10),
                Expanded(child: _buildTextField("Patient ID", patientIdController)),
              ],
            ),
            _buildTextField("Date", dateController),

            const SizedBox(height: 20),

            // Clinical Information Section
            _buildSectionTitle("Clinical Information"),
            _buildTextArea("Chief Complaints", complaintsController, "Enter complaints, one per line"),
            _buildTextArea("Physical Findings", findingsController, "Enter findings, one per line"),

            const SizedBox(height: 20),

            // Medicines Section
            _buildSectionTitle("Medicines"),
            ...medicines.asMap().entries.map((entry) => _buildMedicineCard(entry.key)),
            ElevatedButton.icon(
              onPressed: _addMedicine,
              icon: const Icon(Icons.add),
              label: const Text("Add Medicine"),
            ),

            const SizedBox(height: 20),

            // Tests Section
            _buildSectionTitle("Required Tests"),
            ...tests.asMap().entries.map((entry) => _buildTestCard(entry.key)),
            ElevatedButton.icon(
              onPressed: _addTest,
              icon: const Icon(Icons.add),
              label: const Text("Add Test"),
            ),

            const SizedBox(height: 20),

            // Advice Section
            _buildSectionTitle("Advice"),
            ...advice.asMap().entries.map((entry) => _buildAdviceCard(entry.key)),
            ElevatedButton.icon(
              onPressed: _addAdvice,
              icon: const Icon(Icons.add),
              label: const Text("Add Advice"),
            ),

            const SizedBox(height: 30),

            // Generate PDF Button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: isDownloading ? null : _generatePDF,
                icon: isDownloading
                    ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.picture_as_pdf),
                label: Text(isDownloading ? "Generating PDF..." : "Generate PDF"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[600],
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
    );
  }

  Widget _buildTextArea(String label, TextEditingController controller, String hint) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        controller: controller,
        maxLines: 3,
        decoration: InputDecoration(
          labelText: label,
          hintText: hint,
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
      ),
    );
  }

  Widget _buildMedicineCard(int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextFormField(
                    initialValue: medicines[index]['name'],
                    decoration: const InputDecoration(
                      labelText: "Medicine Name",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    onChanged: (value) => medicines[index]['name'] = value,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    initialValue: medicines[index]['dosage'],
                    decoration: const InputDecoration(
                      labelText: "Dosage",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    onChanged: (value) => medicines[index]['dosage'] = value,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: TextFormField(
                    initialValue: medicines[index]['duration'],
                    decoration: const InputDecoration(
                      labelText: "Duration",
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    ),
                    onChanged: (value) => medicines[index]['duration'] = value,
                  ),
                ),
                IconButton(
                  onPressed: () => _removeMedicine(index),
                  icon: const Icon(Icons.delete, color: Colors.red),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTestCard(int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: tests[index],
                decoration: const InputDecoration(
                  labelText: "Test Name",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                ),
                onChanged: (value) => tests[index] = value,
              ),
            ),
            IconButton(
              onPressed: () => _removeTest(index),
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAdviceCard(int index) {
    return Card(
      margin: const EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Expanded(
              child: TextFormField(
                initialValue: advice[index],
                decoration: const InputDecoration(
                  labelText: "Advice",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                ),
                onChanged: (value) => advice[index] = value,
              ),
            ),
            IconButton(
              onPressed: () => _removeAdvice(index),
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
          ],
        ),
      ),
    );
  }

  void _addMedicine() {
    setState(() {
      medicines.add({'name': '', 'dosage': '', 'duration': ''});
    });
  }

  void _removeMedicine(int index) {
    setState(() {
      medicines.removeAt(index);
    });
  }

  void _addTest() {
    setState(() {
      tests.add('');
    });
  }

  void _removeTest(int index) {
    setState(() {
      tests.removeAt(index);
    });
  }

  void _addAdvice() {
    setState(() {
      advice.add('');
    });
  }

  void _removeAdvice(int index) {
    setState(() {
      advice.removeAt(index);
    });
  }

  Future<void> _generatePDF() async {
    setState(() {
      isDownloading = true;
    });

    final pdf = pw.Document();

    // Get data from form
    final complaints = complaintsController.text.split('\n').where((c) => c.trim().isNotEmpty).toList();
    final findings = findingsController.text.split('\n').where((f) => f.trim().isNotEmpty).toList();
    final validMedicines = medicines.where((m) => m['name']!.trim().isNotEmpty).toList();
    final validTests = tests.where((t) => t.trim().isNotEmpty).toList();
    final validAdvice = advice.where((a) => a.trim().isNotEmpty).toList();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(16),
        build: (context) {
          return [
            // Header
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text("ClicknCare : Telemedicine Program",
                        style: pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold)),
                    pw.Text("Online Prescription - No : 01813333",
                        style: pw.TextStyle(fontSize: 12)),
                    pw.SizedBox(height: 4),
                    pw.Text(doctorNameController.text,
                        style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                    pw.Text("BMDC Reg. No : ${regNoController.text}",
                        style: pw.TextStyle(fontSize: 10, color: PdfColors.grey)),
                    pw.Text("MBBS, MPH",
                        style: pw.TextStyle(fontSize: 10, color: PdfColors.grey)),
                  ],
                ),
                pw.Container(
                  width: 80,
                  height: 40,
                  child: pw.Text("Click & Care",
                      style: pw.TextStyle(color: PdfColors.blue, fontSize: 14, fontWeight: pw.FontWeight.bold)),
                ),
              ],
            ),
            pw.Divider(),

            // Patient Info
            pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Expanded(
                  child: pw.Text("Name : ${patientNameController.text}  Age : ${ageController.text}  Gender : ${genderController.text}",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                ),
                pw.Expanded(
                  child: pw.Text("Patient Id : ${patientIdController.text}  Date : ${dateController.text}",
                      style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                      textAlign: pw.TextAlign.right),
                ),
              ],
            ),
            pw.Divider(),

            // Main Table with vertical divider
            pw.Table(
              border: pw.TableBorder(
                verticalInside: pw.BorderSide(color: PdfColors.black, width: 1),
              ),
              columnWidths: {
                0: const pw.FlexColumnWidth(1),
                1: const pw.FlexColumnWidth(1),
              },
              children: [
                pw.TableRow(
                  children: [
                    // Left column - Chief Complaints and Physical Findings
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(right: 8),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("Chief Complaints :", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          ...complaints.map((c) => pw.Padding(
                            padding: const pw.EdgeInsets.only(bottom: 2),
                            child: pw.Text("- $c"),
                          )),
                          pw.SizedBox(height: 6),
                          pw.Text("Physical Findings :", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          ...findings.map((f) => pw.Padding(
                            padding: const pw.EdgeInsets.only(bottom: 2),
                            child: pw.Text(f),
                          )),
                        ],
                      ),
                    ),

                    // Right column - Rx (Medicines)
                    pw.Padding(
                      padding: const pw.EdgeInsets.only(left: 8),
                      child: pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text("Rx", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                          pw.SizedBox(height: 4),
                          ...validMedicines.asMap().entries.map((entry) {
                            final i = entry.key + 1;
                            final m = entry.value;
                            return pw.Column(
                              crossAxisAlignment: pw.CrossAxisAlignment.start,
                              children: [
                                pw.Text("$i. ${m['name']}", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                                pw.Text("${m['dosage']}"),
                                pw.Text("${m['duration']}"),
                                pw.SizedBox(height: 4),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            pw.Divider(),

            // Bottom Row
            pw.Row(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Required Test :", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ...validTests.asMap().entries.map((e) => pw.Text("${e.key + 1}. ${e.value}")),
                    ],
                  ),
                ),
                pw.Expanded(
                  child: pw.Column(
                    crossAxisAlignment: pw.CrossAxisAlignment.start,
                    children: [
                      pw.Text("Advice :", style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
                      ...validAdvice.asMap().entries.map((e) => pw.Text("${e.key + 1}. ${e.value}")),
                    ],
                  ),
                ),
              ],
            ),
            pw.Divider(),
          ];
        },
      ),
    );

    try {
      final downloadsDir = Directory('/storage/emulated/0/Download');
      final fileName = "prescription_${patientNameController.text.replaceAll(' ', '_')}_${DateTime.now().millisecondsSinceEpoch}.pdf";
      final file = File("${downloadsDir.path}/$fileName");
      await file.writeAsBytes(await pdf.save());

      setState(() {
        isDownloading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("PDF saved: ${file.path}"),
            backgroundColor: Colors.green,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    } catch (e) {
      setState(() {
        isDownloading = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Failed to save PDF: ${e.toString()}"),
            backgroundColor: Colors.red,
            duration: const Duration(seconds: 3),
          ),
        );
      }
    }
  }

  @override
  void dispose() {
    doctorNameController.dispose();
    regNoController.dispose();
    patientNameController.dispose();
    ageController.dispose();
    genderController.dispose();
    patientIdController.dispose();
    dateController.dispose();
    complaintsController.dispose();
    findingsController.dispose();
    super.dispose();
  }
}
*
* */
