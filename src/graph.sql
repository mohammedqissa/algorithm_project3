CREATE DATABASE  IF NOT EXISTS `graph` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `graph`;
-- MySQL dump 10.13  Distrib 5.7.17, for macos10.12 (x86_64)
--
-- Host: 127.0.0.1    Database: graph
-- ------------------------------------------------------
-- Server version	5.7.11

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `edges`
--

DROP TABLE IF EXISTS `edges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `edges` (
  `edgeID` int(11) NOT NULL AUTO_INCREMENT,
  `vertexNode1` int(11) DEFAULT NULL,
  `vertexNode2` int(11) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  PRIMARY KEY (`edgeID`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `edges`
--

LOCK TABLES `edges` WRITE;
/*!40000 ALTER TABLE `edges` DISABLE KEYS */;
INSERT INTO `edges` VALUES (2,1,2,39),(3,2,1,39),(4,1,4,20),(5,4,1,20),(6,2,5,18),(7,5,2,18),(8,3,2,30),(9,2,3,30),(10,3,4,33),(11,4,3,33),(12,5,6,33),(13,6,5,33),(14,6,7,22),(15,7,6,22),(16,3,7,27),(17,7,3,27),(18,3,8,45),(19,8,3,45),(20,10,7,31),(21,7,10,31),(22,11,7,27),(23,7,11,27),(24,4,8,40),(25,8,4,40),(26,10,9,15),(27,9,10,15),(28,10,11,25),(29,11,10,25),(30,6,12,71),(31,12,6,71),(32,11,13,37),(33,13,11,37),(34,9,14,28),(35,14,9,28),(36,10,13,49),(37,13,10,49),(38,13,12,25),(39,12,13,25),(40,12,18,26),(41,18,12,26),(42,14,16,19),(43,16,14,19),(44,13,18,15),(45,18,13,15),(46,16,18,36),(47,18,16,36),(48,14,15,5),(49,15,14,5),(50,18,17,37),(51,17,18,37),(52,15,20,42),(53,20,15,42),(54,16,17,3),(55,17,16,3),(56,17,21,25),(57,21,17,25),(58,21,20,17),(59,20,21,17),(60,21,23,20),(61,23,21,20),(62,18,19,7),(63,19,18,7),(64,19,22,22),(65,22,19,22),(66,23,25,24),(67,25,23,24),(68,25,26,8),(69,26,25,8),(70,22,25,78),(71,25,22,78),(72,22,24,45),(73,24,22,45),(74,24,26,52),(75,26,24,52),(76,24,27,232),(77,27,24,232),(78,27,26,273),(79,26,27,273),(80,12,27,260),(81,27,12,260),(82,15,17,17),(83,17,15,17),(84,8,9,14),(85,9,8,14),(86,5,3,21),(87,3,5,21),(88,20,17,25),(89,17,20,25);
/*!40000 ALTER TABLE `edges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vertices`
--

DROP TABLE IF EXISTS `vertices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vertices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `x1` varchar(45) DEFAULT NULL,
  `y1` varchar(45) DEFAULT NULL,
  `x2` varchar(45) DEFAULT NULL,
  `y2` varchar(45) DEFAULT NULL,
  `x_center` varchar(45) DEFAULT NULL,
  `y_center` varchar(45) DEFAULT NULL,
  `description` varchar(800) DEFAULT NULL,
  `imagePath` varchar(45) DEFAULT NULL,
  `url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vertices`
--

LOCK TABLES `vertices` WRITE;
/*!40000 ALTER TABLE `vertices` DISABLE KEYS */;
INSERT INTO `vertices` VALUES (1,'عكا','206','89','220','103','213','96','عكا  هي من أقدم وأهم مدن فلسطين التاريخية، تقع على الساحل الشرقي للبحر الأبيض المتوسط. تبعد عن القدس حوالي 181 كم إلى الشمال الغربي. وتبلغ مساحتها 13.5 كم2، كما بلغ عدد سكانها حوالي 46 ألف نسمة في عام 2008.','src/cities/akka.jpeg','https://en.wikipedia.org/wiki/Acre,_Israel'),(2,'صفد','273','77','287','91','280','84','صفد هي إحدى مدن فلسطين التاريخية،  كما تُعتبر واحدة من أكثر مدن البلاد إرتفاعا عن سطح البحر بحوالي 900 متر فوق سطح البحر. تقع على بعد 134 كم شمال القدس وتطل على بحيرة طبريا ومرج بيسان الواقعين إلى الجنوب الشرقي منها وعلى جبل الجرمق إلى الغرب. و تبلغ مساحة المدينة 29.248 كم²، ويقطنها اليوم حوالي 28,000 نسمة','src/cities/safad.jpg','https://en.wikipedia.org/wiki/Safed'),(3,'الناصرة','239','127','253','141','246','134','الناصرة  من أهم مدن فلسطين التاريخية، وتبعد عن القدس حوالي 105 كم إلى الشمال. أصبحت المدينة بعد النكبة عام 1948 مركزًا إداريًا وثقافيًا والمركز الرئيسي لعرب 48  بلغ عدد سكان مدينة الناصرة في عام 2011 حوالي 73,600 نسمة.[5][6][7][8] ويَصل عدد سكان متروبولين الناصرة حوالي 210,000 نسمة','src/cities/nasrah.jpg','https://en.wikipedia.org/wiki/Nazareth'),(4,'حيفا','193','107','207','121','200','114','حيفا هي من أكبر وأهم مدن فلسطين التاريخية، تقع على الساحل الشرقي للبحر المتوسط، وتبعد عن القدس حوالي 158 كم إلى الشمال الغربي. يبلغ عدد سكانها حوالي 272,181 نسمة إضافة إلى 300,000 يعيشون في الضواحي السكنية حول المدينة، مما يجعلها ثالث أكبر مدن البلاد حالياً بعد القدس وتل أبيب من حيث السكان، الذين يشكل اليهود منهم الغالبية، بينما يشكل العرب (مسيحيون ومسلمون) الأقلية بعد تهجير معظمهم في النكبة عام 1948.[5][6]','src/cities/haifa.jpg','https://en.wikipedia.org/wiki/Haifa'),(5,'طبريا','277','121','291','135','284','128','طبريا أو طبرية هي من أقدم مدن فلسطين التاريخية، تقع اليوم في لواء الشمال الفلسطيني في منطقة الجليل الشرقي تحديدا، على الشاطئ الجنوبي الغربي من البحيرة التي تحمل اسمها - بحيرة طبريا. تبعد عن القدس حوالي 198 كم إلى الشمال الشرقي. يسكنها اليوم حوالي 46 ألف نسمة - معظمهم من اليهود، بعد تهجير أهلها العرب بفعل حرب 1948.[3]','src/cities/tabarya.jpg','https://en.wikipedia.org/wiki/Tiberias'),(6,'بيسان','276','158','290','172','283','165','بيسان  هي من أقدم مدن فلسطين التاريخية. تقع على بعد 83 كم شمال شرق القدس. تمتد المدينة على مساحة 7330 دونماً (7،33 كم2)، ويبلغ عدد سكانها 16,200 نسمة معظمهم من اليهود بعد تهجير أهلها العرب في حرب 1948. تقع مدينة بيسان في قلب مرج بيسان الذي يصل غور الأردن بمرج ابن عامر، جنوب شرق مدينة الناصرة، والى الشرق من مدينة جنين الفلسطينية، والى الغرب من مدينة أم قيس الأردنية ونهر الأردن.','src/cities/besan.jpg','https://en.wikipedia.org/wiki/Beit_She%27an'),(7,'جنين','244','166','258','180','251','173','جنين مدينة فلسطينية، ومركز محافظة جنين وأكبر مدنها، تقع في شمال الضفة الغربية التابعة للسلطة الفلسطينية. تعتبر تاريخيا، إحدى مدن المثلث في شمال فلسطين، وتبعد عن القدس مسافة 75 كيلومترا إلى الشمال. تطل جنين على غور الأردن من ناحية الشرق، ومرج بن عامر إلى جهة الشمال.\nبالرغم من قلة عدد سكانها حتى تاريخ وقوع النكبة مقارنة بالمدن الفلسطينية الأخرى، إلا أن لها ثقلا اقتصاديا أكبر بكثير من حجمها السكاني. يبلغ عدد سكان المدينة 39,000 نسمة، أما المحافظة فيقطنها حوالي 256,000 نسمة','src/cities/jenin.JPG','https://en.wikipedia.org/wiki/Jenin'),(8,'الخضيرة','181','167','195','181','188','174','الخضيرة تسمى بالعبري  حديرا , هي مدينة تقع في منطقة حيفا في إسرائيل تقريباً في منتصف الطريق بين تل أبيب وحيفا. أوجدت المدينة على شكل قرية أقامها يهود مهاجرون من أوروبا الشرقية من جماعة حوفيفي صهيون عام 1891م بعد أن اشترى الأرض الناشط اليهودي يهوشع حنكين من أفندي مسيحي يدعى سليم خوري حيث كانت الأرض المحيطة بالقرية مستنقعات في حين أن سكانها كانوا من البدو والرعاة العرب الذين يقوا يرعون مواشيهم في أرض القرية في حين تخللت علاقتهم مع اليهود فترات غير مستقرة. يقع في قلب المدينة كنيس يهودي وإلى جانبه بقايا خان عربي قديم الذي استخدم كسكن أولي للمستوطنين الأوائل في القرية.','src/cities/khadira.jpg','https://en.wikipedia.org/wiki/Hadera'),(9,'نتانيا','177','188','191','202','184','195','نتانیا  مدينة قامت على اراضي مدينة أم خالد الفلسطينية، تقع في المقاطعة المركزة الشمالية في إسرائيل وعاصمة سهل شارون. تقع بين سيل پوليچ ومعهد وينچيت في الجنوب وسيل افيخيل في الشمال. جعل منها 14 كيلومتر (8.7 ميل) من الشواطئ مدينة منتجع سياحي شهيرة جدا. اليوم المدينة تحتوي على عدد كبير من السكان لالناطقين بالإنجليزية بسبب المهاجرين من المملكة المتحدة، الولايات المتحدة الأمريكية وكندا. حسب دائرة الإحصاء المركزية, في نهاية عام 2007 في مدينة كان عدد السكان البالغ حوالي 176500.[2] عمدة المدينة ميريام فيربرچ. ويتوقع أن المدينة ستصل إلى عدد سكان يباغ 350،000 نسمة بحلول عام 2020.[3]','src/cities/natanya.jpg','https://en.wikipedia.org/wiki/Netanya'),(10,'طول كرم','202','188','216','202','209','195','طُولكرم؛ هي مدينة فلسطينية تقع شمالَ غربيّ الضّفّةُ الغربيّة في مُنتصفِ السهل الساحلي طُولاً. ترتفعُ عن سطحِ البحر من 55 مترًا وحتّى 125 متر. تبلغُ مساحةُ أراضيها 32,610 دونم، وتبعدُ نحوَ 15 كم عن ساحلِ البحر الأبيض المتوسط. تُعتبر مدينة طولكرم مركز مُحافظة طولكرم، ويترأس بلديّتها المُهندس إياد الجلّاد.والمحافظة المحافظ عصام أبو بكر .\nيُعتبر موقع المدينة تاريخيًّا موقعًا ذو أهميّة تجاريّة وعسكريّة فكان له دور كبير بنمو المدينة؛ فطولكرم مُلتقى الطُّرق التجاريّة وممرًا للغزواتِ الحربيّة بين مصر والشّام، كما أنّها مركز للمُواصلات البريّة بين الساحل والدّاخل وبين الشّمال والجنوب. يتميّز موقع طولكرم بخُصوبةِ التُربة ووفرة المياه فيه بشكلٍ كبير سواءً أكان ذلك مطريًّا أو جوفيًّا، هذه الظُروف أدّت بشكلٍ كبير لنُموّ المدينة وتطوّرها.','src/cities/Tulkarm3.JPG','https://en.wikipedia.org/wiki/Tulkarm'),(11,'نابلس','237','209','251','223','244','216','نابلس إحدى أكبر المدن الفلسطينية سكانًا وأهمها موقعًا. هي عاصمة فلسطين الاقتصادية ومقر أكبر الجامعات الفلسطينية. تعتبر نابلس عاصمة شمال الضفة الغربية إضافةً إلى كونها مركزاً لمحافظة نابلس التي تضم 56 قرية ويُقدر عدد سكانها بقرابة 321,000 نسمة حسب إحصاءات عام 2007.[6] تُعرف أيضا بأسماء جبل النار ودمشق الصغرى وعش العلماء وملكة فلسطين غير المتوجة.[1]','src/cities/nablus.jpg','https://en.wikipedia.org/wiki/Nablus'),(12,'أريحا','263','280','277','294','270','287','أريحا هي مدينة فلسطينية تاريخية قديمة تقع علي الضفة الغربية بالقرب من نهر الأردن وعند شمال البحر الميت، والتي يعود تاريخها إلى 10,000 سنة قبل الميلاد. هي عاصمة محافظة أريحا وهي أقدم المدن في التاريخ. في عام 2007، بلغ عدد سكانها 18,110 نسمة.[2] كانت تخضع تحت الأدارة الأردنية بين 1948-1967، وبعد ذلك خضعت للإدارة الإسرائيلية، وفي عام 1994 أستلمت السطلة الوطنية الفلسطينية إدارة المدينة.[3][4][5] وتقع على بعد 16 كم (10 أميال) عن البحر الميت. تعتبر مدينة أريحا أخفض منطقة في العالم.[6][7][8]. تُعرف أيضا باسم مدينة القمر.','src/cities/Jericho.jpg','https://en.wikipedia.org/wiki/Jericho'),(13,'رام الله','229','279','243','293','236','286','رام الله مدينة فلسطينية، ومركز محافظة رام الله والبيرة. تقع في الضفة الغربية إلى الشمال من القدس بحوالي 15 كم. تبلغ مساحتها 16,5 كم2، كما يقدر عدد سكانها بحوالي 29,577 نسمة، بينما يقدر عدد سكان المحافظة بحوالي 301,296 نسمة.[5] وتلاصق رام الله مدينة البيرة حتى تتداخل مبانيهما وشوارعهما لتبدوان كمدينة واحدة، ومع أن مدينة البيرة أكبر من ناحية المساحة وعدد السكان، إلا أن الأشهر بينهما هي مدينة رام الله.','src/cities/PS-Ramallah_view.JPG','https://en.wikipedia.org/wiki/Ramallah'),(14,'تل أبيب','162','238','176','252','169','245','تل أبيب (بمعنى \"تل الربيع\") مدينة إسرائيلية. تم تسميتها بـ \"تل أبيب - يافا\" (بالعبرية: תל אביב-יפו) بعد احتلال الأخيرة وتهجير معظم أهلها وضمها عام 1949. تقع على ساحل البحر الأبيض المتوسط، وتعد الآن (بعد تقسيم فلسطين) ثاني أكبر مدينة إسرائيلية من حيث عدد السكان والمساحة في تجمع جوش دَن الحضري، يسكنها حوالي 3.3 مليون شخص ابتدأ من 2010.[4]. المدينة تدار من قبل أمانة تل أبيب - يافا، عمدتها الحالي هو رون حولداي. وتوجد بها جميع سفارات الدول الأجنبية التي تقيم علاقات ديبلوماسية مع إسرائيل.[5]','src/cities/280px-Tel_Aviv_P5280003.JPG','https://en.wikipedia.org/wiki/Tel_Aviv'),(15,'يافا','159','249','173','263','166','256','يافا  هي من أقدم وأهم مدن فلسطين التاريخية. تقع اليوم ضمن بلدية \"تل أبيب - يافا\" الإسرائيلية، على الساحل الشرقي للبحر الأبيض المتوسط - حسب التقسيم الإداري الإسرائيلي. وتبعد عن القدس بحوالي 55 كيلومتر إلى الغرب. كانت لفترة طويلة تحتل مكانة هامة بين المدن الفلسطينية الكبرى من حيث المساحة وعدد السكان والموقع الإستراتيجي، حتى تاريخ وقوع النكبة عام 1948، وتهجير معظم أهلها العرب.[6] يسكنها اليوم قرابة 60,000 نسمة معظمهم من اليهود، وأقلية عربية من المسلمين والمسيحيين.','src/cities/jaffa.jpeg','https://en.wikipedia.org/wiki/Jaffa'),(16,'اللد','172','265','186','279','179','272','اللد من أكبر وأقدم مدن فلسطين التاريخية، تقع اليوم في اللواء الأوسط الإسرائيلي على بعد 38 كم شمال غرب القدس. أسسها الكنعانيون في الألف الخامس قبل الميلاد، وتمّ ذكرها في العديد من المصادر التاريخية. تقع اللد على مسافة 16 كم جنوب شرق مدينة يافا و5 كم شمال شرق الرملة. في الماضي سيطرت المدينة على الطريق الرئيسية وخط سكك الحديد يافا - القدس. وتبلغ مساحتها حوالي 12.2 كم2، ويسكنها اليوم خليط من اليهود والعرب، بعد تهجير غالبية سكانها العرب بعد حرب 1948، ووصل عدد سكانها في عام 2011م إلى 70,270 نسمة.','src/cities/lod.jpg','https://en.wikipedia.org/wiki/Lod'),(17,'الرملة','171','278','185','292','178','285','الرملة من أكبر وأقدم مدن فلسطين التاريخية. تقع على بعد 38 كم شمال غرب القدس. تأسست سنة 716 م على يد الخليفة الأموي سليمان بن عبد الملك، وسميت نسبة إلى الرمال التي كانت تحيطها. حسب السجلات الإسرائيلية من سنة 2004 بلغ عدد سكان الرملة 64,200 نسمة - ثلثهم من العرب، بسبب تهجير معظمهم منها بعد حرب 1948. تمتد المدينة على مساحة 11,854 دونما (11.9 كم2). وترتفع عن سطح البحر حوالي 108 م .','src/cities/ramla.jpg','https://en.wikipedia.org/wiki/Ramla'),(18,'القدس','229','298','243','312','236','305','القُدْس  أكبر مدن فلسطين التاريخية مساحةً وسكاناً وأكثرها أهمية دينيًا واقتصاديًا. تُعرف بأسماء أخرى في اللغة العربية مثل: بيت المقدس، القدس الشريف، وأولى القبلتين، وتُسميها إسرائيل رسميًا: أورشليم','src/cities/jerusalem.jpg','https://en.wikipedia.org/wiki/Jerusalem'),(19,'بيت لحم','227','310','241','324','234','317','بيت لحم هي مدينة فلسطينية، ومركز محافظة بيت لحم. تقع في الضفة الغربية التابعة للسلطة الفلسطينية على بعد 10 كم إلى الجنوب من القدس. يبلغ عدد سكانها 30,000 نسمة بدون سكان مخيمات اللاجئين. وتعتبر مركزاً للثقافة والسياحة في فلسطين','src/cities/Bethlehem_skyline,_West_Bank.jpg','https://en.wikipedia.org/wiki/Bethlehem'),(20,'أشدود','132','307','146','321','139','314','إِسْدُود هي مدينة ساحلية تقع على البحر الأبيض المتوسط، بناها الكنعانيون الذين سكنوا فلسطين التاريخية حوالي عام 3000 قبل الميلاد. تعتبر مدينة أشدود السادسة كبرًا من حيث عدد السكان حيث يبلغ عدد سكانها 217,959 نسمة حسب إحصائيات ديسمبر 2014. وتقع ضمن لواء الجنوب حسب التقسيم الإداري الإسرائيلي. يعتبر مينائها الأهم في إسرائيل. جراء حرب 1948 هاجر معظم سكانها العرب إلى غزة وغيرها.','src/cities/Ashdod_Marina_Aerial_View.jpg','https://en.wikipedia.org/wiki/Ashdod'),(21,'عسقلان','126','325','140','339','133','332','المجدل - عسقلان من أكبر وأقدم مدن فلسطين التاريخية. تقع اليوم في اللواء الجنوبي الإسرائيلي على بعد 65 كم غرب القدس. أسس الكنعانيون المدينة في الألف الثالث قبل الميلاد، وكانت أحد موانئ الفلسطينيين القدماء على ساحل البحر المتوسط. تقع إلى الشمال الشرقي من غزة، وتبعد عنها 25 كم قريبة من الشاطئ على الطريق بين غزة ويافا. تبلغ مساحة أراضيها 107,334 دونما بما فيها مساحة المدينة 1,346 دونما. يشكل اليهود اليوم السواد الأعظم من سكان المدينة، بعد تهجير أهلها العرب في حرب 1948 الذين انتقل الكثير منهم إلى قطاع غزة. أقدمت بعدها المنظمات اليهودية المسلحة بعد احتلالها للمدينة في نوفمبر 1948 على هدمها، واقامت إسرائيل على أراضيها مدينة \"اشكلون\". ويعتبر الجامع الكبير من أبرز أثار المجدل بناه \"سيف الدين سلار\" من امراء المماليك عام 1300.','src/cities/asqalan.jpg','https://en.wikipedia.org/wiki/Ashkelon'),(22,'الخليل','200','344','214','358','207','351','الخليل مدينة فلسطينية، ومركز محافظة الخليل. تقع في الضفة الغربية إلى الجنوب من القدس بحوالي 35 كم. أسسها الكنعانيون في العصر البرونزي المبكر، وتُعتبر اليوم أكبر المدن الضفة الغربية من حيث عدد السكان والمساحة، حيث قُدر عدد سكانها في عام 2014 بقرابة 200 ألف نسمة،[4] وتبلغ مساحتها 42 كم2.[5] تمتاز المدينة بأهمية اقتصادية، حيث تُعتبر من أكبر المراكز الاقتصادية في الضفة الغربية. وللخليل أهمية دينية للديانات الإبراهيمية الثلاث، حيث يتوسط المدينة المسجد الإبراهيمي الذي يحوي مقامات للأنبياء إبراهيم، وإسحق، ويعقوب، وزوجاتهم.','src/cities/hebron.jpg','https://en.wikipedia.org/wiki/Hebron'),(23,'غزة','114','343','128','357','121','350','غزة مدينة ساحلية فلسطينية، وأكبر مدن قطاع غزة وتقع في شماله، في الطرف الجنوبي للساحل الشرقي من البحر المتوسط. تبعد عن القدس مسافة 78 كم إلى الجنوب الغربي، وهي مركز محافظة غزة وأكبر مدن السلطة الفلسطينية من حيث تعداد السكان. حيث أن عدد سكان محافظة غزة بلغ 700 ألف نسمة في عام 2013،[2] ما يجعلها أكبر تجمع للفلسطينيين في فلسطين. كما تبلغ مساحتها 56 كم2، مما يجعلها من أكثر المدن كثافة بالسكان في العالم.','src/cities/280px-Gaza_City.jpg','https://en.wikipedia.org/wiki/Gaza_City'),(24,'بئر السبع','160','396','174','410','167','403','بئر السبع من أكبر وأقدم مدن فلسطين التاريخية، تقع اليوم في لواء الجنوب الإسرائيلي على بعد 71 كم جنوب غرب القدس. وهي أكبر مدن منطقة النقب الصحراوية، إذ تسمى أحيانا \"عاصمة النقب\". وتعتبر المدينة، المركز الإداري والتجاري لهذه المنطقة التي تمتد جنوبا حتى مدينة إيلات.\nتمتد مدينة بئر السبع على مساحة 84 كم2 وبلغ عدد سكانها 185,100 نسمة في ديسمبر 2005 (حسب معلومات دائرة الإحصائيات الإسرائيلية). الأغلبية الساحقة من سكان المدينة هم من اليهود، بعد تهجير معظم سكانها العرب في حرب 1948، غير أن العديد من سكان القرى البدوية المجاورة يمرون فيها كل يوم إذ كانت مركزا إقليميا لهم. أعلنت منظمة يونسكو أطلال مدينة بئر السبع القديمة، التي عثر عليها في حفريات أثرية شمالي شرقي المدينة، موقعا للتراث العالمي في 2005.','src/cities/beer_shevaa.jpg','https://en.wikipedia.org/wiki/Beersheba'),(25,'خان يونس','86','373','100','387','93','380','خان يونس هي مدينة فلسطينية، ومركز محافظة خان يونس. تقع في الجزء الجنوبي من قطاع غزة، وتبعد عن القدس مسافة 100 كم إلى الجنوب الغربي. يحدها من الجنوب مدينة رفح ومن الشمال مدينة دير البلح، وهي مركز محافظة ساحلية تطل على البحر الأبيض المتوسط من جهة الغرب ومن الشرق إسرائيل.[5] تعتبر خان يونس ثاني أكبر مدينة في قطاع غزة من حيث السكان والمساحة بعد مدينة غزة، حيث يبلغ عدد سكانها اليوم قرابة 200,000 نسمة، وهو ما يمثل 17% من سكان قطاع غزة. كما تبلغ مساحتها 54 كيلومترا مربعا، مما يجعلها واحدة من أكثر المدن الفلسطينية كثافة بالسكان.','src/cities/khan_younus.jpg','https://en.wikipedia.org/wiki/Khan_Yunis'),(26,'رفح','83','387','97','401','90','394','رفح هي مدينة فلسطينية حدودية، ومركز محافظة رفح. تقع في أقصى جنوب قطاع غزة التابع للسلطة الفلسطينية، وتبعد عن القدس حوالي 107 كم إلى الجنوب الغربي.[3] تعتبر المدينة أكبر مدن القطاع على الحدود المصرية، حيث تبلغ مساحتها 55 كم2، وقد بلغ عدد سكانها عام 2006 قرابة 120,000 نسمة.','src/cities/280px-Rafah-11252.jpg','https://en.wikipedia.org/wiki/Rafah'),(27,'إيلات','184','686','198','700','191','693','إيلات أو أيلة أو أم الرشراش  مدينة وميناء على ساحل خليج العقبة في البحر الأحمر، بنيت عام 1952 وتقع في أقصى جنوب فلسطين بين مدينة العقبة الأردنية من الشرق وبلدة طابا المصرية من الغرب. تحتوي المدينة على ميناء يصل إسرائيل بموانئ الشرق الأقصى، ويوجد فيها مطارين -مطار صغير داخل المدينة وآخر اكبر يبعد 50كم شمالا عنها- يخدمان السياح، كما يربطها معبر حدودي مع مدينة العقبة الاردنية، أما من ناحية المواصلات البرية تعتبر إيلات منعزلة عن باقي المدن الإسرائيلية؛ إذ يصل إليها شارع رئيسي واحد فقط يمر من وادي عربة. لم يتم رسم الحدود الإسرائيلية المصرية بين إيلات وطابا إلا في عام 1988 بعد اتفاقية كامب ديفيد، ومنذ ذلك الحين يوجد معبر حدودي مفتوح على مدار الساعة يخدم السياح العابرين من شبه جزيرة سيناء إلى إيلات.','src/cities/300px-Eilat_ST_05.jpg','https://en.wikipedia.org/wiki/Eilat');
/*!40000 ALTER TABLE `vertices` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-05-28  8:49:29
