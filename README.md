# Vand-Shop
--------------description-------


1️ Choix et configuration de la base de données

Pour ce projet, j'ai choisi MySQL avec Prisma ORM pour les raisons suivantes :

Fiabilité et robustesse : MySQL est une base de données relationnelle éprouvée, adaptée à la gestion des relations complexes entre utilisateurs, produits, catégories et ventes.

Compatibilité avec Prisma : Prisma supporte MySQL de manière native, offrant un client type-safe pour TypeScript, facilitant les requêtes et réduisant les erreurs.

Facilité de migration et seed : Prisma permet de gérer facilement les migrations de schéma et l’insertion de données initiales.

Scalabilité : MySQL peut gérer des bases de données de grande taille et des requêtes concurrentes efficacement.

Configuration

Installation MySQL (exemple Ubuntu) :

sudo apt update
sudo apt install mysql-server
sudo mysql_secure_installation


Création de la base de données :

CREATE DATABASE vandshop;
CREATE USER 'vandshop_user'@'localhost' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON vandshop.* TO 'vandshop_user'@'localhost';
FLUSH PRIVILEGES;


Configuration Prisma dans prisma/schema.prisma :

datasource db {
  provider = "mysql"
  url      = env("DATABASE_URL") // ex: mysql://vandshop_user:password@localhost:3306/vandshop
}

generator client {
  provider = "prisma-client-js"
}


Génération du client Prisma :

npx prisma generate


Application des migrations :

npx prisma migrate dev --name init

/somthing
