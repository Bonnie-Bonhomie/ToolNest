# tool_nest

ToolNest App
Multi-Utility Converter & Task Manager App: A Flutter-based mobile application that combines unit conversion tools with a task management system. This app helps users perform everyday conversions while managing their daily tasks efficiently.

Features
1. Unit Converter:
Supports multiple types of conversions:
a. Currency Conversion: Real-time exchange rates via API. Supports multiple currencies (USD, NGN, EUR, etc.)
b. Length Conversion: Meter, Kilometer, 
c. Temperature Conversion: Celsius ↔ Fahrenheit ↔ Kelvin
d. Weight Conversion: Kilogram, Gram


✅ Task Manager
Manage your daily activities easily:
➕ Add new tasks
✏️ Edit existing tasks
❌ Delete tasks
✔️ Mark tasks as completed
🛠️ Tech Stack


Framework: Flutter
Language: Dart
State Management: Provider
Local Database: Hive
API Integration: Dio



⚙️ Installation
Clone the repository
Bash: git clone https://github.com/your-username/your-repo-name.git
Navigate to project folder
Bash: cd your-repo-name
Install dependencies
Bash: flutter pub get, then run the app
Bash: flutter run


🔌 API Configuration
The app uses a currency exchange API:
Example:
Dart
https://api.exchangerate-api.com/v4/latest/USD
Ensure you have internet access for currency conversion.
💾 Local Storage
Tasks are stored locally using Hive
No internet required for task management


👩‍💻 Author
Developed by Aishat Akinyemi (Bonnie-Bonhomie)
