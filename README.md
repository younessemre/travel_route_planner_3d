# 📸 Travel Lens & Route Builder (Gezgin Asistanı)

> **🚧 DURUM: Geliştirme Aşamasında (WIP)**
> Bu proje, seyahatseverler için **Fotoğraf Rehberliği (Ghost Camera)** ve **İnteraktif Rota Planlama (Drag & Drop)** özelliklerini tek bir hibrit arayüzde birleştiren kapsamlı bir mobil uygulamadır.

---

## 📱 Proje Özeti ve Vizyon

Bu uygulama, sadece "nereye gidilir" sorusunu değil, **"nasıl gezilir"** ve **"nasıl fotoğraf çekilir"** sorularını da çözer. Kullanıcılar, izometrik haritalar üzerinde keşif yapabilir, mükemmel fotoğraf açılarını "Ghost Camera" moduyla yakalayabilir ve sürükle-bırak yöntemiyle kendi rotalarını tasarlayabilirler.

## 🎨 Temel Özellikler ve Akışlar

Uygulama 4 ana modül üzerine kurgulanmıştır:

### 1. 🎬 Sinematik Giriş & Profil (Onboarding)
Kullanıcıyı içine çeken görsel bir karşılama deneyimi.
* **Splash Screen:** Arka planda yüksek çözünürlüklü, döngüsel (loop) şehir videosu.
* **Veri Toplama:** Bulanık (Blur) arka plan üzerinde modern form yapısı ile kullanıcı profilleme (İsim, Yaş, Şehir).

### 2. 🎛️ Hibrit Kontrol Merkezi (Dashboard)
Uygulamanın beyni olan bu ekran, **State Management** becerilerini sergiler.
* **Segmented Control:** [Fotoğraf Çek] ve [Rota Oluştur] modları arasında Neumorphic tasarımlı geçiş butonu.
* **Dinamik İçerik:**
    * *Fotoğraf Modu:* Şehir listesi ve kartları.
    * *Rota Modu:* İnteraktif gün sayacı (+/-).

---

### 3. 📸 Akış A: Fotoğraf Rehberi ve Ghost Camera
Fotoğrafçılık deneyimini oyunlaştıran modül.
* **🗺️ İzometrik 3D Harita:** Seçilen şehrin kare zemin üzerinde 3D modellenmiş hali. Binalar tıklandığında zıplama (bounce) efekti ve parlayan kenarlar (highlight) ile tepki verir.
* **💡 Akıllı Tooltip:** Mekan detayları ve "İncele" seçeneği.
* **📷 Ghost Camera (Silüet Modu):** Kullanıcı bir mekanı çekerken, ekranda referans fotoğrafın **kırmızı çizgilerle çizilmiş silüeti** belirir. Bu sayede kullanıcı, profesyonel açıyı birebir yakalar.
* **❤️ Favori Sistemi:** Beğenilen açıları kaydetme.

---

### 4. 🗺️ Akış B: Rota Oluşturucu (Builder & Journal)
Planlama ve takip süreci.
* **🏗️ Drag & Drop Builder:** Kareli (Grid) zemin üzerinde sürükle-bırak mantığı. Kullanıcılar "Tarihi Eser", "Cafe" gibi kategorileri grid üzerine sürükleyip bırakarak rota çizer.
* **✨ Gamification (Oyunlaştırma):** Rota üzerindeki bir mekana varılıp "Buradayım" dendiğinde konfeti efektleri ve motivasyon mesajları.
* **📒 Dijital Anı Defteri (Journal):** Rota tamamlandıktan sonra her durak için kişisel notlar ve değerlendirmeler eklenen kronolojik günlük.

---

## 🛠️ Teknik Mimari ve Kullanılan Teknolojiler

Proje, **Clean Architecture** prensiplerine uygun olarak geliştirilmektedir.

| Kategori | Teknoloji / Paket | Kullanım Amacı |
| :--- | :--- | :--- |
| **Framework** | Flutter & Dart | Cross-platform geliştirme. |
| **State Mng.** | Provider / Riverpod | Hibrit dashboard ve seçim yönetimi. |
| **Video** | `video_player` | Splash screen arka planı. |
| **UI Kit** | `neumorphic_design` | Segmented control buton tasarımı. |
| **Camera** | `camera` | Ghost Camera (Silüet) katmanı için. |
| **Interaction** | `flutter_draggable_gridview` | Rota oluşturucu (Sürükle-Bırak). |
| **Map** | Custom Isometric Canvas | 3D şehir çizimi ve etkileşimleri. |

## 📂 Ekran Görüntüleri (Tasarım)

| Giriş & Dashboard | Ghost Camera | Rota Oluşturucu |
|:---:|:---:|:---:|
| ![Splash](link1) | ![Camera](link2) | ![Route](link3) |

## 🚀 Kurulum

Projeyi yerel makinenizde çalıştırmak için:

1.  Repoyu klonlayın:
    ```bash
    git clone [https://github.com/KULLANICI_ADIN/travel-lens.git](https://github.com/KULLANICI_ADIN/travel-lens.git)
    ```
2.  Paketleri yükleyin:
    ```bash
    flutter pub get
    ```
3.  Uygulamayı başlatın:
    ```bash
    flutter run
    ```

---
*Geliştirici: [Senin Adın]*
