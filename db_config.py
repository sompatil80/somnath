import os
import mysql.connector
from dotenv import load_dotenv

load_dotenv()

def get_database_connection():
    connection = mysql.connector.connect(
        host = os.environ.get('DB_HOST', 'localhost'),
        user = os.environ.get('DB_USER', 'root'),
        password = os.environ.get('DB_PASSWORD', 'Akash@1234'),
        database = os.environ.get('DB_NAME', 'student_task_manager'),
        port = os.environ.get('DB_PORT', 3306)
    )

    return connection