-- --------------------------------------------------------
-- Sunucu:                       127.0.0.1
-- Sunucu sürümü:                9.1.0 - MySQL Community Server - GPL
-- Sunucu İşletim Sistemi:       Win64
-- HeidiSQL Sürüm:               12.10.0.7000
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- blogsite_db için veritabanı yapısı dökülüyor
CREATE DATABASE IF NOT EXISTS `blogsite_db` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `blogsite_db`;

-- tablo yapısı dökülüyor blogsite_db.posts
CREATE TABLE IF NOT EXISTS `posts` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `turid` int unsigned DEFAULT NULL,
  `baslik` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `onsoz` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `yazi` mediumtext COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `turConnection` (`turid`),
  CONSTRAINT `turConnection` FOREIGN KEY (`turid`) REFERENCES `turler` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- blogsite_db.posts: ~15 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `posts` (`id`, `turid`, `baslik`, `onsoz`, `yazi`) VALUES
	(1, 1, 'Yapay Zekanın Geleceği', 'Yapay zeka, teknolojinin en hızlı gelişen alanlarından biri olup, birçok sektörde dönüşüm yaratmaktadır.', 'Yapay zeka (YZ), günümüzde sadece teknoloji şirketlerinin değil, sağlık, hukuk, finans ve eğitim gibi birçok sektörün odağı haline gelmiştir. <b>Otonom araçlardan akıllı asistanlara kadar</b> pek çok uygulama günlük yaşantımıza entegre olmaya başlamıştır. \r\nAncak YZ sadece fayda sağlamakla kalmaz, aynı zamanda <b>etik sorunlar, iş gücü kaybı ve veri güvenliği</b> gibi büyük tartışmalara da yol açar. Gelecekte YZ’nin toplumsal etkileri daha da artacak ve bu durum insanlığın teknolojiyi nasıl yönettiğiyle doğrudan bağlantılı olacaktır.'),
	(2, 1, '5G Teknolojisi ve Etkileri', 'Beşinci nesil mobil iletişim teknolojisi olan 5G, yüksek hız ve düşük gecikme süresiyle birçok yeniliğin önünü açmaktadır.', '5G, saniyede 10 Gbps’ye kadar veri aktarım hızlarıyla <b>yüksek bant genişliği ve düşük gecikme süresi</b> sunar. Bu da özellikle <b>otonom araçlar, akıllı şehirler ve uzaktan cerrahi</b> gibi uygulamalarda büyük önem taşır.\r\nAyrıca 5G, çok daha fazla cihazın aynı anda bağlanabilmesini sağlar, bu da nesnelerin internetinin yaygınlaşmasının önünü açar. Tüm bu gelişmelere rağmen, altyapı maliyetleri ve sağlık etkilerine dair endişeler de kamuoyunda tartışma yaratmaktadır.'),
	(3, 1, 'Akıllı Ev Sistemleri: Geleceğin Yaşam Alanları', 'Ev teknolojileri her geçen gün daha akıllı hale gelerek konforu ve güvenliği artırmaktadır.', 'Akıllı ev sistemleri, internet bağlantılı cihazlar aracılığıyla evin farklı bölümlerini <b>uzaktan kontrol etme</b> ve <b>otomatikleştirme</b> imkânı sunar. \r\nÖrneğin; akıllı termostatlar, ışık sistemleri, güvenlik kameraları ve sesli asistanlar ev yaşamını hem daha konforlu hem de daha güvenli hale getirir.\r\n<b>Enerji verimliliği</b> açısından da büyük avantaj sağlayan bu sistemler sayesinde elektrik ve su tüketimi azaltılabilir. Ancak, bu cihazların siber güvenliği sağlanmazsa, <b>kişisel veri ihlalleri ve uzaktan erişim tehlikeleri</b> oluşabilir.'),
	(4, 2, 'Sağlıklı Beslenme Rehberi', 'Modern yaşam tarzı, sağlıklı beslenmenin önemini daha da artırarak bilinçli tüketimi teşvik etmektedir.', 'Sağlıklı bir beslenme düzeni, vücudun ihtiyacı olan <b>karbonhidrat, protein, yağ, vitamin ve mineral</b> dengesini sağlamayı amaçlar. \r\n<b>Fast food alışkanlıkları, işlenmiş gıdalar ve düzensiz öğünler</b> uzun vadede obezite, diyabet ve kalp hastalıkları gibi ciddi sorunlara neden olabilir.\r\nBunun yerine, <b>sebze ve meyve ağırlıklı, işlenmemiş gıdalardan oluşan bir diyet</b> benimsemek hem fiziksel hem de zihinsel sağlığı destekler. Ayrıca su tüketimi ihmal edilmemeli ve porsiyon kontrolü yapılmalıdır.'),
	(5, 2, 'Uyku Kalitesini Artırmak İçin Bilimsel Yöntemler', 'Uyku, sadece dinlenme değil; zihinsel, duygusal ve fiziksel sağlığın korunmasında kritik bir rol oynamaktadır.', 'Uyku düzeni, insan sağlığının temel taşlarından biridir. <b>Melatonin hormonu</b> vücudun biyolojik saatini düzenler ve bu hormon sadece karanlıkta salgılanır. \r\nDolayısıyla gece geç saatlerde ışıklı ekranlara maruz kalmak melatonin üretimini engelleyebilir.\r\n<b>Sabah saatlerinde gün ışığı almak, düzenli egzersiz yapmak</b> ve <b>yatmadan önce gevşeme rutinleri</b> oluşturmak kaliteli uykuya katkı sağlar. Kafein ve ağır yemeklerden ise akşam saatlerinde kaçınılmalıdır.'),
	(6, 2, 'Egzersizin Beden ve Zihin Üzerindeki Etkileri', 'Fiziksel aktivite, sadece kilo kontrolü için değil, ruhsal sağlığı güçlendirmek için de oldukça önemlidir.', 'Egzersiz yapmak; kas gelişimi, kilo kontrolü ve kalp sağlığı gibi fiziksel faydaların yanı sıra <b>stresin azalması, endorfin salgısı ve zihinsel açıklık</b> gibi psikolojik etkiler de sağlar.\r\nDüzenli olarak yapılan yürüyüş, koşu, yoga veya ağırlık çalışmaları bireyin <b>yaşam kalitesini artırır</b> ve birçok kronik hastalığın riskini azaltır.\r\nAyrıca egzersiz sosyal bağ kurmayı teşvik eder ve kişinin kendine olan güvenini yükseltir.'),
	(7, 3, 'Bali Adası Gezi Rehberi', 'Endonezya’nın en popüler tatil destinasyonlarından biri olan Bali, doğal güzellikleri ve kültürel dokusuyla büyüleyici bir deneyim sunmaktadır.', 'Bali, volkanik dağları, pirinç tarlaları, tapınakları ve plajlarıyla her gezginin hayalini süsler. <b>Ubud bölgesi kültür ve sanatın kalbi</b> olarak kabul edilirken, Seminyak ve Kuta gibi bölgeler gece hayatı ve alışverişle öne çıkar.\r\nTapınak ziyaretlerinde <b>sade kıyafet</b> tercih edilmeli, <b>yerel geleneklere saygı</b> gösterilmelidir. Tropikal iklim nedeniyle yanınızda mutlaka güneş kremi, şapka ve bol su bulunmalıdır.'),
	(8, 3, 'İstanbul’da 3 Gün: Kısa Sürede Şehri Keşfetmek', 'İstanbul gibi dev bir şehri birkaç günde keşfetmek mümkün olsa da, iyi bir planlama şarttır.', 'İlk gün Ayasofya, Sultanahmet Camii ve Topkapı Sarayı gibi <b>tarihi yarımadadaki yapılar</b> gezilmeli. İkinci gün Galata, Karaköy, İstiklal Caddesi ve Taksim gibi bölgeler keşfedilmeli.\r\nÜçüncü gün Boğaz turu ve Üsküdar-Kadıköy gibi Anadolu yakası önerilir. <b>Kumpir, balık ekmek ve Türk kahvesi</b> gibi lezzetleri tatmadan dönmeyin.'),
	(9, 3, 'Yürüyerek Avrupa Turu: Hayal mi Gerçek mi?', 'Sırt çantasını alıp Avrupa’da şehir şehir dolaşmak birçok kişi için büyüleyici bir deneyim olabilir.', 'Bu tür turlar için <b>Schengen vizesi, ucuz tren ve otobüs biletleri, hosteller ve kamp alanları</b> gibi detayları önceden planlamak çok önemlidir. \r\nYürüyerek seyahat, kültürleri daha derinlemesine tanımayı sağlar. Ancak <b>fiziksel dayanıklılık ve detaylı rota planlaması</b> şarttır. Özellikle yaz aylarında yola çıkmak, kamp ekipmanı taşımak ve temel ilkyardım bilgisine sahip olmak gereklidir.'),
	(10, 4, 'Online Eğitimde Başarılı Olmanın Yolları', 'Dijitalleşmenin hız kazandığı bu dönemde online eğitim, esneklik sunarak kişisel gelişimi desteklemektedir.', 'Online eğitimde başarılı olmak için öncelikle <b>zaman yönetimi</b> oldukça kritiktir. Günlük ders çalışma planı oluşturmak ve buna sadık kalmak motivasyonu artırır. \r\nAyrıca, <b>aktif katılım ve not alma</b> alışkanlığı dersin anlaşılmasını kolaylaştırır. \r\nÖğrenme sırasında dikkat dağıtıcı unsurları ortadan kaldırmak gerekir. Örneğin; telefon bildirimlerini kapatmak, sessiz bir çalışma ortamı oluşturmak faydalı olacaktır.\r\n<b>Kendi hızında öğrenme avantajı</b> sunan online sistemlerde geri bildirim almak da önemlidir. Öğrenci, eğitmenlerle etkileşim içinde kalmalı ve gerektiğinde destek istemelidir.'),
	(11, 4, 'Yabancı Dil Öğrenme Teknikleri: Hızlı ve Kalıcı Yöntemler', 'Yabancı dil öğrenmek birçok kişi için zorlayıcı olsa da, doğru tekniklerle süreci hızlandırmak mümkündür.', 'Dil öğreniminde temel unsur <b>süreklilik</b> ve <b>maruz kalma</b>dır. Her gün 20-30 dakikalık tekrarlar bile büyük ilerleme sağlar. \r\n<b>Kelime kartları (flashcards)</b> görsel hafızayı desteklerken, sesli tekrarlar telaffuz gelişimini sağlar.\r\nDil öğreniminde pratik şarttır. <b>Konuşma uygulamaları, dil değişim partnerleri</b> ya da sosyal medya üzerinden gerçek kişilerle iletişim kurmak bu beceriyi hızlandırır. \r\nAyrıca, sevilen dizileri altyazılı izlemek veya günlük tutmak da dil öğrenimini pekiştirir. \r\nÖnemli olan, <b>kendine uygun yöntemi keşfetmek</b> ve sürdürülebilir bir öğrenme rutini oluşturmaktır.'),
	(12, 4, 'Kodlama Öğrenmeye Nereden Başlamalı?', 'Programlama, günümüzde hemen her mesleğin bir parçası haline gelerek kariyer fırsatlarını genişletmektedir.', 'Kodlama öğrenimine başlarken ilk adım <b>temel algoritma mantığını kavramak</b> olmalıdır. Bunun ardından en yaygın giriş seviyesi dil olan <b>Python</b> önerilir.\r\nPython, sözdiziminin sade olması ve geniş topluluğu sayesinde yeni başlayanlar için idealdir. \r\nÖğrenim sürecinde <b>bol örnek çözmek, projeler geliştirmek</b> ve GitHub gibi platformlara kod yüklemek öğrenimi pekiştirir.\r\nAyrıca interaktif platformlar (Codecademy, FreeCodeCamp gibi) sayesinde uygulamalı öğrenme mümkündür. \r\nKodlama öğrenirken sabırlı olunmalı ve <b>hatalardan korkulmamalıdır</b>; her hata, öğrenme sürecinin değerli bir parçasıdır.'),
	(13, 5, 'Türk Halk Müziği: Anadolu’nun Sesi', 'Yüzyıllardır halkın duygularına tercüman olan Türk halk müziği, kültürel mirasın önemli bir parçasıdır.', 'Türk halk müziği, <b>anonim ezgiler, sözlü gelenek ve bağlama eşliği</b> ile halkın duygularını ifade ettiği en önemli sanat biçimidir. \r\nYörenin diliyle söylenen türküler, aşk, hasret, kahramanlık ve acı gibi duyguları yansıtır. \r\nBu müzik türü, <b>Alevi-Bektaşi geleneğinden Karadeniz ezgilerine</b> kadar çok geniş bir yelpazeye sahiptir.\r\nHalk müziği ustaları genellikle saz çalar ve aynı anda söyler. Bu geleneğin yaşatılması için TRT arşivleri, üniversitelerde halk müziği bölümleri ve yerel festivaller büyük önem taşır.'),
	(14, 5, 'Modern Sanatın Doğuşu ve Evrimi', 'Sanat, yüzyıllar boyunca kendini yeniden tanımlamış ve modern çağda farklı akımlarla evrim geçirmiştir.', 'Modern sanat, 19. yüzyılın sonlarında <b>empresyonizm (izlenimcilik)</b> ile başlayıp fütürizm, kübizm, ekspresyonizm ve soyut sanat gibi birçok akıma ev sahipliği yapmıştır.\r\nBu akımlar, <b>gerçekliği doğrudan yansıtmak yerine sanatçının bakış açısını yansıtmayı</b> hedeflemiştir. \r\nSanatçı, artık doğanın kopyasını yapmakla yetinmez; duygularını, düşüncelerini ve toplumsal eleştirilerini eserlerine katmaya başlar.\r\nModern sanatla birlikte <b>duvar resmi, performans sanatı, kavramsal sanat</b> gibi yeni ifade biçimleri de ortaya çıkmıştır. Bu süreç, sanatı herkesin anlayabileceği bir dil haline getirmiştir.'),
	(15, 5, 'Kitap Okuma Alışkanlığı Kazanmanın Yolları', 'Günümüz dünyasında odaklanma süremiz kısalmışken, kitap okuma alışkanlığını güçlendirmek için bazı stratejiler geliştirilmelidir.', 'Kitap okuma alışkanlığı kazanmak için <b>günde 15 dakika ile başlamak</b> etkili bir stratejidir. Zamanla bu süre artırılabilir. \r\nAyrıca <b>rahat bir okuma köşesi oluşturmak, dijital dikkat dağıtıcılardan uzaklaşmak</b> odaklanmayı artırır.\r\nOkunan kitapları not etmek, özet çıkarmak veya okuma listeleri yapmak alışkanlığı güçlendirir.\r\nEn önemlisi, <b>kişisel ilgi alanlarına hitap eden türler</b> seçmek motivasyonu sürekli kılar. \r\nRomanlar, biyografiler, denemeler ya da tarihi kitaplar gibi farklı türlerle çeşitlilik sağlamak da alışkanlığı sürdürmede faydalıdır.');

-- tablo yapısı dökülüyor blogsite_db.turler
CREATE TABLE IF NOT EXISTS `turler` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `ad` char(50) COLLATE utf8mb4_general_ci NOT NULL,
  `sira` int unsigned NOT NULL,
  `stil` tinytext COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`),
  KEY `ad` (`ad`),
  KEY `sira` (`sira`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- blogsite_db.turler: ~5 rows (yaklaşık) tablosu için veriler indiriliyor
INSERT INTO `turler` (`id`, `ad`, `sira`, `stil`) VALUES
	(1, 'Teknoloji', 10, 'tech'),
	(2, 'Sağlık', 20, 'health'),
	(3, 'Seyahat', 30, 'travel'),
	(4, 'Eğitim', 40, 'education'),
	(5, 'Kültür', 50, 'culture');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
