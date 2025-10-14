import 'package:flutter/material.dart';

class CourseModel {
  final int id;
  final IconData icon;
  final String title;
  final String mentorName;
  final String description;
  final Color color;

  CourseModel({
    required this.id,
    required this.icon,
    required this.title,
    required this.mentorName,
    required this.description,
    required this.color,
  });

  static List<CourseModel> dummyCourses = [
    CourseModel(
      id: 1,
      icon: Icons.brush,
      title: 'Belajar UI/UX dari Dasar',
      mentorName: 'Rina Hartati',
      description:
          'Pelajari prinsip dasar desain antarmuka dan pengalaman pengguna untuk aplikasi mobile dan web. Kamu akan mempelajari cara membuat desain yang intuitif, menarik, dan mudah digunakan, sehingga meningkatkan pengalaman pengguna.\n\nSelain itu, kursus ini juga membahas studi kasus nyata dan tips praktis dari mentor, sehingga kamu bisa langsung menerapkan teori ke proyek nyata.',
      color: Colors.purple,
    ),
    CourseModel(
      id: 2,
      icon: Icons.code,
      title: 'Coding dari 0 dengan Flutter',
      mentorName: 'Andi Nugraha',
      description:
          'Kuasai dasar pemrograman Flutter untuk membangun aplikasi multiplatform. Kursus ini mencakup konsep Dart, widget, state management, dan arsitektur aplikasi modern.\n\nSelain itu, kamu akan mempelajari tips debugging, best practice, serta membangun proyek mini yang dapat langsung dimanfaatkan sebagai portofolio.',
      color: Colors.blue,
    ),
    CourseModel(
      id: 3,
      icon: Icons.computer,
      title: 'Belajar Python untuk Pemula',
      mentorName: 'Dewi Lestari',
      description:
          'Mulai dari sintaks dasar hingga membuat project sederhana dengan Python. Kursus ini dirancang agar pemula bisa memahami logika pemrograman dengan cepat dan efektif.\n\nSelain belajar coding, kamu juga akan mengenal library populer untuk data processing dan membuat mini project sebagai latihan praktis.',
      color: Colors.green,
    ),
    CourseModel(
      id: 4,
      icon: Icons.storage,
      title: 'Fundamental Database MySQL',
      mentorName: 'Yusuf Maulana',
      description:
          'Pelajari cara menyimpan dan mengelola data dengan database relasional. Materi mencakup query dasar, desain tabel, normalisasi, dan indexing.\n\nSelain itu, kursus ini juga membahas praktik terbaik dan contoh kasus nyata agar kamu bisa membangun database yang efisien dan scalable.',
      color: Colors.teal,
    ),
    CourseModel(
      id: 5,
      icon: Icons.security,
      title: 'Dasar Keamanan Siber',
      mentorName: 'Budi Santosa',
      description:
          'Pahami konsep dasar keamanan informasi dan cara melindungi data. Materi mencakup pengenalan ancaman siber, enkripsi, dan keamanan jaringan.\n\nSelain teori, kursus ini memberikan latihan praktis untuk mengidentifikasi kerentanan dan menerapkan solusi keamanan pada skenario nyata.',
      color: Colors.red,
    ),
    CourseModel(
      id: 6,
      icon: Icons.phone_android,
      title: 'Membuat Aplikasi Android',
      mentorName: 'Nina Kurnia',
      description:
          'Panduan lengkap membuat aplikasi Android native dengan Java dan Kotlin. Kamu akan mempelajari UI, navigasi, penyimpanan data, dan integrasi API.\n\nSelain itu, kursus ini juga membahas tips optimasi performa dan publikasi aplikasi di Google Play Store.',
      color: Colors.orange,
    ),
    CourseModel(
      id: 7,
      icon: Icons.language,
      title: 'Bahasa Inggris untuk Developer',
      mentorName: 'Kevin Prasetya',
      description:
          'Tingkatkan kemampuan Bahasa Inggris teknis untuk komunikasi global. Fokus pada kosakata programming, dokumentasi, dan komunikasi tim.\n\nKursus ini juga memberikan latihan membaca artikel, menulis dokumentasi, dan simulasi percakapan profesional agar kemampuanmu lebih aplikatif.',
      color: Colors.indigo,
    ),
    CourseModel(
      id: 8,
      icon: Icons.web,
      title: 'Web Development Fullstack',
      mentorName: 'Linda Susanti',
      description:
          'Pelajari frontend dan backend development dengan React dan Node.js. Materi mencakup HTML, CSS, JS, API, database, dan deployment.\n\nSelain itu, kursus ini menekankan praktik project-based sehingga kamu bisa membangun website lengkap dari nol hingga siap digunakan.',
      color: Colors.cyan,
    ),
    CourseModel(
      id: 9,
      icon: Icons.auto_graph,
      title: 'Data Science dengan Python',
      mentorName: 'Agus Riyanto',
      description:
          'Analisis data, visualisasi, dan machine learning dengan Python dan Pandas. Kamu akan belajar mengolah data mentah menjadi insight yang berguna.\n\nSelain teori, kursus ini juga membahas studi kasus nyata dan project mini untuk membiasakanmu bekerja dengan dataset sebenarnya.',
      color: Colors.amber,
    ),
    CourseModel(
      id: 10,
      icon: Icons.design_services,
      title: 'Design Thinking untuk Produk Digital',
      mentorName: 'Tari Putri',
      description:
          'Temukan solusi kreatif untuk masalah pengguna dengan pendekatan design thinking. Fokus pada empati, ideation, prototyping, dan testing.\n\nSelain itu, kursus ini memberikan contoh nyata dan studi kasus produk digital agar kamu memahami penerapan metode ini di dunia profesional.',
      color: Colors.deepPurple,
    ),
  ];

  static List<CourseModel> latestCourse = [
    CourseModel(
      id: 101,
      icon: Icons.music_note,
      title: 'Belajar Musik Digital',
      mentorName: 'Rafael Pratama',
      description:
          'Pelajari teknik produksi musik digital menggunakan software populer. Kamu akan mempelajari cara membuat beat, mixing, dan mastering sehingga musik terdengar profesional.\n\nSelain itu, kursus ini membahas tips kreatif untuk menghasilkan lagu orisinal dan mempersiapkan portofolio musik digital.',
      color: Colors.deepPurpleAccent,
    ),
    CourseModel(
      id: 102,
      icon: Icons.brush_outlined,
      title: 'Digital Illustration',
      mentorName: 'Maya Sari',
      description:
          'Buat ilustrasi digital kreatif dengan Procreate dan Photoshop. Kursus ini membahas brush, layer, teknik shading, dan composition.\n\nSelain itu, kamu akan belajar membuat ilustrasi karakter, landscape, dan ilustrasi komersial yang siap dijual.',
      color: Colors.orangeAccent,
    ),
    CourseModel(
      id: 103,
      icon: Icons.sports_esports,
      title: 'Esports Management',
      mentorName: 'Kevin Hidayat',
      description:
          'Pelajari manajemen tim esports dan strategi turnamen kompetitif. Materi mencakup recruitment pemain, strategi latihan, dan sponsorship.\n\nSelain teori, kursus ini membahas simulasi manajemen turnamen agar siap menghadapi skenario nyata di industri esports.',
      color: Colors.teal,
    ),
    CourseModel(
      id: 104,
      icon: Icons.language_outlined,
      title: 'Bahasa Jepang Dasar',
      mentorName: 'Sakura Tanaka',
      description:
          'Mulai belajar bahasa Jepang untuk komunikasi sehari-hari. Kursus mencakup kosakata, grammar dasar, dan pengucapan yang tepat.\n\nSelain itu, kamu akan mempelajari ungkapan penting dalam konteks profesional dan budaya Jepang untuk komunikasi yang lebih natural.',
      color: Colors.pinkAccent,
    ),
    CourseModel(
      id: 105,
      icon: Icons.science_outlined,
      title: 'Fisika Dasar Interaktif',
      mentorName: 'Ahmad Fauzan',
      description:
          'Eksperimen dan konsep fisika dasar dengan pendekatan interaktif. Pelajari hukum Newton, gaya, energi, dan gerak dengan percobaan sederhana.\n\nKursus ini juga membahas simulasi digital untuk memahami konsep lebih mendalam dan melatih kemampuan problem solving.',
      color: Colors.blue,
    ),
    CourseModel(
      id: 106,
      icon: Icons.business_center,
      title: 'Entrepreneurship 101',
      mentorName: 'Nadia Putri',
      description:
          'Pelajari cara memulai usaha dari ide hingga pemasaran produk. Materi mencakup riset pasar, validasi ide, dan strategi bisnis.\n\nSelain teori, kursus ini juga membahas studi kasus startup sukses dan praktik membangun MVP untuk latihan nyata.',
      color: Colors.green,
    ),
    CourseModel(
      id: 107,
      icon: Icons.videocam_outlined,
      title: 'Videography Dasar',
      mentorName: 'Rizky Adi',
      description:
          'Teknik pengambilan video dan editing dasar untuk konten profesional. Kamu akan belajar framing, lighting, dan editing menggunakan software populer.\n\nSelain itu, kursus ini memberikan tips storytelling visual dan praktik membuat short video yang menarik untuk media sosial.',
      color: Colors.amber,
    ),
    CourseModel(
      id: 108,
      icon: Icons.palette,
      title: 'Color Theory & Design',
      mentorName: 'Dina Kartika',
      description:
          'Pelajari teori warna dan penerapannya dalam desain grafis. Materi mencakup kombinasi warna, psikologi warna, dan palet untuk brand.\n\nSelain teori, kursus ini juga membahas contoh proyek nyata dan praktik membuat desain yang harmonis dan profesional.',
      color: Colors.cyan,
    ),
    CourseModel(
      id: 109,
      icon: Icons.phone_iphone,
      title: 'iOS App Development',
      mentorName: 'Fajar Nugroho',
      description:
          'Belajar membangun aplikasi iOS menggunakan Swift dan Xcode. Materi mencakup UI design, navigasi, data storage, dan integrasi API.\n\nSelain itu, kursus ini memberikan tips debugging, deployment ke App Store, dan membangun aplikasi mini sebagai portofolio.',
      color: Colors.indigo,
    ),
    CourseModel(
      id: 110,
      icon: Icons.public,
      title: 'Geografi & Peta Dunia',
      mentorName: 'Lina Susanto',
      description:
          'Kenali kondisi geografis, negara, dan fenomena alam di dunia. Kursus ini membahas peta, iklim, dan benua secara mendetail.\n\nSelain teori, kamu juga akan belajar analisis data geografis dan latihan interpretasi peta untuk memperkuat pemahaman praktis.',
      color: Colors.lime,
    ),
  ];

  static CourseModel? getDummyCourseDetail(String id) {
    try {
      return CourseModel.dummyCourses.firstWhere((e) => e.id.toString() == id);
    } catch (e) {
      return null;
    }
  }

  static CourseModel? getLatestCourseDetail(String id) {
    try {
      return CourseModel.latestCourse.firstWhere((e) => e.id.toString() == id);
    } catch (e) {
      return null;
    }
  }
}
