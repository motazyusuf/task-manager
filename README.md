# 📱 Task & News App

A Flutter mobile application that combines **Task Management** and **News API integration** with **Google Authentication** using Firebase. The app follows **Repository Pattern** and uses **BLoC state management**.

---

## 🚀 Features

### ✅ Task Management
- Store tasks using **Hive** database.
- CRUD operations (Create, Read, Update, Delete) on tasks.
- Tasks stored as a **stream**, updating the UI in real time.

### 📰 News API
- Fetch latest news from a public API using **Dio**.
- Display news articles in a structured list.
- Handle API errors gracefully.

### 🔑 Google Authentication
- Sign in using **Google Auth** via Firebase.
- Manage user authentication state.

---

## 🛠 Tech Stack
- **Flutter** (Dart)
- **Hive** (Local Storage)
- **Dio** (HTTP Client)
- **BLoC** (State Management)
- **Repository Pattern** (Separation of Concerns)
- **Firebase Authentication**

---

## 📂 Project Structure

```
/lib
│── main.dart
│── core/
│── features/
│   ├── tasks/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   ├── repositories/
│   │   ├── presentation/
│   │   │   ├── pages/
│   │   │   ├── widgets/
│   │   │   ├── manager/
│   ├── news/
│   │   ├── data/
│   │   │   ├── models/
│   │   │   ├── repositories/
│   │   ├── presentation/
│   │   │   ├── pages/
│   │   │   ├── widgets/
│   │   │   ├── manager/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── repositories/
│   │   ├── presentation/
│   │   │   ├── pages/
│   │   │   ├── widgets/
│   │   │   ├── manager/


---


## 📷 Screenshots

| Task Management | News API | Google Auth |
|----------------|---------|------------|
| ![Tasks](https://github.com/user-attachments/assets/61af47c0-4909-400c-b635-3264c0455325) | ![News](https://github.com/user-attachments/assets/5a1536fe-4dba-46f7-9344-1ff14782cba5) | ![Auth](https://github.com/user-attachments/assets/1664c3d8-abe1-423d-b083-ecc88c9fc52e) |

---

## 🏗 Future Enhancements
- Implement additional authentication methods.
- Add dark mode support.
- Improve UI/UX with animations.



