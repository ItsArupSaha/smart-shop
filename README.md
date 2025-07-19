# Smart Shop - Mini E-commerce Flutter App

A comprehensive mini e-commerce mobile application built with Flutter, featuring modern UI/UX design, advanced dark theme support, and robust functionality.

## ✨ Features

### 🌙 Enhanced Dark Theme
- **Pure Dark Mode**: Full black backgrounds with white text
- **Smart Color Adaptation**: White buttons with black text in dark mode
- **Consistent Theming**: Deep grey product cards and navbar in dark theme
- **Theme Persistence**: Remembers user's theme preference

### 🎨 Improved UI/UX
- **Modern Navbar**: Clean design with menu button and action buttons
- **Smart Shop Title**: Centered title with shopping bag icon below navbar
- **Enhanced Product Cards**: Deep grey background with proper contrast
- **Optimized Layout**: Better spacing and visual hierarchy

### 🔄 Pull-to-Refresh
- **RefreshIndicator**: Pull down to reload product list
- **Real-time Updates**: Fetches fresh data from API
- **Smooth Animation**: Native refresh loading indicator

## Features

### 🔐 Authentication
- Login/Register screen with form validation
- Persistent login state using SharedPreferences
- Splash screen with automatic navigation based on login status
- Secure logout functionality

### 🏠 Home Page
- Product grid display with beautiful cards
- Real-time product data from FakeStore API
- Category filtering with horizontal scroll
- Pull-to-refresh functionality
- Product rating display with star indicators
- Add to cart functionality with visual feedback
- Enhanced dark theme with deep grey cards

### 🛒 Shopping Cart
- Add/remove items with quantity management
- Real-time total price calculation
- Cart badge with item count
- Persistent cart state
- Checkout functionality

### ❤️ Favorites
- Heart icon on product cards
- Add/remove products to favorites
- Dedicated favorites page
- Persistent favorites using SharedPreferences

### 🎨 Advanced Theme Management
- **Enhanced Dark/Light theme toggle**
- **Pure black backgrounds** in dark mode
- **White buttons with black text** in dark mode
- **Deep grey product cards** in dark theme
- Persistent theme preference
- Modern Material Design 3 theming
- Smooth theme transitions

### 🔍 Sorting & Filtering
- Sort by price (low to high, high to low)
- Sort by rating
- Filter by product categories
- Bottom sheet for sort/filter options

### 📱 Navigation
- **Updated Drawer Navigation**: Pure black background with white text in dark mode
- Cart, Favorites, Profile, and Logout options
- Theme toggle in drawer
- Statistics display in profile
- Clean menu button with proper functionality

## Technical Stack

- **Framework**: Flutter
- **State Management**: Provider
- **Persistence**: SharedPreferences
- **HTTP Client**: http package
- **Image Loading**: cached_network_image
- **Rating Display**: flutter_rating_bar
- **API**: FakeStore API (https://fakestoreapi.com)

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── models/
│   ├── product.dart          # Product data model
│   └── cart_item.dart        # Cart item model
├── providers/
│   ├── auth_provider.dart    # Authentication state
│   ├── cart_provider.dart    # Shopping cart state
│   ├── favorites_provider.dart # Favorites state
│   ├── product_provider.dart # Product data & API
│   └── theme_provider.dart   # Theme management
├── screens/
│   ├── splash_screen.dart    # App splash screen
│   ├── login_screen.dart     # Login/Register
│   ├── home_screen.dart      # Main product listing
│   ├── cart_screen.dart      # Shopping cart
│   ├── favorites_screen.dart # Favorites page
│   └── profile_screen.dart   # User profile
└── widgets/
    ├── product_card.dart     # Product display card
    └── sort_filter_bottom_sheet.dart # Sort/Filter UI
```

## Getting Started

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Android Emulator or Physical Device

### Installation

1. Clone the repository:
```bash
git clone <repository-url>
cd smart_shop
```

2. Install dependencies:
```bash
flutter pub get
```

3. Run the app:
```bash
flutter run
```

### Demo Credentials
- **Email**: demo@example.com
- **Password**: password123

## Key Features Implementation

### State Management with Provider
The app uses Provider for efficient state management across different features:
- Authentication state
- Shopping cart management
- Favorites persistence
- Product data and filtering
- Theme switching

### SharedPreferences Integration
- Login state persistence
- Theme preference storage
- Favorites data persistence
- User email storage

### RESTful API Integration
- Fetching products from FakeStore API
- Error handling and loading states
- Category-based filtering
- Real-time data updates

### Modern UI/UX
- Material Design 3 components
- Responsive grid layout
- Smooth animations and transitions
- **Enhanced Dark/Light theme support**
- Intuitive navigation

## Extra Features 

✅ **Category-based Product Filtering**: Products are filtered by categories from the API
✅ **Pull-to-Refresh**: RefreshIndicator for reloading product data
✅ **Advanced Sorting**: Multiple sorting options (price, rating)
✅ **Beautiful Design**: Modern, clean UI with proper spacing and typography
✅ **Error Handling**: Comprehensive error handling for network issues
✅ **Loading States**: Proper loading indicators throughout the app
✅ **Responsive Design**: Works well on different screen sizes
✅ **Enhanced Dark Theme**: Pure black backgrounds with white text and buttons
✅ **Improved Navbar**: Clean design with menu button and action buttons
✅ **Smart Product Cards**: Deep grey background with proper contrast in dark mode

## Screenshots

The app includes:
- Splash screen with gradient background
- Login screen with form validation
- Home screen with product grid and category filters
- Cart screen with quantity management
- Favorites screen with heart icons
- Profile screen with statistics
- Drawer navigation with theme toggle

## Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request

## License

This project is licensed under the MIT License.

## Acknowledgments

- FakeStore API for providing product data
- Flutter team for the amazing framework
- Provider package for state management
- Material Design for UI guidelines 
