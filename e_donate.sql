-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 28, 2023 at 09:58 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `e_donate`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `price` int(11) NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(500) DEFAULT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `user_id`, `message`, `time`) VALUES
(1, 1, 'Merhaba ben yusuf', '2023-01-28 00:04:47');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us_answer`
--

CREATE TABLE `contact_us_answer` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `message` varchar(500) NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `order_status` varchar(200) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'Bağış Doğrulanıyor',
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `product_id`, `quantity`, `total_price`, `order_status`, `time`) VALUES
(1, 1, 6, 1, 1, 'Alıcıya Ulaştırıldı', '2023-01-27 23:45:10'),
(2, 2, 13, 1, 1, 'Onaylandı', '2023-01-27 23:40:22'),
(3, 1, 1, 1, 1, 'Alıcıya Ulaştırıldı', '2023-01-27 23:58:42');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `detail` varchar(2000) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `img_url` varchar(255) DEFAULT NULL,
  `categorie` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `product_name`, `detail`, `price`, `img_url`, `categorie`) VALUES
(1, 'Deprem Bağışı', '30.10.2020 tarihinde İzmir’in Seferihisar açıklarında meydana gelen 6,6 büyüklüğündeki deprem sonrası genel hayatı olumsuz etkileyen şartların giderilmesi ve afetzede vatandaşlarımızın acil ihtiyaçlarının karşılanması için yürütülen iyileştirme çalışmaları, AFAD koordinasyonunda kamu kurum ve kuruluşları ile STK’larımızın iş birliğinde devam etmektedir.\r\n\r\nİzmir’de sürdürülen iyileştirme ve hayatın normale döndürülmesi çalışmalarına destek vermek isteyen hayırsever vatandaşlarımızdan da Başkanlığımıza çok sayıda yardımda bulunma talebi gelmektedir.\r\n\r\nBahse konu talepleri karşılıksız bırakmamak adına, afetzede vatandaşlarımıza destek olmak isteyen bağış sahipleri burdan bağışlarını gerçekleştirebilir.', 1, '/images/afad/afad_logo.png', 'afad'),
(2, 'Yangın ve Sel Afeti Bağışı', 'Milletimizi derinden üzen yangınlar ile seller sonrasında ülkemizdeki ve Dünya’nın dört bir noktasındaki vatandaşlarımız, yardım etme taleplerini yoğun bir şekilde AFAD’a iletmişlerdir. İnsanımızın bu vicdani talebini karşılamak üzere açılan yedi yardım kampanyasından biri olan “Yangın ve Sel Afeti Yardım Kampanyası”, sürekli olarak açık tutularak yangın ve sel afetleri sonrasındaki ulusal çabaların desteklenmesi sağlanacaktır.', 1, '/images/afad/afad_logo.png', 'afad'),
(3, 'Somali Yardım Kampanyası', 'Afrika Kıtasının doğusunda yaşanan kuraklığın yol açtığı kıtlık, açlık, susuzluk nedeniyle başta Somali olmak üzere bölge halkı bir insanlık dramıyla karşı karşıya bulunmaktadır. İnsani yardım ihtiyacının karşılanması amacıyla AFAD koordinasyonunda başlatılan yardım kampanyasına buradan destek olabilirsiniz.', 1, 'images/afad/afad_logo.png', 'afad'),
(4, 'Balkanlar Yardım Kampanyası', '2014 yılı Mayıs ayında Balkan Ülkelerini etkisi altına alan sel ve su baskınları sebebiyle oluşan ihtiyaçların karşılanması amacıyla AFAD koordinasyonunda başlatılan yardım kampanyasına ilişkin bağışı buradan gerçekleştirebilirsiniz.', 1, 'images/afad/afad_logo.png', 'afad'),
(5, 'Pakistan Yardım Kampanyası', 'Türkiye, on milyonlarca insanın sel ve su taşkınlarından etkilendiği Pakistan’a havadan ve karadan yardım elini uzatmaya devam ediyor.', 1, 'images/afad/afad_logo.png', 'afad'),
(6, 'Aşevlerine Genel Bağış', 'Türk Kızılay, aşevleri vasıtasıyla verdiği tüm hizmetlerin giderlerini sizlerin bağışları ile karşılamakta ve ihtiyaç sahipleri ile sizlerin arasında paylaşım köprüsü kurmaktadır.', 1, '/images/kızılay/asevi.jpg', 'kızılay'),
(7, 'Giyim Yardımları', 'Kızılay, ekonomik sıkıntılar sebebiyle giyim ihtiyacını karşılayamayan ihtiyaç sahiplerini sosyal incelemeler neticesinde belirlemekte ve sizlerin destekleri ile yüz binlerce ihtiyaç sahibini ayni ve nakdi şekilde yapılan yardımlarla sevindirmektedir.', 1, '/images/kızılay/giyim.jpg', 'kızılay'),
(8, 'Kızılay Genel Bağış', 'Türk Kızılay, 1868 yılından bu yana hayırsever halkımızdan aldığı güç ile ülkemizde ve dünyada insan ıstırabını dindirmek,  insan onurunu korumak için çalışmaktadır.  Kan, afet, uluslararası yardım, göç ve mülteci hizmetleri, sosyal hizmetler, sağlık, ilk yardım, eğitim, gençlik ve mineralli su işletmeleri alanlarında faaliyet göstermektedir.\r\n\r\nKuruluşundan bugüne yürüttüğü insani yardım faaliyetleri ile milyonlarca insana ulaşan Türk Kızılay, bu çalışmalarını bağışçılarından aldığı güçle yerine getirmektedir. Siz de insani yardım faaliyetlerine nakdi bağışta bulanarak Kızılay’ın çalışmalarına destek olabilirsiniz. ', 1, '/images/kızılay/kızılay_logo.jpg', 'kızılay'),
(9, 'Kan Alma Aracı Bağışı', 'Türk Kızılay ihtiyaç duyulan kan stoklarında düşüşün önüne geçmek ve sürdürülebilir güvenli kan teminini sağlamak amacıyla kan bağışı çalışmalarını sürdürmekle birlikte, gelişen ve büyüyen yapısı ile ülke kan ihtiyacının çoğunu karşılar hale gelmiştir.\r\nTürk Kızılay’ın, bireylerin gönüllü ve düzenli kan bağışına teşvik edilmesi konusunda yürüttüğü faaliyetler kapsamında kan bağışı noktalarının ulaşılabilirliği önem taşımaktadır. Kan alma araçları; il/ilçelerde ve meydanlarda halkın yoğun bulunduğu mekânlarda hatırlatıcı, ilgi uyandırıcı, tanıtıcı, teşvik edici özelliğe sahiptir.\r\n\r\nSiz de Türk Kızılay aracılığıyla güvenli kan ihtiyacının karşılanmasına destek olabilirsiniz.', 1, '/images/kızılay/arac.jpg', 'kızılay'),
(10, 'Bebek Bohçası Bağışı', 'Hilal-i Ahmer’den Kızılay’a bir iyilik geleneği olarak süregelen Bebek bohçası, bağışlarınız sayesinde bugün de gönüllerde kalıcı izler bırakıyor.\r\n\r\nYeni doğan bebeklerin ve annelerinin öncelikli hijyen, giyim eşyası vb. temel ihtiyaçlarının karşılanması hususunda, hayırseverlerin bağışları ile hazırlanan bebek bohçaları, Türk Kızılay şubeleri tarafından, bebek sahibi olan yardıma muhtaç ailelere ulaştırılmaktadır. Ayrıca doğum sonrasında ailelere bebek bakımı ile ilgili bilgiler de verilmektedir. Ayrıca doğum sonrasında anne ve bebeğin ihtiyaçlarının karşılanabilmesi amacıyla yeni doğan bebek 12 aylık olana kadar nakdi yardım yapılabilmektedir.', 1, '/images/kızılay/bohca.jpg', 'kızılay'),
(11, 'Lösev Genel Bağış', 'Bu bağış ilanında yapılan bütün bağışlar lösev kurumuna gönderilecektir.', 1, '/images/lösev/logo.png', 'lösev'),
(12, 'Adak Bağışı', 'Adak bağışımın dini esaslarla kesilerek lösemili ve kanserli çocuklara 12 ay boyunca taze et ve et ürünü olarak dağıtılmasını ihtiyaç fazlasının lösemili çocuklar için sarf edilmesini için bu ilanı satın alabilirsiniz.', 185, '/images/lösev/logo.png', 'lösev'),
(13, 'Fitre, Zekat ve Fidye bağışları', 'Fitre, Zekat ve Fidye bağışlarınız doğrudan ailelerimize maddi ve gıda yardımı olarak ulaştırılmaktadır. Başka amaçlar için kullanılmamaktadır.', 1, '/images/lösev/logo.png', 'lösev'),
(14, 'Geri Ödemesiz Sağlık Kredisi', 'GERİ ÖDEMESİZ SAĞLIK KREDİSİ Lösemili çocuklarımız ve aileleri ile kanser hastalarımızın tedavileri süresince banka hesaplarına düzenli olarak her ay nakit olarak yatırılmaktadır. Böylece ekonomik zorluklar içindeki ailelerimizin rahat bir nefes almalarını sağlayacaksınız ve tedavideki başarı oranı yükselecektir.', 2050, 'images/lösev/logo.png', 'lösev'),
(15, 'Tedavi Giderleri Bağışı', 'TEDAVİ GİDERLERİ BAĞIŞI Lösemi tedavisinde yıllık maliyetler 500.000.-TL yi bulabilmektedir. 2 yıllık tedavi sürecinde SGK katkısı ne yazık ki çok düşüktür. Lösemili çocuklarımızın hayata tutunma mücadelesinde yüksek maliyetleri göğüslerken, desteklerinizle %92 başarı oranımızı %100 lere çıkarma gayretimiz ve umudumuz olacaksınız.', 1455, '/images/lösev/logo.png', 'lösev'),
(16, 'TEV Genel Bağış', 'Dilediğiniz miktarda yapacağınız bağışla başarılı ancak maddi desteğe ihtiyaç duyan öğrencilerin eğitimine destek olabilirsiniz.', 1, '/images/tev/tev.jpg', 'diğer'),
(17, 'Burs Fonlarına Genel Bağış', 'TEV çatısı altında kurulan genel, bireysel ya da kurumsal burs fonlarına düzenli veya tek seferlik destek verebilirsiniz.', 1, 'images/tev/tev.jpg', 'diğer'),
(18, 'Mehmetçik Vakfı Bağış', 'Mehmetçik vakfına yapacak olduğunuz bütün bağışları bu ilan üzerinden yapabilirsiniz.', 1, 'images/mehmetçik.png', 'diğer'),
(19, 'Unicef Tek Seferlik Bağış', 'Her bağış çok değerli. Her ay küçük bir tutar ile düzenli bağışa başladığınızda uzun vadeli projeler sayesinde daha fazla çocuğun mutlu, sağlıklı ve güvenli bir şekilde büyümesini sağlayabilirsiniz.', 1, 'images/unicef.png', 'diğer'),
(20, 'Ahbap Genel Bağış', 'Bu kategoriye yaptığınız bağışla, Türkiye\'nin dört bir yanındaki Ahbap gönüllülerinin yaptığı tüm proje ve yardım çalışmalarına katkıda bulunmuş olacaksınız. Dünyaya katacağınız bu değer için tüm Ahbaplar adına teşekkür ederiz.', 1, '/images/ahbap.png', 'diğer');

-- --------------------------------------------------------

--
-- Table structure for table `sss`
--

CREATE TABLE `sss` (
  `id` int(11) NOT NULL,
  `title` varchar(200) NOT NULL,
  `description` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sss`
--

INSERT INTO `sss` (`id`, `title`, `description`) VALUES
(1, 'Neden Monero(XMR)?', 'Monero(XMR) tamamen anonim bir transfer ağına sahip olduğu için tercih edilmiştir.'),
(2, 'Site Yöneticisi Kimdir?', 'Yusuf Türken\'dir. Kendisi Bilecik Şeyh Edebali Üniversitesi Bilgisayar Mühendisliği 3.Sınıf Öğrencisidir.'),
(3, 'Yusuf Türken hangi alanda kendini geliştirmektedir?', 'Daha çok kendisini Full Stack Web Development ve Cloud Computing üzerine geliştirmektedir.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `wallet` varchar(100) DEFAULT 'Size Özel XMR Cüzdan Numarası 12 saat içinde tanımlanacaktır!',
  `balance` float NOT NULL DEFAULT 0,
  `user_type` varchar(50) DEFAULT 'user',
  `time` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `username`, `password`, `wallet`, `balance`, `user_type`, `time`) VALUES
(1, 'yusuftrken@gmail.com', 'liwiro', 'ef4ce77f8320ccccddd1a7863c195275', 'Size Özel XMR Cüzdan Numarası 12 saat içinde tanımlanacaktır!', 970.359, 'admin', '2023-01-24 17:21:38');

-- --------------------------------------------------------

--
-- Table structure for table `xmr`
--

CREATE TABLE `xmr` (
  `id` int(11) NOT NULL,
  `xmr` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `xmr`
--

INSERT INTO `xmr` (`id`, `xmr`) VALUES
(1, 173.42);

-- --------------------------------------------------------

--
-- Table structure for table `xmr_request`
--

CREATE TABLE `xmr_request` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `xmr_address` varchar(100) NOT NULL,
  `xmr_amount` double NOT NULL,
  `time` timestamp NOT NULL DEFAULT current_timestamp(),
  `transaction_status` varchar(1000) NOT NULL DEFAULT 'Çekim isteği gönderildi'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us_answer`
--
ALTER TABLE `contact_us_answer`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sss`
--
ALTER TABLE `sss`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_name` (`username`);

--
-- Indexes for table `xmr`
--
ALTER TABLE `xmr`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `xmr_request`
--
ALTER TABLE `xmr_request`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `contact_us_answer`
--
ALTER TABLE `contact_us_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `sss`
--
ALTER TABLE `sss`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `xmr`
--
ALTER TABLE `xmr`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `xmr_request`
--
ALTER TABLE `xmr_request`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
