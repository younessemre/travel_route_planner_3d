import 'package:flutter/material.dart';

class LocationSelectionScreen extends StatefulWidget {
  const LocationSelectionScreen({super.key});

  @override
  State<LocationSelectionScreen> createState() => _LocationSelectionScreenState();
}

class _LocationSelectionScreenState extends State<LocationSelectionScreen> {
  //SEÇİLEN ÜLKE VE ŞEHİR DEĞİŞKENİ
  String? _selectedCountry;
  String? _selectedCity;

  //ÜLKELER LİSTESİ
  final List<String> _countries = ["İspanya","İtalya","Fransa","Almanya"];

  //MAP İLE ÜLKE VE ŞEHİR BAĞLAMA
  Map<String, List<String>> _citiesByCountry = {
    'İspanya' : ['Barcelona','Madrid','Sevilla'],
    'İtalya' : ['Roma','Floransa','Venedik'],
    'Fransa' : ['Paris','Nice','Lyon'],
    'Almanya' : ['Berlin', 'Münih', 'Hamburg'],
  };

  //HARİTA EKRANINA GEÇME
  void _navigateToMapScreen() {
    if(_selectedCountry != null && _selectedCity != null){
      print('Seçim: $_selectedCountry, $_selectedCity');

      // NAVİGASYON KODU GELECEK
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Lütfen hem ülke hem de şehri seçiniz.')),
      );
    }
  }

  //TÜM EKRAN
  @override
  Widget build(BuildContext context) {
    const Color softGreyBlue = Color(0xFFF0F3F7);

    return Scaffold(
      backgroundColor: softGreyBlue,
      appBar: AppBar(
        title: const Text("Gezi Konumu Seçimi", style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
      ),

      body: Padding(
          padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
                children: [
                  SizedBox(height: 36),

                  //ICON
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: const Color(0xFF00ADB5).withOpacity(0.15), // Hafif turkuaz arka plan
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.travel_explore, // Büyüteç ikonu yerine uygun bir ikon
                      color: Color(0xFF00ADB5),
                      size: 45,
                    ),
                  ),

                  const SizedBox(height: 28.0),

                  const Text(
                    "Keşfetmeye Hazır Mısın?",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w800),
                  ),

                  const SizedBox(height: 16.0),

                  Text(
                        "Gezi planına başlamak için ana konumunuzu seçin.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 18.0, color: Colors.black54, fontWeight: FontWeight.w500),
                      ),
                ],
              ),

            const SizedBox(height: 36.0),

            //ÜLKE SEÇME BUTONU
            _buildDropdown(
                label: 'ÜLKE SEÇİNİZ',
                value: _selectedCountry,
                items: _countries,
                icon: Icons.public,
                hintText: 'Bir ülke seçin...',
                onChanged: (newValue){
                  setState(() {
                    _selectedCountry = newValue;
                    _selectedCity = null;
                  });
                }),

            const SizedBox(height: 20.0),

            //ŞEHİR SEÇME BUTONU
            _buildDropdown(
              label: 'ŞEHİR SEÇİNİZ',
              value: _selectedCity,
              items: _selectedCountry != null
                  ? _citiesByCountry[_selectedCountry] ?? []
                  : [],
              icon: Icons.location_city,
              hintText: 'Şehir seçiniz',
                onChanged: (newValue){
                setState(() {
                  _selectedCity = newValue;
                });
                },
              isEnabled: _selectedCountry != null,

            ),

            const Spacer(),

            //BUTON TASARIMI
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton.icon( // ElevatedButton.icon kullanıldı
                onPressed: (_selectedCountry != null && _selectedCity != null)
                    ? _navigateToMapScreen : null,
                style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF009E91), // Canlı Turkuaz
                    disabledBackgroundColor: const Color(0xFF009E91).withOpacity(0.6), // Pasif renk
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    )
                ),
                icon: const Text(
                  'HARİTA İLE BAŞLA',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                label: const Icon(
                  Icons.arrow_forward, // İlerleme Oku İkonu
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //ÜLKE VE ŞEHİR İÇİN ORTAK DROPDOWN BUTONU
  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
    bool isEnabled = true,
    required IconData icon,
    required String hintText,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: isEnabled ? Colors.black87 : Colors.black38,
          ),
        ),

        const SizedBox(height: 8.0),

        DropdownButtonFormField<String>(
            value: value,
            decoration: InputDecoration(
              prefixIcon: Icon(icon, color: isEnabled ? Colors.black54 : Colors.black26),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: isEnabled ? Colors.grey : Colors.grey[300]!),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: isEnabled ? Colors.grey : Colors.grey[300]!),
              ),
              filled: true,
              fillColor: isEnabled ? Colors.white : Colors.grey[100],
            ),
            hint: Text(
              hintText,
              style: TextStyle(color: isEnabled ? Colors.black45 : Colors.black26),
            ),
            items: items.map((String item){
              return DropdownMenuItem<String>(
                  value: item,
                  child: Text(item),
              );
            }).toList(),
            onChanged: isEnabled ? onChanged : null,
        )
      ],
    );
  }
}
