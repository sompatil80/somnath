import mysql.connector

def get_database_connection():
    connection = mysql.connector.connect(
        host = 'localhost',
        user = 'root',
        password = 'Akash@1234',
        database = 'student_task_manager'
    )

    return connection