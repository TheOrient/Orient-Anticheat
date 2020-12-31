# Orient-Anticheat
Fivem Sunucular İçin Geliştirilmiş AntiCheat

Uzun süredir sürekli ekleme yaptığım, iyi olmasını hedeflediğim projemi sonlandırdım ve son halini sizinle paylaşıyorum.
Mükemmel yapmayı hedeflemiştim ancak mükemmel olmasada piyasada paylaşılan anticheat projelerine oranla kendimce olağanüstü buluyorum. 

Özelliklerine Gelirsek:

-    AntiPowerCheat: Oyuncuların hile ile power kullanarak diğer oyunculara karşı üstünlük kurmasını engellemek. (Görünmezlik,Hızlı Koşma,Super Zıplama,Silah Hasarlarının    değişmesi vb.)
-    AntiFirePlayer: Oyuncuların yanarak ölmesini engeller.
-    PlayerProtection: Oyuncuların hile ile ölmesini engeller. Oyuncuları korur. (Patlama vb.)
-    AntiPedAttack:Pedlerden hasar almanızı engeller.
-    AntiCarRam: Oyuncuları araçla ezielrek ölmesini engeller. (Birçok hile menüsü fix)
-    AntiGodMode: God Mode açılmasını engeller.
-    AntiBlips: Blips açılarak oyuncuların mapte yerinin görülmesini engeller.
-    AntiCheatEngine: Cheat Engine ile hile yapılmasını engeller. Araç hash değişmesini engeller.
-    Antiİnjection:Menü inject etmeyi engeller.
-    AntiSpectate:Spectate etmeyi engeller.
-    AntiCMD: CMD down ve crash etmeyi engeller.
-    AntiCarDestroy:Araç saldırılarını engeller.(.asi Menüleri Fix)
-    AntiKey: Belirli tuşlara basılmasını log tutar yada kickler.
-    TriggerDetection:Belirli triggerlerin çalıştırılmasını engeller. (Mevcut triggerleri özel programımızla değiştirip sahte trigger yaparak hilecileri yakalayabilirsiniz.)
-    ResourceCheck:Script durdurmayı,başlatmayı,yeniden başlatmayı ve dondurmayı engeller.
-    BlaclistCommand: Yasaklı komutları engeller. (Birçok menü fix)
-    BlacklistWeapon: Yasaklı silahları engeller. Sınırsız mermiyi engeller. 
-    BlacklistPed: Yasaklı pedleri engeller.
-    BlacklistProp: Yasaklı objeleri engeller.
-    BlacklistExplosion: Yasaklı patlamaları engeller.
-    SpamEntity: Obje spamlamayı engeller.
-    Gelişmiş Admin Menü: Pratik ve kullanışlı admin menü hileleri tespit etmenizde, belirlemenizde yasaklamanızda yardımcı olur.
-    Gelişmiş Ayarlanabilirlik: Geliştirilmiş config sistemi. Tüm tespitlerde Log,Kick ve Ban olmak üzere üç ayrı işlemi belirleyebiliyorsunuz. 
-    Gelişmiş Log Sistemi: Geliştirilmiş log sistemi ile tespit edilen oyunucuyu tüm bilgileriyle tespit edip yaptığı işlemi tespit edebilirsiniz. (License,Xbox,Windows ID ve Yasaklı işlemlerin detayları)


Ve son olarak geliştirdiğim bir method ile spawnlanan varlıkları kimin spawnladığını tek bir komut ile öğrenebiliyorsunuz. Ayrıca admin menüdeki ESP özelliği ile oyuncuların yerlerini tespit edebiliyorsunuz.


Ayrıca projeyi tanıtmak amacında yapmış olduğum bir videoyu izleyebilirsiniz.
https://www.youtube.com/watch?v=gcJkQXTaZNY




--KURULUM--

1-Dosyayı indirin resources da bir yere atın.
2-Configi kendinize göre düzenleyin.
/ortacinfo  - - - Obje bilgisini gösterir
/ortacdel - - - tüm varlıkları siler


-YETKİLENDİRME ADMİN BYPASS--


add_ace group.superadmin OrientAC-Admin allow
add_ace group.admin OrientAC-Admin allow
add_ace group.mod OrientAC-Mod allow

ve

add_principal identifier.steam:hex OrientAC-Admin
add_principal identifier.steam:hex OrientAC-Mod

OrientAC-Mod bu admin menüyü açamaz ama bypasslar adminler kick ban yemez
OrientAC-Admin bu da menüyü açar

server.cfg eklemeniz yeterlidir.


--NOT--

Yukarıda bahsettiğim gibi projem mükemmel değil resmon değerleri 0.20-0.50 arası gidip gelmektedir. Optimize çalışmaktadır. Çok detaylı bir ban sistemi ve log sistemi vardır.
Kişinin tüm bilgileri ile banlar yada loglar. Admin menünün altyapısını bir alman projeden aldım. Kendileri projeyi githubdan kaldırdıkları için forklayamadım.


