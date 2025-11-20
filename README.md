# Medion – клиника учун тўлиқ онлайн-запись приложение  
**DDD + Clean Architecture + Production-ready код**  

Бу мен 2024–2025 йилларда Caretech компаниясида **Flutter-разработчик** сифатида нольдан ёзган ва TestFlight гача олиб чиққан лойиҳам.  
Ҳозир релиз тайёргарлик босқичида, App Store ва Play Market га чиқишга тайёр.

### Нима учун бу лойиҳани Middle+/Senior собесларида кўрсатиш мумкин?

| Фича                                     | Қандай қилинган                                                                 |
|------------------------------------------|----------------------------------------------------------------------------------|
| **Тўлиқ DDD (Domain-Driven Design)**     | `entities → use_cases → repositories → data sources` – ҳар бир слой аниқ ажратилган |
| **Clean Architecture + Feature-first**   | Ҳар бир фича (запись, врачи, профиль, расписание) – алоҳида папкада               |
| **BLoC + Freezed + hydrated_bloc**       | 100% типобезопасные стейтлар, offline-first, автоматическое сохранение состояний   |
| **Chopper + Chopper Generator**          | Кодогенерация REST-клиентлари, бойлерплейт ноль, всё типобезопасно                |
| **Built Value / Freezed / Json Serializable** | Автогенерация моделей, immutable всё                                          |
| **Hive + Hive Generator**                | Локальный кэш врачей, слотов, записей – приложение даже без сети ишлайди          |
| **Динамические слоты записи в реальном времени** | Сложная бизнес-логика: учитывает перерывы врачей, блокировки, ограничения по времени |
| **CI/CD (Codemagic + Fastlane)**         | Автоматическая сборка, тесты, TestFlight деплой                                  |
| **Null-safety + строгие lint-правила**   | `!` ва `late` фақат жуда керак бўлганда                                          |
| **Responsive + Tablet support**          | Экран ўлчамларига қараб UI мослашади                                            |

### Технологик стек
- Flutter 3.24+ / Dart 3.5+
- BLoC 8.1+, flutter_bloc, hydrated_bloc
- Freezed, Built Value, Json Serializable
- Chopper + Chopper Generator
- Hive + Hive Generator
- get_it + injectable (DI)
- flutter_screenutil, auto_route
- Codemagic CI/CD + Fastlane

### Қандай ишлатиш мумкин
```bash
git clone https://github.com/urinbayeeva/medion.git
cd medion
flutter pub get
flutter pub run build_runner build --delete-conflicting-outputs
flutter run
