

const String whereByRoomLink = "https://whereby.com/adndiginet-telemed";

const String liveKitApiKey = "APIz4EgU4mSErzE";
const String liveKitApiSecret = "ACNfif9r0ftnRjVDFd9eoJ5nRpmTlAxRRzrVukEBbnYA";
const String liveKitWebUrl = "wss://adndiginet-telemed-ky8w3zs9.livekit.cloud";
const String liveKitROOMNAME = "ADNDIGINET-LIVEKIT-TEST";
const String liveKitTOKEN = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJBUEl6NEVnVTRtU0VyekUiLCJzdWIiOiIxMTAzMDI5Iiwicm9vbV9qb2luIjp0cnVlLCJyb29tIjoidGVsZW1lZF9yb29tXzAwMSIsImlhdCI6MTc1MjcyNDQ4OH0.ggTpjc69SU0NTywQh6ATLTolDkpta3iQY_KyCZwkjEY";
const String liveKitEnvironmentalVariables = "LIVEKIT_URL=wss://adndiginet-telemed-ky8w3zs9.livekit.cloudLIVEKIT_API_KEY=APIz4EgU4mSErzELIVEKIT_API_SECRET=ACNfif9r0ftnRjVDFd9eoJ5nRpmTlAxRRzrVukEBbnYA";

class Doctor {
  final String name;
  final String specialty;
  final String experience;
  final String location;
  final double rating;
  final List<String> keywords;

  Doctor({
    required this.name,
    required this.specialty,
    required this.experience,
    required this.location,
    required this.rating,
    required this.keywords,
  });
}

final List<Doctor> doctorsDatabase = [
  Doctor(
    name: "Prof. Dr. Quazi Deen Mohammad",
    specialty: "Neurology",
    experience: "30+ years",
    location: "National Institute of Neurosciences & Hospital (often consults privately in Dhaka)",
    rating: 4.9,
    keywords: ["brain", "nerve", "stroke", "epilepsy", "headache", "migraine", "neurological disorders"],
  ),
  Doctor(
    name: "Ashok Kumar Dutta",
    specialty: "Successful Businessman",
    experience: "25+ years",
    location: "BSRM ISPAT, DHANMONDI",
    rating: 4.8,
    keywords: ["businessman", "business", "owner"],
  ),
  // Doctor(
  //   name: "Prof. Dr. M. Nazrul Islam",
  //   specialty: "Cardiology",
  //   experience: "30+ years",
  //   location: "National Institute of Cardiovascular Diseases & Hospital (often consults privately in Dhaka)",
  //   rating: 4.8,
  //   keywords: ["heart disease", "angina", "heart attack", "cardiac intervention"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. Mahbub H Khan",
  //   specialty: "Gastroenterology",
  //   experience: "25+ years",
  //   location: "Bangladesh Institute of Health Sciences (often consults privately in Dhaka)",
  //   rating: 4.7,
  //   keywords: ["stomach pain", "digestive issues", "liver disease", "ulcer", "indigestion", "gastric"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. Md. Golam Sarwar",
  //   specialty: "Orthopedics",
  //   experience: "25+ years",
  //   location: "Medinova Medical Services Ltd. / Royal Multispeciality Hospital (Dhaka)",
  //   rating: 4.7,
  //   keywords: ["joint pain", "bone fracture", "back pain", "arthritis", "ligament injury", "orthopedic surgery"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. A. K. M. Musa",
  //   specialty: "Medicine & Chest Specialist",
  //   experience: "30+ years",
  //   location: "Popular Diagnostic Center Ltd. (Dhaka)",
  //   rating: 4.8,
  //   keywords: ["chest infection", "asthma", "lung disease", "cough", "breathing difficulty", "general medicine"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. Md. Azizul Islam",
  //   specialty: "Psychiatry",
  //   experience: "25+ years",
  //   location: "Square Hospital / Combined Military Hospital (Dhaka)",
  //   rating: 4.7,
  //   keywords: ["depression", "anxiety", "mood disorder", "stress", "mental health", "child psychiatry"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. Rashida Begum",
  //   specialty: "Obstetrics & Gynecology",
  //   experience: "30+ years",
  //   location: "Bangabandhu Sheikh Mujib Medical University (often consults privately in Dhaka)",
  //   rating: 4.9,
  //   keywords: ["pregnancy", "women's health", "menstrual issues", "pelvic pain", "infertility", "gynecological problems"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. Pran Gopal Datta",
  //   specialty: "ENT (Ear, Nose & Throat)",
  //   experience: "30+ years",
  //   location: "Bangabandhu Sheikh Mujib Medical University Hospital (often consults privately in Dhaka)",
  //   rating: 4.8,
  //   keywords: ["earache", "sore throat", "sinusitis", "hearing loss", "voice problems", "tonsillitis"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. Syed Md. Akram Hussain",
  //   specialty: "Oncology",
  //   experience: "25+ years",
  //   location: "Square Hospital (Dhaka)",
  //   rating: 4.7,
  //   keywords: ["cancer", "tumor", "chemotherapy", "radiotherapy", "oncology treatment"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. Md. Salahuddin Shah",
  //   specialty: "Hematology",
  //   experience: "25+ years",
  //   location: "Bangladesh Medical University / Lab One Hospital Limited (Dhaka)",
  //   rating: 4.8,
  //   keywords: ["blood disorder", "anemia", "thalassemia", "leukemia", "bone marrow transplant"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. Taimor Nawaz",
  //   specialty: "Infectious Disease",
  //   experience: "25+ years",
  //   location: "United Hospital (Dhaka)",
  //   rating: 4.9,
  //   keywords: ["fever", "infection", "virus", "bacteria", "contagious diseases", "tropical diseases"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. Md. Abdul Hayee",
  //   specialty: "Neurology (Interventional)",
  //   experience: "20+ years",
  //   location: "Bangabandhu Sheikh Mujib Medical University (often consults privately in Dhaka)",
  //   rating: 4.8,
  //   keywords: ["stroke intervention", "neuro-vascular disease", "brain imaging", "advanced neurology"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. Sheikh Nesaruddin Ahmed",
  //   specialty: "Rheumatology & Internal Medicine",
  //   experience: "20+ years",
  //   location: "Dhaka Medical College Hospital (often consults privately in Dhaka)",
  //   rating: 4.6,
  //   keywords: ["arthritis", "joint inflammation", "autoimmune disease", "rheumatoid arthritis", "lupus"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. Mohammad Aminul Islam",
  //   specialty: "Endocrinology",
  //   experience: "20+ years",
  //   location: "Longlife Diagnostic & Consultation Centre (Dhaka)",
  //   rating: 4.8,
  //   keywords: ["diabetes", "thyroid disorder", "hormone imbalance", "insulin", "metabolic disorders"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. Jahangir Kabir",
  //   specialty: "Urology",
  //   experience: "25+ years",
  //   location: "Labaid Specialized Hospital (Dhaka)",
  //   rating: 4.7,
  //   keywords: ["urinary tract infection", "kidney stone", "prostate issues", "bladder problems", "urological surgery"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. Ayesha Rahman",
  //   specialty: "Pediatrics",
  //   experience: "20+ years",
  //   location: "Children's Hospital (Dhaka) / Often consults privately",
  //   rating: 4.9,
  //   keywords: ["child health", "fever in children", "child development", "vaccination", "pediatric care"],
  // ),
  // Doctor(
  //   name: "Prof. Dr. Md. Farhad Hossain",
  //   specialty: "Ophthalmology",
  //   experience: "20+ years",
  //   location: "Universal Medical College Hospital (Dhaka) / Private Chambers",
  //   rating: 4.7,
  //   keywords: ["eye care", "vision problems", "cataract", "glaucoma", "retina issues", "eye surgery"],
  // ),
  // Doctor(
  //   name: "Dr. Maria Seraj",
  //   specialty: "Dermatology",
  //   experience: "15+ years",
  //   location: "Dhaka North City Corporation Hospital / Private Chambers",
  //   rating: 4.6,
  //   keywords: ["skin rash", "acne", "eczema", "psoriasis", "skin infection", "hair loss"],
  // ),
  // Doctor(
  //   name: "Dr. Nizam Uddin Ahmed Chowdhury",
  //   specialty: "Nephrology",
  //   experience: "15+ years",
  //   location: "Square Hospital (Dhaka)",
  //   rating: 4.5,
  //   keywords: ["kidney disease", "dialysis", "renal failure", "hypertension", "urinary issues related to kidney"],
  // ),
];


class Patient {
  final String name;
  final String meetingUrl;

  Patient({required this.name, required this.meetingUrl});
}

final List<Patient> patients = [
  Patient(name: "Mrs. C", meetingUrl: whereByRoomLink),
  Patient(name: "Mrs. D", meetingUrl: whereByRoomLink),
];

