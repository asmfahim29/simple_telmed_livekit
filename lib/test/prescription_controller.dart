import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class PrescriptionController extends GetxController {
  final GetPrescriptionListUseCase _getPrescriptionListUseCase;

  PrescriptionController(this._getPrescriptionListUseCase);

  final sessionManager = getIt<SecureSessionManager>();

  RxString token = ''.obs;
  RxString doctorName = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    token.value = await sessionManager.token ?? '';
    getPrescriptionList();
  }


  RxList<DoctorEntity> scheduledDoctorList = <DoctorEntity>[].obs;
  RxBool isPrescriptionListLoaded = false.obs;
  Future<void> getPrescriptionList() async {
    try {
      isPrescriptionListLoaded.value = true;
      final response = await _getPrescriptionListUseCase.execute();

      if (response.state == DataState.success){
        scheduledDoctorList.value = response.data ?? [];
      }
      debugPrint("schedule list response: ${response.data?.length}");
    } catch(e) {
      debugPrint("schedule list error: $e");
    } finally {
      isPrescriptionListLoaded.value = false;
    }
  }

  // Filter doctors by status
  void filterDoctorsByStatus(String status) {
    scheduledDoctorList.value = scheduledDoctorList.where((doctor) => doctor.status == status).toList();
  }

// Filter doctors by "completed" status and update the scheduledDoctorList directly
  void getCompleteDoctors() {
    filterDoctorsByStatus("completed");
  }


  // static data
  RxList<PrescriptionEntity> prescriptions = <PrescriptionEntity>[].obs;
  final selectedPrescription = Rxn<PrescriptionEntity>();
  void getDoctorIdWisePrescriptions() {
    prescriptions.value = [
      PrescriptionEntity(
        id: "001",
        patientName: "Aminur Rahman",
        age: "23 Years",
        gender: "Male",
        doctorName: "Dr. Rauf Rahman",
        regNo: "A45738",
        date: "16-06-2022",
        complaints: ["Abdominal pain", "Stinging sensation during urination"],
        findings: ["Height: 170 cm", "Weight: 70 kg", "BP: 120/80"],
        tests: ["Urine C/S and RME"],
        medicines: [
          {"name": "Vancomycin", "dosage": "40 mg 1+0+1", "duration": "14 days"},
          {"name": "Spasm-in", "dosage": "10 mg 1+0+1", "duration": "10 days"},
          {"name": "Spasm-in", "dosage": "10 mg 1+0+1", "duration": "10 days"},
          {"name": "Spasm-in", "dosage": "10 mg 1+0+1", "duration": "10 days"},
          {"name": "Spasm-in", "dosage": "10 mg 1+0+1", "duration": "10 days"},
          {"name": "Spasm-in", "dosage": "10 mg 1+0+1", "duration": "10 days"},
        ],
        advice: ["Follow up after 14 days"],
      ),
    ];
  }

  final ScreenshotController screenshotController = ScreenshotController();
  RxBool isDownloading = false.obs;
  // Method to generate PDF from widget
  Future<void> captureAndSavePdf(BuildContext context) async {
    isDownloading.value = true;
    Uint8List? image = await screenshotController.capture();

    if (image != null) {
      // Create PDF
      final pdf = pw.Document();
      // pdf.addPage(
      //   pw.Page(
      //     pageFormat: PdfPageFormat.a4,
      //     build: (pw.Context context) =>
      //         pw.Center(
      //           child: pw.Image(pw.MemoryImage(image), fit: pw.BoxFit.fitWidth),
      //         )
      //   ),
      // );

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return [
              pw.Container(
                alignment: pw.Alignment.topCenter, // Start from top
                child: pw.Image(
                  pw.MemoryImage(image),
                  fit: pw.BoxFit.fitWidth, // Fit to A4 width
                ),
              )
            ];
          },
        ),
      );
      // Direct Downloads folder path (works on most Android devices)
      final downloadsDir = Directory('/storage/emulated/0/Download');
      final file = File(
        "${downloadsDir.path}/Prescription_${DateTime
            .now()
            .millisecondsSinceEpoch}.pdf",
      );

      await file.writeAsBytes(await pdf.save());

      isDownloading.value = false;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("PDF saved: ${file.path}")),
      );
    }
  }

}
