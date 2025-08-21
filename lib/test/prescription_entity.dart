class PrescriptionEntity {
  final String id;
  final String patientName;
  final String age;
  final String gender;
  final String doctorName;
  final String regNo;
  final String date;
  final List<String> complaints;
  final List<String> findings;
  final List<String> tests;
  final List<Map<String, String>> medicines; // {name, dosage, duration}
  final List<String> advice;

  PrescriptionEntity({
    required this.id,
    required this.patientName,
    required this.age,
    required this.gender,
    required this.doctorName,
    required this.regNo,
    required this.date,
    required this.complaints,
    required this.findings,
    required this.tests,
    required this.medicines,
    required this.advice,
  });
}