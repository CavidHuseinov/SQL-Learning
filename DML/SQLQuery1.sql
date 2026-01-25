--Birinci Table Create edek adini ne qoyaq ?
--real bir veziyyet kimi qoymaq isteyirem "products" qoyaq
USE first_lesson
GO
CREATE TABLE products
(
id INT IDENTITY (100,1) PRIMARY KEY, -- 100den baslasin camaat ele bilsin mehuslumuz coxdur :)
product_name VARCHAR(50) NOT NULL,  --50 besdi
product_description VARCHAR(MAX), -- burda uje limit vermiyek SEO destek olar hemde
product_price DECIMAL(10,2) NOT NULL, --qepikde ola biler nezere almaq lazimdir kardes
--category , tag, elave etmek ucun relation lazimdi onuda zamanla tekminlesdirerem istifade ederem
)

-- indi nagaraq icine data dolduraq ayib olar, ozum mu dolduracam ? YOX AI yazacaq 
INSERT INTO products (product_name, product_description, product_price)
VALUES
('Laptop Pro 14',
 'Yüksək performanslı bu noutbuk ofis işi, proqramlaşdırma və gündəlik istifadə üçün nəzərdə tutulmuşdur. Güclü prosessoru və uzunömürlü batareyası sayəsində fasiləsiz işləmək mümkündür.',
 2499.99),

('Laptop Air 13',
 'Yüngül və nazik dizayna malik bu model səyahət edən və mobil işləyən istifadəçilər üçün idealdır. Sürətli açılma və stabil performans təqdim edir.',
 1799.50),

('Oyun Noutbuku X',
 'Qrafik baxımdan ağır oyunlar və render işləri üçün hazırlanmış güclü oyun noutbukudur. Yüksək yenilənmə tezliyi və effektiv soyutma sistemi mövcuddur.',
 3299.00),

('Ofis Noutbuku Basic',
 'Sadə ofis proqramları, internet və sənədlərlə işləmək üçün uyğun olan sərfəli noutbuk modelidir. Tələbələr və ofis işçiləri üçün nəzərdə tutulub.',
 899.99),

('Ultrabook Z',
 'Premium sinif ultrabuk uzun batareya ömrü və keyfiyyətli ekranla təchiz olunub. İşgüzar istifadə üçün yüksək etibarlılıq təqdim edir.',
 1999.90),

('Smartfon A1',
 'Gündəlik istifadə üçün münasib qiymətli smartfondur. Güclü batareyası və stabil sistemi ilə uzun müddət problemsiz işləyir.',
 399.99),

('Smartfon A2',
 'Orta seqment üçün nəzərdə tutulmuş bu smartfon yüksək keyfiyyətli ekran və yaxşı kamera imkanları təqdim edir.',
 699.99),

('Smartfon Pro Max',
 'Peşəkar kamera sistemi və yüksək sürətli prosessorla təchiz olunmuş premium smartfon modelidir.',
 1299.00),

('Smartfon Mini',
 'Kompakt ölçülü bu telefon bir əllə rahat istifadə üçün idealdır. Kiçik ölçüsünə baxmayaraq yüksək performans göstərir.',
 549.49),

('Smartfon Ultra',
 'Ən son texnologiyalarla təchiz olunmuş flaqman smartfondur. Yüksək yaddaş həcmi və sürətli işləmə təqdim edir.',
 1399.99),

('Simsiz Maus',
 'Erqonomik dizayna malik simsiz maus uzunmüddətli istifadə zamanı əl yorğunluğunu azaldır.',
 29.99),

('Oyun Mausu',
 'Yüksək DPI dəstəyi ilə oyunçular üçün nəzərdə tutulmuş peşəkar mausdur.',
 79.99),

('Mexaniki Klaviatura',
 'Mexaniki düymələri və RGB işıqlandırması olan bu klaviatura həm oyun, həm də proqramlaşdırma üçün uyğundur.',
 149.99),

('Ofis Klaviaturası',
 'Səssiz düymələri olan bu klaviatura ofis mühitində rahat və sakit işləmək üçün idealdır.',
 39.99),

('Simsiz Klaviatura',
 'Bluetooth bağlantısı olan simsiz klaviatura masa üzərində səliqəli görüntü yaradır.',
 59.99),

('27 Düym Monitor',
 '4K keyfiyyətli geniş ekran monitoru dizayn və analiz işləri üçün uyğundur.',
 499.99),

('24 Düym Monitor',
 'Full HD təsvir keyfiyyəti ilə gündəlik istifadə üçün optimal monitordur.',
 229.99),

('Oyun Monitoru',
 'Yüksək yenilənmə tezliyi olan bu monitor oyun təcrübəsini maksimum səviyyəyə çatdırır.',
 599.00),

('Əyri Monitor',
 'Ultra geniş əyri ekran eyni anda bir neçə proqramla işləmək üçün əlverişlidir.',
 799.99),

('Portativ Monitor',
 'Yüngül və daşınması asan olan bu monitor səfər zamanı ikinci ekran kimi istifadə olunur.',
 299.99),

('USB Flash 32GB',
 'Məlumatların saxlanması və ötürülməsi üçün nəzərdə tutulmuş sürətli USB yaddaş qurğusudur.',
 9.99),

('USB Flash 64GB',
 'Daha böyük yaddaş həcmi ilə sənədlər və fayllar üçün rahat istifadə imkanı yaradır.',
 14.99),

('USB Flash 128GB',
 'Yüksək tutuma malik bu USB yaddaş böyük faylların saxlanması üçün idealdır.',
 24.99),

('Xarici HDD 1TB',
 'Ehtiyat nüsxə və arxivləmə üçün nəzərdə tutulmuş portativ sərt diskdir.',
 69.99),

('Xarici SSD 1TB',
 'Sürətli oxuma və yazma imkanları ilə məlumatlara tez çıxış imkanı yaradır.',
 129.99),

('Bluetooth Səsgücləndirici',
 'Portativ dizayna malik bu səsgücləndirici açıq və qapalı məkanlar üçün uyğundur.',
 49.99),

('Ağıllı Saat Lite',
 'Gündəlik fiziki aktivliyi izləmək üçün nəzərdə tutulmuş sadə ağıllı saatdır.',
 149.99),

('Ağıllı Saat Pro',
 'GPS və sağlamlıq izləmə funksiyaları olan inkişaf etmiş ağıllı saatdır.',
 399.99),

('Fitness Bilərzik',
 'Addım sayma və yuxu analizi funksiyaları ilə sağlam həyat tərzini dəstəkləyir.',
 79.99),

('Ofis Kreslosu',
 'Erqonomik dizaynlı bu kreslo uzun müddət oturaraq işləyənlər üçün nəzərdə tutulmuşdur.',
 249.99);

-- qeseng doldurdu, indi baxaq icine dusubmu
SELECT * FROM products
-- BIY SSMS ə hərfin görə bilmirmiş neyniyək o zaman update edək ai deyim ə siz yazsın value
-- amma deyim ki ssms tanimasada hansisa kodda db kimi işlədəndə get edəndə görür

UPDATE products
SET product_description = CASE id
    WHEN 100 THEN 'Yuksek performansli bu noutbuk ofis isi, proqramlasdirma ve gundelik istifade ucun nezere tutulmusdur. Guclu prosessoru ve uzunomurlu batareyasi sayesinde fasilesiz isleemek mumkundur.'
    WHEN 101 THEN 'Yungul ve nazik dizayna malik bu model seyahat eden ve mobil isleyen istifadeciler ucun idealdir. Suretli acilma ve stabil performans teqdim edir.'
    WHEN 102 THEN 'Qrafik baximdan agir oyunlar ve render isleri ucun hazirlanmis guclu oyun noutbukudur. Yuksek yenilenme tezliyi ve effektiv soyutma sistemi movcuddur.'
    WHEN 103 THEN 'Sade ofis proqramlari, internet ve senedlerle isleemek ucun uygun olan serfeli noutbuk modelidir. Telebeler ve ofis iscileri ucun nezere tutulub.'
    WHEN 104 THEN 'Premium sinif ultrabuk uzun batareya omru ve keyfiyyetli ekranla techiz olunub. Isguzar istifade ucun yuksek etibarliliq teqdim edir.'
    WHEN 105 THEN 'Gundelik istifade ucun munasib qiymetli smartfondur. Guclu batareyasi ve stabil sistemi ile uzun muddet problemsiz isleemek mumkundur.'
    WHEN 106 THEN 'Orta segment ucun nezere tutulmus bu smartfon yuksek keyfiyyetli ekran ve yaxshi kamera imkanlari teqdim edir.'
    WHEN 107 THEN 'Peshekar kamera sistemi ve yuksek suretli prosessorla techiz olunmus premium smartfon modelidir.'
    WHEN 108 THEN 'Kompakt olculu bu telefon bir elle rahat istifade ucun idealdir. Kicik olcusune baxmayaraq yuksek performans gosterir.'
    WHEN 109 THEN 'En son texnologiyalarla techiz olunmus flagman smartfondur. Yuksek yaddaş hecmi ve suretli isleemek teqdim edir.'
    WHEN 110 THEN 'Erqonomik dizayna malik simsiz maus uzunmuddetli istifade zamani el yorğunluqunu azaldir.'
    WHEN 111 THEN 'Yuksek DPI desteyi ile oyuncular ucun nezere tutulmus peshekar mausdur.'
    WHEN 112 THEN 'Mexaniki duymeleri ve RGB isiqlandirmasi olan bu klaviatura hem oyun, hem de proqramlasdirma ucun uygundur.'
    WHEN 113 THEN 'Sessiz duymeleri olan bu klaviatura ofis muhitede rahat ve sakit isleemek ucun idealdir.'
    WHEN 114 THEN 'Bluetooth baglantisi olan simsiz klaviatura masa uzərində seliqeli goruntu yaradir.'
    WHEN 115 THEN '4K keyfiyyetli genis ekran monitoru dizayn ve analiz isleri ucun uygundur.'
    WHEN 116 THEN 'Full HD tesvir keyfiyyeti ile gundelik istifade ucun optimal monitordur.'
    WHEN 117 THEN 'Yuksek yenilenme tezliyi olan bu monitor oyun tecrubesini maksimum seviyeye catdirir.'
    WHEN 118 THEN 'Ultra genis eyri ekran eyni anda bir nece proqramla isleemek ucun elverislidir.'
    WHEN 119 THEN 'Yungul ve dasinmasi asan olan bu monitor sefer zamani ikinci ekran kimi istifade olunur.'
    WHEN 120 THEN 'Melumatlarin saxlanmasi ve oturulmesi ucun nezere tutulmus suretli USB yaddaş qurğusudur.'
    WHEN 121 THEN 'Daha boyuk yaddaş hecmi ile senedler ve fayllar ucun rahat istifade imkani yaradir.'
    WHEN 122 THEN 'Yuksek tutuma malik bu USB yaddaş boyuk fayllarin saxlanmasi ucun idealdir.'
    WHEN 123 THEN 'Ehtiyat nusxe ve arxivleme ucun nezere tutulmus portativ sert diskdir.'
    WHEN 124 THEN 'Suretli oxuma ve yazma imkanlari ile melumatlara tez chixis imkani yaradir.'
    WHEN 125 THEN 'Portativ dizayna malik bu sesguclendirici aciq ve qapali mekanlar ucun uygundur.'
    WHEN 126 THEN 'Gundelik fiziki aktivliyi izləmək ucun nezere tutulmus sade agilli saatdir.'
    WHEN 127 THEN 'GPS ve saglamliq izləmə funksiyalari olan inkişaf etmis agilli saatdir.'
    WHEN 128 THEN 'Addim sayma ve yuxu analizi funksiyalari ile saglam heyat terzini destekleyir.'
    WHEN 129 THEN 'Erqonomik dizaynli bu kreslo uzun muddet oturaraq isleemek ucun nezere tutulmusdur.'
END

--neyse id 129 silek beyenmedim
DELETE FROM products
WHERE id =129;

--baxaq gorek silinib mi 
SELECT * FROM products
WHERE id=129
--bosdu baxaq gorek tam silib yoxsa id icini bos saxlayib
SELECT * FROM products
--tam silib amma boyuk ehtimal yaradanda yeni id ile yaradacaq cunki sql bele isleyir auto id teyin edende bele olur
