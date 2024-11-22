# Flutter E-commerce Admin Panel - Clean Architecture

The **Flutter E-commerce Admin Panel** is a web-based application built using Flutter to manage and oversee the operations of an eCommerce platform. It allows admins to manage products, categories, orders, and users. The panel connects to a Firebase backend for real-time data management and synchronization, providing an efficient interface for business management.

### CONFIGURATIONS & SETUPS
* New project setup with feature-first folder structure.
* Integrated Git for version control and connected the project to GitHub. 
* configure admin_panel_app to use the same Firebase data as ecommerce_app
* Add Helper functions, utilities, and constants - code reusability.

### ROUTING IN FLUTTER WEB
* Understanding basics, navigation & Data passing
* Handling the # from the Flutter Web URLs
* Redirect an unlogged-in user to the login page - GetMiddleware

### RESPONSIVE & ADAPTIVE DESIGN
* Create responsive and adaptive layouts for desktop, tablet and mobile.
* Create adaptive appbar for desktop, tablet and mobile.
* Create responsive sidebar - Handle Browser Back and Forward Buttons.

### ADMIN MANAGEMENT
* Design Responsive Login Screen
* Design Forget Password & Reset Password Screens
* 

## FIREBASE INTEGRATION
* Flutter Web Images - Why And How Enable CORS for Firebase Storage?
* 

## TESTING FEATURES
* 

## CI/CD FEATURES
* Hide Generated Files on Android Studio or VSCode

## TECHNOLOGIES USED
* **Flutter**: Cross-platform framework for building the admin panel (web-focused).
* **Dart**: Programming language used for building the app.
* **Firebase**: Backend services including authentication, Firestore (real-time database), and Firebase hosting.
* **GetX**: State management for maintaining app-wide state (authentication, products, orders, etc.).

## REQUIREMENTS
* **Flutter SDK**: Version 3.0+.
* **Android Studio or Visual Studio Code**: Code editors with Flutter and Dart extensions.
* **Firebase Account**: For managing authentication and database operations.

## INSTALLATION
1. **Clone the repository**:
    ```bash
    https://github.com/drogbut/flutter_ecommerce_admin_panel.git
    cd flutter_ecommerce_admin_panel
    ```

2. **Install dependencies**:
    ```bash
    flutter pub get
    ```
3. **Configure Firebase**:
    * Create a Firebase project and configure Firestore and authentication.
4. **Run the project**:
    ```bash
    flutter run -d chrome
    ```
5. Auto generate files
```bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```
or watch command in order to keep the source code synced automatically:
```bash
flutter packages pub run build_runner watch
```

6. Hide Generated Files
In-order to hide generated files, navigate to `Android Studio` -> `Preferences` -> `Editor` -> `File Types` and paste the below lines under `ignore files and folders` section:
```bash
*.inject.summary;*.inject.dart;*.g.dart;
```
In Visual Studio Code, navigate to `Preferences` -> `Settings` and search for `Files:Exclude`. Add the following patterns:
```bash
**/*.inject.summary
**/*.inject.dart
**/*.g.dart
```

## FUTURE FEATURES
* 

## CONCLUSION
Feel free to reach out if you have any questions or suggestions about the project! Contributions are welcome, so if you'd like to help improve the project, don't hesitate to submit an issue or a pull request.

If you like this project, consider giving it a ⭐ on GitHub to show your support!

## LICENSE
This project is licensed under the MIT License. See the LICENSE file for more details.

