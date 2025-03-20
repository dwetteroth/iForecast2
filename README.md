# 🌦️ iForecast

## 📌 Overview
**iForecast** is a weather forecasting app that provides real-time weather conditions and future forecasts based on user inputted locations. It integrates with the **LocationIQ API** for geocoding and the **OpenWeather API** for weather data retrieval.

---

## Live Demo

Check it out in action, I have stood this up on my personal server.

http

---

## ⚙️ Requirements
Before setting up the app, ensure you have the following installed:

- **Ruby** (version 3.2.6 or later)
- **Rails** (version 8.0 or later)
- **Bundler** (latest version)
- **Git**
- **PostgreSQL** (or an alternative database if preferred - not really needed though for this)

---

## 🛠️ Setup Instructions

1️⃣ **Clone the Repository**
```bash
git clone https://github.com/dwetteroth/iForecast2.git
cd iForecast2
```

2️⃣ **Install Dependencies**
```bash
bundle install
```

3️⃣ **Set Up Environment Variables**
This app requires API keys from **LocationIQ** and **OpenWeather**. Register and obtain API keys using the links below:

- **LocationIQ API Key** → [Get API Key](https://locationiq.com/)
- **OpenWeather API Key** → [Get API Key](https://openweathermap.org/api)

Create a `.env` file in the project root and add the following:
```bash
LOCATIONIQ_API_KEY=your_locationiq_api_key_here
OPENWEATHER_API_KEY=your_openweather_api_key_here
```

How to Set Up Environment Variables

To securely store your API keys, follow these steps:

Create a .env file in the project root directory

Open the .env file in a text editor and add your API keys

Ensure .env is ignored by Git to prevent accidental commits

Install dotenv-rails (if not already installed) to load environment variables

Modify config/application.rb to load .env automatically

Now, when you run the app, it will securely load API keys from the .env file.


4️⃣ **Set Up Database**
```bash
rails db:create
rails db:migrate
```

5️⃣ **Start the Server**
```bash
rails server
```

The application should now be running on `http://localhost:3000` 🚀

---

## 📌 Usage
### **Search for Weather**
Send a **GET request** with an address to fetch weather data:
```
GET /weather/search?address=10687 W Cooper Dr, CO
```
### **Response Format**
```json
{
  "current_weather": {
    "temperature": 75,
    "condition": "Sunny"
  },
  "forecast": [
    { "day": "Monday", "temperature": 70 }
  ],
  "cached": false
}
```

---

## 🔒 Security & Best Practices
- **Do not commit API keys** directly in your code. Always use environment variables.
- **Add `.env` to `.gitignore`** to prevent it from being committed.
- **Use `dotenv-rails`** to manage environment variables in development.

---

## 🤝 Contributing
1. Fork the repository
2. Create a new branch (`git checkout -b feature-branch`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push the branch (`git push origin feature-branch`)
5. Open a Pull Request

---

## 📄 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 📧 Contact
For questions or feedback, reach out to **@dwetteroth** on GitHub.


