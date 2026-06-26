# Student Task Manager

A Flask-based web application to manage students, track attendance, and assign tasks.

## Local Setup

1. Clone the repository.
2. Create a virtual environment: `python -m venv .venv`
3. Activate the virtual environment.
4. Install dependencies: `pip install -r requirements.txt`
5. Create a MySQL database named `student_task_manager`.
6. Import `schema.sql` into your database.
7. Set up `.env` with your database credentials:
   ```env
   DB_HOST=localhost
   DB_USER=root
   DB_PASSWORD=yourpassword
   DB_NAME=student_task_manager
   DB_PORT=3306
   ```
8. Run the app: `python app.py` or `flask run`

## Deployment on Render

This application is ready to be deployed on [Render](https://render.com).

### Prerequisites
- A GitHub repository with this code.
- A free Render account.
- A remote MySQL database (e.g., Aiven, PlanetScale, or a paid Render PostgreSQL instance if you migrate). Since Render doesn't offer free managed MySQL, you will need a third-party MySQL provider.

### Steps to Deploy

1. **Dashboard:** Log in to your Render dashboard and click **New+** -> **Web Service**.
2. **Connect Repository:** Connect your GitHub repository containing this code.
3. **Configuration:**
   - **Name:** Choose a name for your app (e.g., `student-task-manager`).
   - **Environment:** Select `Python 3`.
   - **Build Command:** `pip install -r requirements.txt`
   - **Start Command:** `gunicorn app:app`
4. **Environment Variables:** Scroll down to the **Environment Variables** section and add the following keys with the values for your remote MySQL database:
   - `DB_HOST`
   - `DB_USER`
   - `DB_PASSWORD`
   - `DB_NAME`
   - `DB_PORT` (usually 3306)
5. **Deploy:** Click **Create Web Service**. Render will automatically build and deploy your app.
6. **Access:** Once deployment is successful, you can access your app via the provided `.onrender.com` URL.
