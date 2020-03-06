# Site Apartman Yönetim Programı

Basit bir site, apartman yönetim programı.


## Getting Started

Bloklar, daireler ve ödeme tipleri ile kişi kartları oluşturulan ve aylık vade tarihleri tanımlayıp borçlandırma yapılan kolay, basit ve kullanışlı bir program oldu. Ödeme tarihlerini tutarak raporlama da alabiliyoruz.


### Prerequisites

Veri tabanı olarak Microsoft SQL Server Express kullanıyor. Eğer bilgisayarınız da yüklü değilse [buradan](https://www.microsoft.com/en-us/download/details.aspx?id=42299) ücretsiz indirip kurabilirsiniz.


### Installing

Microsoft SQL Veri tabanını bilgisiyarınıza kurduktan sonra proje içierisinde bulunan sql script kodunu çalıştırınız. Veri tabanını, tabloları ve procedureları oluşturacaktır. Örnek bir kaç kayıt da ekleyecektir. Daha sonra programı [buradan](https://github.com/mcyenikoylu/OzayTepeSiteYonetimi/blob/master/Setup/setup.exe) bilgisayarınıza indirip  yükleyebilirsiniz. 


## Ekranlar

Başlıca bazı ekranlar.

### Kişiler

Tüm kişilerin listelendiği ekran. Grid üzerindeki filtre özelliği ile veriyi kendinize göre anlamlandırabiliyorsunuz.

![siteyonetimbg](https://user-images.githubusercontent.com/12815851/76127715-72822b80-6013-11ea-9c86-665dd408d834.JPG)


### Kişi Kartı

Kişi bilgilerinin girildiği ve düzenlendiği ekran. Üst menüden hızlı bir şekilde diğer veri giriş ekranlarına geçilebiliyor.

![siteyonetimkisi](https://user-images.githubusercontent.com/12815851/76127820-c9880080-6013-11ea-831b-bdac3e03d056.JPG)

### Borçlandırma

Vade tarihi belirleyip, ödemelerin belirleneceği ay adedini de seçerek borçlandırma oluşturuyorsunuz.

![siteyonetimborclandir](https://user-images.githubusercontent.com/12815851/76128030-487d3900-6014-11ea-9f42-4431533a553f.JPG)

### Blok Adı, Daire No ve Ödeme Tipi Tanımları

Programın işleyişi için önceden yapılması gerekli tanımlamaları yapıyorsunuz. Ekran tasarımları aynı.

![siteyonetimblok](https://user-images.githubusercontent.com/12815851/76128142-8f6b2e80-6014-11ea-8f55-1a154d94c372.JPG)


### Cari İşlemleri

Pivot grid olarak yerleştirilen veriler de filtrelendirme yapılabiliyor.

![siteyonetimbg2](https://user-images.githubusercontent.com/12815851/76128298-fa1c6a00-6014-11ea-8767-d8c9d147b5d1.JPG)

Print alabiliyorsunuz.

![siteyonetimrapor](https://user-images.githubusercontent.com/12815851/76128370-364fca80-6015-11ea-8f0f-0e451815a85e.JPG)



## Deployment

Windows OS

## Built With

* [Framework](https://support.microsoft.com/tr-tr/help/3102436/the-net-framework-4-6-1-offline-installer-for-windows) - .Net Framework 4.6.1
* [Component](https://www.devexpress.com/) - DevExpress 18.2.4
* [Database](https://www.microsoft.com/en-us/download/details.aspx?id=42299) - Microsoft SQL 2014

## Versioning

v1

## Authors

* **Mehmet Cenk Yeniköylü** - 

## License

Ücretsiz kullanım :)
