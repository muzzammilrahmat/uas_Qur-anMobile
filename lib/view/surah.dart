import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:uas_prak_mobile/controller/fetchController.dart';
import 'package:uas_prak_mobile/model/quran.dart';


class SurahDetail extends StatelessWidget {
  const SurahDetail({super.key});

  @override
  Widget build(BuildContext context) {
    Map data = ModalRoute.of(context)!.settings.arguments as Map;
    FetchController fetch = FetchController();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(255, 10, 10, 51),
        toolbarHeight: 100,
        centerTitle: true,
        title: Text(
          "Surah ${data['nama_surah']}",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 28,
          ),
        ),
      ),
      body: ListView(
        children: [
          //Bismillah Tile
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 10),
            child: Container(
              alignment: Alignment.center,
              height: 100,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(246, 21, 21, 99),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                "بِسْمِ اللهِ الرَّحْمٰنِ الرَّحِيْمِ",
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
          ),
          // Isi
          FutureBuilder(
            future: fetch.fetchData(data['noSurah']),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (snapshot.hasError || snapshot.data == null) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else {
                List<Result>? data = snapshot.data!.result;
                return ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: data!.length,
                    itemBuilder: (context, index) => AyatTile(
                          ayat: data[index].arabicText!,
                          terjemah: data[index].translation!,
                        ));
              }
            },
          ),
        ],
      ),
    );
  }
}

class AyatTile extends StatelessWidget {
  final String ayat;
  final String terjemah;
  const AyatTile({
    super.key,
    required this.ayat,
    required this.terjemah,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 8, right: 8, bottom: 10),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Color.fromARGB(246, 21, 21, 99),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                ayat,
                textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 25,
                  color: Color.fromARGB(255, 255, 255, 255),
                ),
              ),
            ),
            Text(
              terjemah,
              textAlign: TextAlign.left,
              style: GoogleFonts.poppins(
                color: Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
