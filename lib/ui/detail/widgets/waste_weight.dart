part of '../view/detail_view.dart';

class WasteWeight extends StatelessWidget {
  const WasteWeight({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Sol buton (minus)
            GestureDetector(
              onTap: () {
                // - butonuna tıklama işlevi
              },
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue,
                child: Icon(Icons.remove, color: Colors.white),
              ),
            ),
            SizedBox(width: 5), // Soldaki metin ile - buton arasında boşluk
            // Soldaki metin
            Text('Metin 1', style: TextStyle(fontSize: 18)),
            SizedBox(width: 5), // Metinler arasındaki boşluk
            // Sağdaki metin
            Text('Metin 2', style: TextStyle(fontSize: 18)),
            SizedBox(width: 5), // Sağdaki metin ile + buton arasında boşluk
            // Sağ buton (plus)
            GestureDetector(
              onTap: () {
                // + butonuna tıklama işlevi
              },
              child: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.blue,
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
