# 📸 Travel Lens: Hibrit Seyahat & Rota Asistanı

> **🚧 DURUM: Aktif Geliştirme Aşamasında (WIP)**
> Bu proje; seyahatseverlere hem **Fotoğraf Rehberliği** hem de **Rota Planlama** imkanı sunan hibrit bir mobil uygulamadır. Şu anda **v0.2 (UI & Core Logic)** aşamasındadır.

---

## 📱 Proje Vizyonu

Standart gezi uygulamalarının aksine, kullanıcıya tek bir ekranda iki farklı mod sunar:
1.  **Fotoğraf Modu:** Şehrin en ikonik noktalarını ve en iyi açılarını keşfetmek için.
2.  **Planlama Modu:** Gideceği gün sayısına göre otomatik veya manuel rota oluşturmak için.

---

## 🎨 Tamamlanan Arayüzler ve Akışlar

Şu ana kadar uygulamanın **Onboarding (Karşılama)**, **Kimlik Doğrulama** ve **Ana Kontrol Merkezi (Dashboard Logic)** modülleri tamamlanmıştır.

### 1. Karşılama ve Giriş Deneyimi
Kullanıcıyı içine çeken video arka planlı açılış ve modern form yapısı.

| 🎬 Sinematik Splash Screen | 🔐 Kullanıcı Girişi (Auth) |
| :---: | :---: |
| <img src="https://github.com/user-attachments/assets/6b110180-fcf9-417a-804e-24b2137552a8" width="280"/> | <img src="https://github.com/user-attachments/assets/79a3572a-8735-41a5-8c2f-2cff8f39e694" width="280"/> |
| *Arka planda döngüsel şehir videosu ve marka kimliği.* | *Sade, odaklanmış ve kullanıcı dostu giriş formu.* |

### 2. Akıllı Dashboard (State Management)
Kullanıcının seçimine göre arayüzü tamamen değiştiren **Dinamik State Yönetimi**.

| 📸 Mod A: Fotoğraf & Keşif | 🗺️ Mod B: Rota & Planlama |
| :---: | :---: |
| <img src="https://github.com/user-attachments/assets/3830034c-f033-4583-b578-9aaf18a6896f" width="280"/> | <img src="https://github.com/user-attachments/assets/93982524-dc5f-4e22-8a11-3fe0a8d7966f" width="280"/> |
| **"Fotoğraf Çek"** seçildiğinde: <br>Şehir listesi (İstanbul, Barcelona...) ve keşif kartları açılır. | **"Rota Oluştur"** seçildiğinde: <br>Kullanıcının kalacağı gün sayısını belirlediği sayaç modülü aktifleşir. |

---

## 🛠️ Teknik Detaylar (Şu Anki Altyapı)

* **Dinamik State Yönetimi:** Dashboard ekranındaki seçim (`Fotoğraf` vs `Rota`), alt kısımdaki widget ağacını (Widget Tree) anlık olarak yeniden çizer (`rebuild`).
* **Varlık Yönetimi (Assets):** Yüksek çözünürlüklü görseller ve video entegrasyonu optimize edilmiştir.
* **UI/UX Prensipleri:**
    * **Micro-Interactions:** Seçim yapıldığında beliren yeşil çerçeve ve onay ikonu (`check_circle`).
    * **Typography:** Okunabilirliği yüksek modern font ailesi.
    * **Whitespace:** Ferah ve göz yormayan yerleşim.

## 📝 Geliştirme Yol Haritası (Next Steps)

Projenin temel iskeleti hazırdır. Şu anda aşağıdaki özellikler kodlanmaktadır:

- [x] **UI:** Video Splash & Login Ekranları
- [x] **Logic:** Dashboard Mod Geçişleri (Selection Logic)
- [x] **Data:** Statik Şehir Listeleri
- [ ] **Özellik:** Kamera entegrasyonu (Ghost Camera / Silüet Modu)
- [ ] **Özellik:** Sürükle-Bırak ile Rota Oluşturma (Drag & Drop)
- [ ] **Backend:** Firebase Veritabanı Bağlantısı

## 🚀 Kurulum

Projeyi incelemek için:

```bash
git clone [https://github.com/KULLANICI_ADIN/travel-lens.git](https://github.com/KULLANICI_ADIN/travel-lens.git)
flutter pub get
flutter run
