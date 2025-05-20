# Sportify - Your Social Platform for Sports 🏃‍♂️ ⚽ 

### 🌐 See more here: https://filexf.github.io/felix-portfolio/#/applications

Sportify is an innovative web application designed to connect sports enthusiasts. It allows users to create and join sporting events, share their experiences, and find training partners in their area. Sportify is also a Progressive Web App, which means you can have it as a shortcut window on your phone homepage. It's not native but it has a lot of similar features.

## Technologies Used 🛠️

### Backend

- Ruby on Rails 7.1.5 - Main web framework
- PostgreSQL - Relational database
- Devise - User authentication
- Cloudinary - Media management
- Geocoder - Geolocation services

### Frontend

- Hotwire (Turbo & Stimulus) - Dynamic interactions
- Bootstrap 5.2 - CSS framework
- SASS - CSS preprocessor
- Mapbox GL - Interactive mapping
- Importmap Rails - JavaScript asset management

### Tools & Services

- Docker - Containerization
- Cloudinary - Image storage
- PostgreSQL - Database
- Action Cable - Real-time communication

## Key Features ⭐

### Sports Events Management 🎯

- Event creation and management
- Participation system
- Event location mapping
- Filtering by sport and location

### Sports Social Network 🤝

- Customized user profiles
- Posts and comments
- Like system
- Personalized news feed

### Geolocation Features 🗺️

- Sports facilities search
- Interactive mapping
- Distance calculation
- Location-based suggestions

### Responsive Interface 📱

- Mobile-first adaptive design
- Smooth navigation
- Performance optimization
- Intuitive user interface

## Project Structure 📂

```
app/
├── assets/         # Static assets
├── controllers/    # Business logic
├── models/         # Data models
├── views/          # Templates
├── javascript/     # JS code
└── services/       # Business services

config/
├── routes.rb       # Application routes
└── database.yml    # DB configuration

db/
└── schema.rb       # Database schema
```

## Local Installation 💻

1. Clone the repository

```bash
git clone https://github.com/yourusername/sportify.git
cd sportify
```

2. Install dependencies

```bash
bundle install
```

3. Database setup

```bash
rails db:create db:migrate db:seed
```

4. Environment variables
   Create a `.env` file in the project root:

```
CLOUDINARY_URL=your_cloudinary_url
MAPBOX_API_KEY=your_mapbox_key
```

5. Start the server

```bash
rails server
```

6. Access the application
   Open `http://localhost:3000` in your browser

## Mobile Mode 📱

Because we only had 10 days, we didn't have time to make the app fully responsive, so you'll need to be on mobile:

1. Open developer tools (F12)
2. Click on the "Toggle device toolbar" icon (Ctrl+Shift+M)
3. Select Galaxy S20+ from the dropdown menu (We made it to especially match this mobile screen size)

## Developed with ❤️ by the Sportify Team
