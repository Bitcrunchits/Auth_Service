<div align="center">

# 🚀 Backend - APP ESCUELA - Microservicio de Auth_Service

Microservicio backend desarrollado en **Node.js + Express**, encargado de la gestión de usuarios, materias, tareas y entregas.  
Forma parte del ecosistema de microservicios del proyecto **APP ESCUELA**.

![Node.js](https://img.shields.io/badge/Node.js-v18.0+-green?style=flat-square)
![Express.js](https://img.shields.io/badge/Express.js-Framework-blue?style=flat-square)
![MongoDB](https://img.shields.io/badge/MongoDB-Mongoose-brightgreen?style=flat-square)
![Docker](https://img.shields.io/badge/Docker-Ready-blue?style=flat-square)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow?style=flat-square)

</div>

---

## 📚 Tabla de Contenidos

1. [Descripción General](#descripción-general)
2. [Arquitectura y Tecnologías](#arquitectura-y-tecnologías)
3. [Estructura del Proyecto](#estructura-del-proyecto)
4. [Instalación y Ejecución](#instalación-y-ejecución)
5. [Levantar Proyecto con Docker Compose](#arquitectura-de-despliegue-docker-compose)
6. [Configuración de Entorno](#configuración-de-entorno)
7. [Endpoints Principales](#endpoints-principales)
8. [Pruebas de API (Postman)](#pruebas-de-api-postman)
    * [8.1 Registro de Nuevo Usuario](#1-registro-de-nuevo-usuario)
    * [8.2 Inicio de Sesión (Obtener Token JWT)](#2-inicio-de-sesión-obtener-token-jwt)
    * [8.3 Acceso a Perfil del Usuario Logueado (Ruta Protegida)](#3-acceso-a-perfil-del-usuario-logueado-ruta-protegida)
9. [Buenas Prácticas y Estilo](#buenas-prácticas-y-estilo)
10. [Tests y Cobertura](#tests-y-cobertura)
11. [Contribución](#contribución)
12. [Licencia](#licencia)
13. [Autor](#autor)


---

## 🧠 Descripción General

Este backend provee servicios **RESTful** para la gestión académica:

- Registro de usuarios (alumnos, profesores, administradores)
- Administración de materias, tareas y entregas
- Comunicación entre servicios mediante **HTTP y JSON**

Diseñado bajo principios de **Clean Architecture** y separación por capas (**routes, controllers, services, models**).

---

## 🏗️ Arquitectura y Tecnologías

| Tecnología | Descripción |
|-------------|--------------|
| **Node.js** | Entorno de ejecución JavaScript |
| **Express.js** | Framework para la creación de APIs REST |
| **MongoDB / Mongoose** | Base de datos NoSQL y ODM |
| **Docker** | Contenerización del entorno |
| **Dotenv** | Gestión de variables de entorno |
| **Jest / Supertest** | Pruebas unitarias y de integración |

📐 **Patrón de diseño aplicado:** `MVC / Clean Architecture`

---

## 📁 Estructura del Proyecto

```bash
src/
 ├── config/          # Configuración general, variables de entorno y conexión DB
 ├── controllers/     # Controladores (lógica de manejo de peticiones)
 ├── routes/          # Definición de rutas de API (endpoints)
 ├── services/        # Lógica de negocio y comunicación con la DB (core)
 ├── models/          # Modelos y esquemas de Mongoose
 ├── middlewares/     # Middlewares personalizados (Autenticación, Autorización)
 ├── utils/           # Funciones auxiliares y manejo de errores
 ├── index.js         # Punto de entrada del servidor



⚙️ Instalación y Ejecución
1️⃣ Clonar el repositorio
git clone https://github.com/usuario/backend-app.git
cd backend-app

2️⃣ Instalar dependencias
npm install

3️⃣ Configurar variables de entorno

Crea un archivo .env en la raíz del proyecto con el siguiente contenido:

PORT=4000
DB_URI=mongodb://localhost:27017/app_escuela
JWT_SECRET=supersecreto_y_largo_aqui

4️⃣ Ejecutar en desarrollo
npm run dev

5️⃣ Ejecutar en producción
npm start

🔒 Configuración de Entorno

El proyecto usa la librería dotenv para cargar variables de entorno y realiza una validación estricta al inicio de la aplicación para asegurar la disponibilidad y el formato correcto de las variables críticas (DB_URI, JWT_SECRET, etc.).

## 🌐 Endpoints Principales

| 🧩 Módulo | 🔧 Método | 🛣️ Ruta | 📝 Descripción | 👤 Rol Requerido | ⚙️ Estado |
|:-----------|:----------|:--------|:----------------|:----------------|:----------|
| **Auth** | POST | `/api/auth/register` | Registrar nuevo usuario | Público | ✅ |
| **Auth** | POST | `/api/auth/login` | Iniciar sesión y obtener JWT | Público | ✅ |
| **User** | GET | `/api/users/profile` | Obtener perfil del usuario autenticado | Usuario (Cualquier Rol) | ✅ |
| **User** | GET | `/api/users` | Listar todos los usuarios activos | Admin / Secretaria | ✅ |
| **User** | PUT | `/api/users/:id` | Actualizar datos de usuario | Admin / Self-Service | ✅ |
| **User** | DELETE | `/api/users/:id` | Borrado lógico de usuario | Admin / Self-Service | ✅ |


🧩 Buenas Prácticas y Estilo

✅ Código estructurado por capas y responsabilidades (Controller, Service, Model)
✅ Controladores livianos y servicios reutilizables
✅ Validaciones de entrada con Joi o Express-validator
✅ Logs centralizados para depuración
✅ Cumple principios SOLID y Clean Code
✅ Manejo de seguridad basado en JWT y middlewares por rol

🧪 Tests y Cobertura

Ejecutar los tests con:

npm test

# 🔐 Microservicio de Autenticación (Auth Service)

Este microservicio gestiona el **registro**, **inicio de sesión** y la **sincronización de usuarios** con el sistema CORE utilizando **DNI** y **Contraseña**.  
Se encuentra **dockerizado** para asegurar un entorno de ejecución estable y despliegue consistente.

-----------------------------------------------------------------------------------------------------------------------------------------------------------------

## 🧱 Arquitectura de Despliegue (Docker Compose)

Este servicio se ejecuta mediante **Docker Compose**, el cual orquesta tres contenedores:

| Servicio        | Descripción |
|----------------|-------------|
| **backend-node** | Microservicio Node.js (Express) encargado de la autenticación y cliente de CORE y Notificaciones. |
| **mongo-server** | Base de datos MongoDB (oficial) donde se almacenan los usuarios. |
| **mongo-client** | Herramienta visual (Mongo Express) para consultar y administrar la base de datos. |

---

## 🚀 Inicio Rápido

### 1. Requisitos

Asegúrate de tener instalado:

- Docker
- Docker Compose (o Docker Desktop)

### 2. Construcción y Ejecución

Ejecuta el siguiente comando para construir las imágenes y levantar los contenedores:
sudo docker-compose up -d --build

3. Verificación de Estado
sudo docker-compose ps

Salida esperada:
| Name         | Command              | State | Ports                 |
| ------------ | -------------------- | ----- | --------------------- |
| backend-node | node src/index.js    | Up    | 0.0.0.0:3000→3000/tcp |
| mongo-server | docker-entrypoint.sh | Up    | 27017/tcp             |
| mongo-client | tini -- /docker-ent… | Up    | 0.0.0.0:8081→8081/tcp |

4. Acceso a Servicios
| Servicio      | URL                                            | Descripción                                  |
| ------------- | ---------------------------------------------- | -------------------------------------------- |
| Backend API   | [http://localhost:3000](http://localhost:3000) | Punto de entrada del microservicio.          |
| Mongo Express | [http://localhost:8081](http://localhost:8081) | Panel visual para administración de MongoDB. |

💻 Pruebas Locales del Frontend

Para probar el flujo de autenticación completo (Login con DNI), se utiliza un cliente estático en HTML/JavaScript.

Ubicación del Archivo

El archivo de prueba se encuentra en la ruta:

PROYECTOMICROSERVICIOS/Atuth_Service-Front/login.html


Ejecución de la Prueba

Iniciar el Backend: Asegúrate de que el backend esté corriendo correctamente con Docker Compose (ver sección Inicio Rápido).

Abrir el Frontend: Usa una extensión de servidor local para VS Code (como Live Server) para abrir el archivo login.html.

Acceso Directo: La URL local para el login será similar a: http://127.0.0.1:5500/Atuth_Service-Front/login.html

Puntos a Verificar en el Login

Usuario: Se debe ingresar el DNI del usuario (no el email).

Contraseña: La contraseña debe coincidir con la registrada.

Petición: El JavaScript del login.html debe estar configurado para apuntar a la URL del backend expuesta por Docker: http://localhost:3000/api/auth/login.

## 🧪 Pruebas de API (Postman)

Todas las pruebas deben realizarse contra el puerto expuesto por Docker Compose:

http://localhost:3000
---

### 1. Registro de Nuevo Usuario

Esta ruta permite crear usuarios de prueba antes de probar el login.

| Detalle | Configuración |
|--------|---------------|
| **Método** | POST |
| **Ruta** | `http://localhost:3000/api/auth/register` |
| **Autenticación** | **No Auth** (Público) |
| **Body (JSON)** | Se requiere `nombre`, `email`, `password`, `dni`, `rol` |

**Cuerpo de la petición:**

```json
{
  "nombre": "Prueba Registro Admin",
  "email": "admin@registro.com",
  "password": "PasswordSeguro123",
  "dni": "12345678",
  "rol": "admin"
}

Respuesta esperada (201 Created):
{
  "message": "Usuario registrado exitosamente.",
  "user": {
    "id": "690a91f71bd468a5422688e9",
    "nombre": "Prueba Registro Admin",
    "email": "admin@registro.com",
    "rol": "admin",
    "dni": "12345678"
  }
}

2. Inicio de Sesión (Obtener Token JWT)

Ruta principal de login. Devuelve un token válido para usar en rutas protegidas.

| Detalle           | Configuración                          |
| ----------------- | -------------------------------------- |
| **Método**        | POST                                   |
| **Ruta**          | `http://localhost:3000/api/auth/login` |
| **Autenticación** | **No Auth** (Público)                  |
| **Body (JSON)**   | Se requiere `email` y `password`       |

Cuerpo de la petición:

{
  "dni": "12345678",
  "password": "PasswordSeguro123"
}

Respuesta esperada (200 OK):
{
  "message": "Login exitoso.",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9....",
  "user": {
    "_id": "690a91f71bd468a5422688e9",
    "nombre": "Prueba Registro Admin",
    "email": "admin@registro.com",
    "rol": "admin",
    "estado": "active",
    "dni": "12345678",
    "createdAt": "2025-11-04T23:53:27.299Z",
    "updatedAt": "2025-11-04T23:53:27.299Z"
  }
}

3. Acceso a Perfil del Usuario Logueado (Ruta Protegida)

Confirma que el middleware JWT está funcionando correctamente.
| Detalle           | Configuración                                    |
| ----------------- | ------------------------------------------------ |
| **Método**        | GET                                              |
| **Ruta**          | `http://localhost:3000/api/users/profile`        |
| **Autenticación** | **Bearer Token** → usar token obtenido del login |
| **Body**          | Ninguno                                          |

Respuesta esperada (200 OK):
{
  "message": "Acceso concedido al perfil.",
  "user": {
    "_id": "690a91f71bd468a5422688e9",
    "nombre": "Prueba Registro Admin",
    "email": "admin@registro.com",
    "rol": "admin",
    "estado": "active",
    "dni": "12345678",
    "createdAt": "2025-11-04T23:53:27.299Z",
    "updatedAt": "2025-11-04T23:53:27.299Z"
  },
  "rol": "admin"
}






⚙️ Configuración y Variables de Entorno

El contenedor backend-node lee las variables del .env y docker-compose.yml.

Variable	Descripción	Ejemplo / Valor
PORT	Puerto del backend	3000
MONGO_DB	Nombre de la DB	auth_db
MONGODB_URI	URI de conexión	mongodb://mongo-server:27017/auth_db
JWT_SECRET	Clave para firmar tokens	(Secreto)

Nota importante: En Docker Compose, la URI debe usar el nombre del servicio:
mongodb://mongo-server:27017/auth_db

🔒 Lógica de Autenticación (Flujo Final)

Se realizaron ajustes para que el login utilice DNI:

Componente	Cambio Aplicado
Frontend (Login JS)	Envía el campo dni en lugar de email.
Backend (Controller)	Extrae dni del body de la request.
Backend (Service)	Busca al usuario por dni en MongoDB.

Esto asegura autenticación basada en DNI + Contraseña.

🗑️ Limpieza

Detener y eliminar contenedores:

sudo docker-compose down


Eliminar contenedores y volúmenes (borra la base de datos):

sudo docker-compose down -v

-----------------------------------------------------------------------------------------------------

🤝 Contribución

Crea una rama nueva desde develop

Realiza tus cambios y ejecuta los tests

Crea un Pull Request con descripción detallada

Respeta las convenciones de commits y nombres de ramas

Ejemplo:

git checkout -b feature/nueva-funcionalidad

📄 Licencia

Este proyecto está bajo la licencia MIT.
Consulta el archivo LICENSE
 para más información.

<div align="center">
👨‍💻 Autor

Ricardo Burdiles
Desarrollador Backend | Node.js + Express

⭐ Si este proyecto te fue útil, no olvides dejar una estrella en el repositorio.
¡Gracias por tu apoyo! 🙌

</div> ```





