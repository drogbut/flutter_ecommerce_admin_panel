# Flutter E-commerce Admin Panel - Clean Architecture

The **Flutter E-commerce Admin Panel** is a web-based application built using Flutter to manage and oversee the operations of an eCommerce platform. It allows admins to manage products, categories, orders, and users. The panel connects to a Firebase backend for real-time data management and synchronization, providing an efficient interface for business management.

## FRONTEND FEATURES
### APP CONFIGURATIONS
* New project setup with feature-first folder structure.
* Integrated **Git** for version control and connected the project to **GitHub** for remote repository management. 
* configure admin_panel_app to use the same Firebase datas as ecommerce_app
* Integrated light & dark modes (buttons, textfields, app bars, etc.).
* Helper functions, utilities, and constants management for code reusability.

### ADMIN PANEL FEATURES
* **Dashboard**: Overview of key metrics (orders, users, products).
* **Product Management**: Create, update, and delete products with details like price, description, images, and categories.
* **Order Management**: View and update order statuses (pending, shipped, delivered).
* **User Management**: List of users with account information and order history.
* **Category Management**: Add, remove, and edit product categories.
* **Real-time Data**: Sync changes in products, categories, and orders using Firebase.

### AUTHENTICATION
* Firebase Authentication setup for admin access.
* Email/password-based login.
* Reset Password functionality.

## BACKEND FEATURES
### FIREBASE INTEGRATION
* Firebase setup for authentication, Firestore database, and real-time sync.
* Use of Firestore for storing products, categories, orders, and user information.
* Real-time updates to ensure admin data is always up to date.

## TESTING FEATURES
* Unit tests for utilities and services.
* Integration tests for critical workflows such as product and order management.

## CI/CD FEATURES
* Automated builds and tests using GitHub Actions.
* Firebase hosting for web deployments.
* Flutter build pipeline integration for web.

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
    * Download `google-services.json` (Android) and `GoogleService-Info.plist` (iOS), placing them in the appropriate directories.

4. **Run the project**:
    ```bash
    flutter run -d chrome
    ```

## FUTURE FEATURES
* **Notifications**: Send real-time notifications to admins about new orders or low stock.
* **Analytics**: Provide detailed reports and analytics for sales and user activity.
* **Multilingual Support**: Add support for multiple languages.
* **Coupons & Discounts**: Manage discount codes and promotions for customers.

## CONCLUSION
Feel free to reach out if you have any questions or suggestions about the project! Contributions are welcome, so if you'd like to help improve the project, don't hesitate to submit an issue or a pull request.

If you like this project, consider giving it a ⭐ on GitHub to show your support!

## LICENSE
This project is licensed under the MIT License. See the LICENSE file for more details.

