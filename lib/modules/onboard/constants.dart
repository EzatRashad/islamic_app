import 'package:flutter/material.dart';

double width(context) => MediaQuery.of(context).size.width;
double height(context) => MediaQuery.of(context).size.height;

const Color mainColor = Color.fromARGB(255, 255, 199, 59);
const Color primaryColor = Color.fromARGB(255, 19, 54, 33);

List titles = [
  "Access the Holy Qur'an and Tafseer",
  "Find the Qibla Anywhere",
  " Explore Prophetic Hadiths",
  " Electronic rosary and Azkar and Fatwas",
];
List descriptions = [
  "Easily read and understand the Qur'an with full text and detailed Tafseer.",
  "Accurately locate the Qibla direction for your prayers using our built-in compass.",
  "Discover the wisdom of Prophet Muhammad (PBUH) through authentic collections of hadiths.",
  "Seek religious guidance through Fatwas and enhance your worship with E-rosary and Azkar."
];
List arTitles = [
  "الوصول إلى القرآن الكريم والتفسير",
  "إيجاد القبلة في أي مكان",
  "استكشاف الأحاديث النبوية",
  "مسبحة إلكترونية وأذكار وفتاوى",
];
List arDescriptions = [
  "اقرأ القرآن الكريم بسهولة وافهمه مع النص الكامل وتفسير مفصل.",
  "حدد اتجاه القبلة بدقة لأداء صلواتك باستخدام البوصلة المدمجة.",
  "اكتشف حكمة النبي محمد (صلى الله عليه وسلم).",
  "اطلب الإرشاد الديني من خلال الفتاوى، وعزز عبادتك بميزات مثل المسبحة الإلكترونية والأذكار اليومية.",
];
List images = [
  'assets/images/oquran.png',
  'assets/images/oqibla.png',
  'assets/images/ohadiths.png',
  'assets/images/omuslimm2.png'
];