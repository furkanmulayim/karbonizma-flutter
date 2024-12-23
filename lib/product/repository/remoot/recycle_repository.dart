import 'package:karbonizma/product/model/recycle_model.dart';

/// Buraya firebaseden list çekeceğiz.
class RecycleRepository {
  List<RecycleModel> recycleItems = [
    RecycleModel(
      id: 0,
      name: 'PET',
      explain:
          'PET (Polietilen Tereftalat), genellikle su şişeleri, gıda ambalajları ve tekstil ürünlerinde kullanılan bir plastik türüdür. Geri dönüştürüldüğünde, enerji tasarrufu sağlar ve çevresel etkileri azaltır.',
      persentage: '95%',
      carbonRatio: 50,
    ),
    RecycleModel(
      id: 1,
      name: 'HDPE / Polietilen',
      explain:
          'HDPE (Yüksek Yoğunluklu Polietilen), dayanıklı ve güçlü bir plastik türüdür. Genellikle şişeler, borular ve plastik torbalar gibi ürünlerde kullanılır. Geri dönüşümü kolaydır ve çevre dostudur.',
      persentage: '85%',
      carbonRatio: 60,
    ),
    RecycleModel(
      id: 2,
      name: 'PP / Polipropilen',
      explain:
          'PP (Polipropilen), dayanıklı ve hafif bir plastik malzemedir. Plastik kaplar, gıda ambalajları ve çeşitli endüstriyel ürünlerde kullanılır. Geri dönüştürüldüğünde enerji tasarrufu sağlar.',
      persentage: '80%',
      carbonRatio: 70,
    ),
    RecycleModel(
      id: 3,
      name: 'Cam Şişe',
      explain:
          'Cam şişeler geri dönüştürülebilir ve çevre dostudur. Cam, doğal malzemelerden yapıldığı için geri dönüşümü, diğer malzemelere göre daha az enerji gerektirir.',
      persentage: '90%',
      carbonRatio: 30,
    ),
    RecycleModel(
      id: 4,
      name: 'Bakır',
      explain:
          'Bakır, geri dönüştürülebilen ve değerli bir metal olup, enerji tasarrufu sağlar. Elektrik kabloları ve makinelerde yaygın olarak kullanılır.',
      persentage: '95%',
      carbonRatio: 40,
    ),
    RecycleModel(
      id: 5,
      name: 'Alüminyum',
      explain:
          'Alüminyum, hafif ve dayanıklı bir metaldir. Geri dönüşümü oldukça verimlidir ve enerji tasarrufu sağlar. Alüminyum kutular ve folyo, yaygın geri dönüştürülen ürünlerdir.',
      persentage: '90%',
      carbonRatio: 50,
    ),
    RecycleModel(
      id: 6,
      name: 'Çelik',
      explain:
          'Çelik, yüksek dayanıklılığa sahip bir metal olup geri dönüştürülebilir. Geri dönüşümü sırasında büyük enerji tasarrufu sağlanır ve çevresel etkileri azaltır.',
      persentage: '80%',
      carbonRatio: 60,
    ),
    RecycleModel(
      id: 7,
      name: 'Gazete',
      explain:
          'Gazete kağıtları geri dönüştürülebilir ve yeniden kullanılabilir. Gazetelerin geri dönüşümü, doğal kaynakların korunmasına ve atıkların azaltılmasına yardımcı olur.',
      persentage: '75%',
      carbonRatio: 20,
    ),
    RecycleModel(
      id: 8,
      name: 'Karton',
      explain:
          'Karton kutular, geri dönüştürülebilir ve yeniden kullanılabilir. Karton geri dönüşümü, enerji tasarrufu sağlar ve atıkları azaltır.',
      persentage: '85%',
      carbonRatio: 40,
    ),
  ];
}
