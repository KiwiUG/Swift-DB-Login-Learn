# 📱 Swift-DB-Login-Learn

An iOS application built in **Swift** (Xcode) demonstrating user **login & authentication** using **Firebase Realtime Database**.  
This project is part of my learning journey with Swift and Firebase integration.

---

## 🚀 Features
- 🔑 User login with Firebase Realtime Database  
- 🗄️ Firebase configuration & database connection  
- 📂 Clean project structure (`.xcodeproj` + source folder)  
- 🎨 iOS frontend built in Swift (UIKit/SwiftUI depending on your setup)  
- 📱 Runs on iOS Simulator or physical device  

---

## 📂 Project Structure
Swift-DB-Login-Learn/
├── Swift-DB-Login-Learn/     # Swift source files, assets, storyboards
├── Swift-DB-Login-Learn.xcodeproj/   # Xcode project configuration
├── .gitignore                # Ignored files (build, Firebase plist, etc.)
└── README.md                 # Project documentation

---

## 🛠️ Requirements
- **Xcode 15** or later  
- **Swift 5.9** or later  
- **CocoaPods** (if you add Firebase via Pods) or **Swift Package Manager**  
- Firebase iOS SDK  

---

## ⚡ Setup Instructions

1. **Clone the repo**
   git clone https://github.com/KiwiUG/Swift-DB-Login-Learn.git  
   cd Swift-DB-Login-Learn  

2. **Install dependencies (if using CocoaPods)**  
   pod install  

3. **Firebase setup**
- Go to [Firebase Console](https://console.firebase.google.com/).  
- Create a Firebase project.  
- Add an iOS app with your project’s **bundle identifier**.  
- Download `GoogleService-Info.plist`.  
- Place it inside the `Swift-DB-Login-Learn/` folder.  
⚠️ *This file is ignored in `.gitignore` for security, so you must add it manually.*  

4. **Open project**
- Open `Swift-DB-Login-Learn.xcodeproj` in Xcode.  
- Select your simulator or iOS device.  
- Run ▶️ the app.  

---

## 🤝 Contributing
Pull requests are welcome.  
For major changes, please open an issue first to discuss what you’d like to change.  

---

## 📜 License
[MIT](LICENSE) © 2025 Utsav Gautam
