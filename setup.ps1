# ============================================
# SCRIPT SETUP COMPLET AGENCE IA AVEC GIT
# ============================================

Write-Host "🚀 SETUP COMPLET AGENCE IA - NEMOTRON 9B" -ForegroundColor Cyan
Write-Host "==========================================" -ForegroundColor Cyan

# Variables
$PROJECT_ROOT = "C:\agence-ia"
$GITHUB_USERNAME = "GaetanLgt"
$REPO_NAME = "agence-ia-nemotron"

# Créer la structure
Write-Host "`n📁 Création de la structure..." -ForegroundColor Yellow

# Dossiers backend
New-Item -ItemType Directory -Force -Path "backend\src\api" | Out-Null
New-Item -ItemType Directory -Force -Path "backend\src\services" | Out-Null
New-Item -ItemType Directory -Force -Path "backend\src\config" | Out-Null
New-Item -ItemType Directory -Force -Path "backend\src\middleware" | Out-Null

# Dossiers frontend
New-Item -ItemType Directory -Force -Path "frontend\src\components" | Out-Null
New-Item -ItemType Directory -Force -Path "frontend\src\views" | Out-Null
New-Item -ItemType Directory -Force -Path "frontend\src\assets" | Out-Null
New-Item -ItemType Directory -Force -Path "frontend\public" | Out-Null

# Autres dossiers
New-Item -ItemType Directory -Force -Path "docker" | Out-Null
New-Item -ItemType Directory -Force -Path "models" | Out-Null
New-Item -ItemType Directory -Force -Path "scripts" | Out-Null

Write-Host "✅ Structure créée" -ForegroundColor Green

# Git init
Write-Host "`n🔧 Initialisation Git..." -ForegroundColor Yellow
git init
Write-Host "✅ Git initialisé" -ForegroundColor Green

# Créer .gitignore
Write-Host "`n📝 Création des fichiers..." -ForegroundColor Yellow

@"
node_modules/
.env
.env.local
*.log
dist/
build/
.DS_Store
*.swp
.vscode/
coverage/
"@ | Out-File -FilePath ".gitignore" -Encoding UTF8

# Créer README.md
@"
# 🚀 Agence IA - Nemotron 9B

Architecture Full Stack avec Nemotron 9B, Discord Bot et interface moderne.

## Stack
- Backend: Node.js / Express / Socket.io
- Frontend: Vue 3 / Vite
- Database: PostgreSQL / Redis
- AI: Nemotron 9B
- Bot: Discord.js

## Installation
``````bash
npm install
npm run dev
``````

## Auteur
Gaëtan Langlet (Neo) - GL Digital Lab
"@ | Out-File -FilePath "README.md" -Encoding UTF8

# Package.json racine
@"
{
  `"name`": `"agence-ia-nemotron`",
  `"version`": `"1.0.0`",
  `"description`": `"Full Stack AI Agency with Nemotron 9B`",
  `"scripts`": {
    `"dev`": `"concurrently \`"npm run backend:dev\`" \`"npm run frontend:dev\`"`",
    `"backend:dev`": `"cd backend && npm run dev`",
    `"frontend:dev`": `"cd frontend && npm run dev`",
    `"install:all`": `"npm install && cd backend && npm install && cd ../frontend && npm install`"
  },
  `"devDependencies`": {
    `"concurrently`": `"^8.2.0`"
  }
}
"@ | Out-File -FilePath "package.json" -Encoding UTF8

# Backend package.json
@"
{
  `"name`": `"agence-ia-backend`",
  `"version`": `"1.0.0`",
  `"type`": `"module`",
  `"scripts`": {
    `"start`": `"node server.js`",
    `"dev`": `"nodemon server.js`"
  },
  `"dependencies`": {
    `"express`": `"^4.18.2`",
    `"cors`": `"^2.8.5`",
    `"dotenv`": `"^16.3.1`",
    `"socket.io`": `"^4.6.0`",
    `"axios`": `"^1.6.0`"
  },
  `"devDependencies`": {
    `"nodemon`": `"^3.0.2`"
  }
}
"@ | Out-File -FilePath "backend\package.json" -Encoding UTF8

# Frontend package.json
@"
{
  `"name`": `"agence-ia-frontend`",
  `"version`": `"1.0.0`",
  `"scripts`": {
    `"dev`": `"vite`",
    `"build`": `"vite build`"
  },
  `"dependencies`": {
    `"vue`": `"^3.4.0`",
    `"axios`": `"^1.6.0`"
  },
  `"devDependencies`": {
    `"vite`": `"^5.0.0`",
    `"@vitejs/plugin-vue`": `"^4.5.0`"
  }
}
"@ | Out-File -FilePath "frontend\package.json" -Encoding UTF8

# Server.js backend
@"
import express from 'express';
import cors from 'cors';

const app = express();
const PORT = 5000;

app.use(cors());
app.use(express.json());

app.get('/health', (req, res) => {
  res.json({ status: 'ok', message: 'Backend is running!' });
});

app.listen(PORT, () => {
  console.log(`🚀 Server running on http://localhost:${PORT}`);
});
"@ | Out-File -FilePath "backend\server.js" -Encoding UTF8

# Frontend files
@"
<!DOCTYPE html>
<html lang=`"fr`">
<head>
    <meta charset=`"UTF-8`">
    <meta name=`"viewport`" content=`"width=device-width, initial-scale=1.0`">
    <title>Agence IA</title>
</head>
<body>
    <div id=`"app`"></div>
    <script type=`"module`" src=`"/src/main.js`"></script>
</body>
</html>
"@ | Out-File -FilePath "frontend\index.html" -Encoding UTF8

@"
import { createApp } from 'vue'
import App from './App.vue'

createApp(App).mount('#app')
"@ | Out-File -FilePath "frontend\src\main.js" -Encoding UTF8

@"
<template>
  <div>
    <h1>🚀 Agence IA - Nemotron 9B</h1>
    <p>Frontend Vue 3 is running!</p>
  </div>
</template>

<script setup>
console.log('App loaded')
</script>

<style>
h1 { color: #00ff88; }
</style>
"@ | Out-File -FilePath "frontend\src\App.vue" -Encoding UTF8

@"
import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'

export default defineConfig({
  plugins: [vue()],
  server: { port: 3000 }
})
"@ | Out-File -FilePath "frontend\vite.config.js" -Encoding UTF8

# .env.example
@"
PORT=5000
DATABASE_URL=postgresql://user:pass@localhost/agence_ia
NEMOTRON_API_URL=http://localhost:8000
DISCORD_TOKEN=your-token-here
JWT_SECRET=your-secret-key
"@ | Out-File -FilePath ".env.example" -Encoding UTF8

Write-Host "✅ Fichiers créés" -ForegroundColor Green

# Git config
Write-Host "`n⚙️ Configuration Git..." -ForegroundColor Yellow
git config user.name "Gaëtan Langlet"
git config user.email "gtn.langlet@gmail.com"

# Premier commit
git add .
git commit -m "🎉 Initial commit - Agence IA Nemotron 9B"
Write-Host "✅ Premier commit créé" -ForegroundColor Green

Write-Host "`n✨ SETUP TERMINÉ!" -ForegroundColor Green
Write-Host "`n📋 Prochaines étapes:" -ForegroundColor Yellow
Write-Host "1. Créer le repo sur GitHub.com" -ForegroundColor White
Write-Host "2. git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git" -ForegroundColor DarkGray
Write-Host "3. git push -u origin main" -ForegroundColor DarkGray
Write-Host "4. npm run install:all" -ForegroundColor DarkGray
Write-Host "5. npm run dev" -ForegroundColor DarkGray
