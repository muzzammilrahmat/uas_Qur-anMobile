import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _surah = [
    SurahTile(namaSurah: "Al-Fatihah",artiSurah: "The Opening", noSurah: 1),
    SurahTile(namaSurah: "Al-Baqarah",artiSurah: "The Cow", noSurah: 2),
    SurahTile(namaSurah: "Ali 'Imran",artiSurah: "The Family of Imran", noSurah: 3),
    SurahTile(namaSurah: "An-Nisa'",artiSurah: "The Women", noSurah: 4),
    SurahTile(namaSurah: "Al-Ma'idah",artiSurah: "The Table Spread", noSurah: 5),
    SurahTile(namaSurah: "Al-An'am",artiSurah: "The Cattle", noSurah: 6),
    SurahTile(namaSurah: "Al-A'raf",artiSurah: "The Heights", noSurah: 7),
    SurahTile(namaSurah: "Al-Anfal",artiSurah: "The Spoils of War", noSurah: 8),
    SurahTile(namaSurah: "At-Taubah",artiSurah: "The Repentance", noSurah: 9),
    SurahTile(namaSurah: "Yunus",artiSurah: "Jonah", noSurah: 10),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 79, 100, 165),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Color.fromARGB(255, 10, 10, 51),
          toolbarHeight: 100,
          centerTitle: true,
          title: Text(
            "      Quran Mobile\nEnglish Translation",
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
        ),
        body: ListView.builder(
          itemCount: _surah.length,
          itemBuilder: (context, index) => _surah[index],
        ));
  }
}

class SurahTile extends StatelessWidget {
  final String namaSurah;
  final String artiSurah;
  final int noSurah;
  const SurahTile({
    super.key,
    required this.namaSurah,
    required this.noSurah,
    required this.artiSurah,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 4,
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, '/surah', arguments: {
          'noSurah': noSurah,
          'nama_surah': namaSurah,
          'arti_surah': artiSurah,
        }),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                //Surah Number
                Container(
                  height: 60,
                  width: 60,
                  alignment: Alignment.center,
                  child: Text(
                    noSurah.toString(),
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 10, 10, 51),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                SizedBox(
                  width: 15,
                ),
                // Surah Name and Juz
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      namaSurah,
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 10, 10, 51),
                        fontSize: 27,
                      ),
                    ),
                    Text(
                      artiSurah,
                      style: GoogleFonts.taiHeritagePro(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 27,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
