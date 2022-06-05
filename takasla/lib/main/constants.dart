import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:hexcolor/hexcolor.dart';


final colorOfMainTheme = HexColor('#be49fc');
final colorOfSecondThem = HexColor('#9b959c');
final colorOfThirdTheme = HexColor('#e3e3e3');
final approvedColor = HexColor('#30964b');
final rejectColor = HexColor('#d92727');

final generalFont = 'Poppins';
final lorem = '''Yaygın inancın tersine, Lorem Ipsum rastgele sözcüklerden oluşmaz. Kökleri M.Ö. 45 tarihinden bu yana klasik Latin edebiyatına kadar uzanan 2000 yıllık bir geçmişi vardır. Virginia'daki Hampden-Sydney College'dan Latince profesörü Richard McClintock, bir Lorem Ipsum pasajında geçen ve anlaşılması en güç sözcüklerden biri olan 'consectetur' sözcüğünün klasik edebiyattaki örneklerini incelediğinde kesin bir kaynağa ulaşmıştır. Lorm Ipsum, Çiçero tarafından M.Ö. 45 tarihinde kaleme alınan "de Finibus Bonorum et Malorum" (İyi ve Kötünün Uç Sınırları) eserinin 1.10.32 ve 1.10.33 sayılı bölümlerinden gelmektedir. Bu kitap, ahlak kuramı üzerine bir tezdir ve Rönesans döneminde çok popüler olmuştur. Lorem Ipsum pasajının ilk satırı olan "Lorem ipsum dolor sit amet" 1.10.32 sayılı bölümdeki bir satırdan gelmektedir.''';

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}


