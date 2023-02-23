import mysql.connector
from PyQt5.QtWidgets import QMessageBox
from mysql.connector import Error


class my_database:

    def connect_to_database(self, user_name, password):
        connection = []
        try:
            connection = mysql.connector.connect(host='localhost', database='projektdb', user=user_name, password=password)

            if connection.is_connected():
                cursor = connection.cursor()
                cursor.execute("select database();")
                record = cursor.fetchone()
                record_message = str(record)
                self.display_info_box("You're connected to database: " + record_message)

        except Error as e:
            error_message = str(e)
            self.display_error_box("Error occurred while connecting to the database: " + error_message)

        return connection

    def disconnect_from_database(self, connection):
        if connection.is_connected():
            connection.cursor().close()
            connection.close()
            self.display_info_box("MySQL connection was closed")
        else:
            self.display_info_box("MySQL connection was not closed, because it was not created.")

    def perform_command(self, connection, command):
        try:
            if connection.is_connected():
                cursor = connection.cursor()
                cursor.execute(command)
                result = cursor.fetchall()
                return result

        except Error as e:
            error_message = str(e)
            self.display_error_box("Database returned an error while performing the action: " + error_message)

    @staticmethod
    def display_error_box(message):
        message_box = QMessageBox()
        message_box.setIcon(QMessageBox.Critical)
        message_box.setText(message)
        message_box.setWindowTitle("Error...")
        message_box.setStandardButtons(QMessageBox.Ok)
        message_box.exec_()

    @staticmethod
    def display_info_box(message):
        message_box = QMessageBox()
        message_box.setIcon(QMessageBox.Information)
        message_box.setText(message)
        message_box.setWindowTitle("Info...")
        message_box.setStandardButtons(QMessageBox.Ok)
        message_box.exec_()
