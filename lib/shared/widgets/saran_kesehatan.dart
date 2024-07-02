import 'package:flutter/material.dart';

class SaranKesehatan extends StatelessWidget {
  const SaranKesehatan({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text(
          "Saran Kesehatan Mulut dan Gigi",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Table(
          columnWidths: const {
            0: FixedColumnWidth(30),
          },
          children: const [
            TableRow(
              children: [
                Text("1"),
                Text(
                  "Menjaga kebersihan gigi dan mulut dengan menyikat gigi dan mulut minimal 2x sehari pagi dan malam karena dalam pasta gigi mengandung florida yang resisten terhadap zat asam sebagai penyebab gigi berlubang.",
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            TableRow(
              children: [
                Text("2"),
                Text(
                  "Konsumsi makanan yang sehat dan bergizi baik berupa sayur dan buah dengan kadar serat yang tinggi untuk kesehatan gigi dan mulut.",
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
            TableRow(
              children: [
                Text("3"),
                Text(
                  "Kontrol ke dokter gigi minimal 6 bulan sekali.",
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
