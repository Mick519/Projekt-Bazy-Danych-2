import re
from PyQt5.QtCore import Qt
from PyQt5.QtWidgets import QPushButton, QLabel, QTableWidget, QInputDialog, QLineEdit
from PyQt5.QtWidgets import *
from datetime import date

from my_database import my_database


class user_interface(QMainWindow):
    def __init__(self):
        super().__init__()

        self.database = my_database()
        self.connection = None

        self.setWindowTitle("Inventory app")

        # Obiekty okna logowania
        self.label_login = QLabel("Please provide credentials", self)
        self.label_user_name = QLabel("username", self)
        self.label_password = QLabel("password", self)
        self.text_box_user = QLineEdit(self)
        self.text_box_password = QLineEdit(self)
        self.text_box_password.setEchoMode(QLineEdit.Password)
        self.button_login = QPushButton("Login", self)
        self.hide_login_menu()

        # Obiekty interfejsu użytkownika
        # 1 linia
        self.button_exit = QPushButton("Exit", self)
        self.button_complete_equipment_list = QPushButton("Complete equipment list", self)
        self.button_complete_accessory_list = QPushButton("Complete accessory list", self)
        self.button_in_stock_equipment_list = QPushButton("In stock equipment list", self)
        self.button_all_users_list = QPushButton("All users list", self)
        self.button_user_equipment_list = QPushButton("User equipment list", self)
        self.button_search_user_data = QPushButton("Search user data", self)
        self.button_search_equipment_data = QPushButton("Search equipment data", self)

        # 2 linia
        self.button_assign_equipment = QPushButton("Assign equipment", self)
        self.button_assign_accessory = QPushButton("Assign accessory", self)
        self.button_return_equipment = QPushButton("Return equipment", self)

        # 3 linia
        self.button_add_equipment = QPushButton("Add equipment", self)
        self.button_remove_equipment = QPushButton("Remove equipment", self)
        self.button_add_accessory = QPushButton("Add accessory", self)
        self.button_add_user = QPushButton("Add user", self)
        self.button_remove_user = QPushButton("Remove user", self)

        # Tablica z wynikami
        self.table_result = QTableWidget(self)

        # Tablice z wynikami oraz ich opisy dla funkcji Search user data i search equipment data
        self.table_user_equipment = QTableWidget(self)
        self.table_accessories = QTableWidget(self)
        self.table_equipment_correlation = QTableWidget(self)
        self.table_operation_history = QTableWidget(self)

        self.label_table_user = QLabel("Information", self)
        self.label_table_accessories = QLabel("Assigned accessories", self)
        self.label_table_equipment_correlation = QLabel("Hosts", self)
        self.label_table_operation_history = QLabel("History of related operations", self)

        self.hide_main_menu()

        # Rozpoczęcie programu od wywołania menu logowania
        self.display_login_menu()

    def display_login_menu(self):
        self.setFixedSize(250, 210)

        self.label_login.show()
        self.label_login.setGeometry(0, 0, 250, 30)
        self.label_login.setAlignment(Qt.AlignCenter)

        self.label_user_name.show()
        self.label_user_name.setGeometry(0, 30, 250, 30)
        self.label_user_name.setAlignment(Qt.AlignCenter)

        self.label_password.show()
        self.label_password.setGeometry(0, 90, 250, 30)
        self.label_password.setAlignment(Qt.AlignCenter)

        self.text_box_user.show()
        self.text_box_user.setGeometry(0, 60, 250, 30)

        self.text_box_password.show()
        self.text_box_password.setGeometry(0, 120, 250, 30)

        self.button_login.show()
        self.button_login.clicked.connect(self.create_connection)
        self.button_login.setGeometry(0, 160, 250, 50)

    def hide_login_menu(self):
        self.label_login.hide()
        self.label_user_name.hide()
        self.label_password.hide()
        self.text_box_user.hide()
        self.text_box_password.hide()
        self.button_login.hide()

    def create_connection(self):
        user_name = self.text_box_user.displayText()
        self.text_box_password.setEchoMode(QLineEdit.Normal)
        password = self.text_box_password.displayText()

        self.connection = self.database.connect_to_database(user_name, password)

        try:
            if self.connection.is_connected():
                self.hide_login_menu()
                self.display_main_menu()
        except:
            return

    def close_connection(self):
        self.database.disconnect_from_database(self.connection)
        exit(0)

    def display_main_menu(self):
        self.setFixedSize(1280, 800)

        self.button_exit.show()
        self.button_exit.clicked.connect(self.close_connection)
        self.button_exit.setGeometry(0, 0, 50, 30)

        self.button_complete_equipment_list.show()
        self.button_complete_equipment_list.clicked.connect(self.display_complete_equipment_list)
        self.button_complete_equipment_list.setGeometry(50, 0, 150, 30)

        self.button_complete_accessory_list.show()
        self.button_complete_accessory_list.clicked.connect(self.display_complete_accessory_list)
        self.button_complete_accessory_list.setGeometry(200, 0, 150, 30)

        self.button_in_stock_equipment_list.show()
        self.button_in_stock_equipment_list.clicked.connect(self.display_in_stock_equipment_list)
        self.button_in_stock_equipment_list.setGeometry(350, 0, 150, 30)

        self.button_all_users_list.show()
        self.button_all_users_list.clicked.connect(self.display_all_user_list)
        self.button_all_users_list.setGeometry(500, 0, 150, 30)

        self.button_user_equipment_list.show()
        self.button_user_equipment_list.clicked.connect(self.display_user_equipment_list)
        self.button_user_equipment_list.setGeometry(650, 0, 150, 30)

        self.button_search_user_data.show()
        self.button_search_user_data.clicked.connect(self.display_search_user_data)
        self.button_search_user_data.setGeometry(800, 0, 150, 30)

        self.button_search_equipment_data.show()
        self.button_search_equipment_data.clicked.connect(self.display_search_equipment_data)
        self.button_search_equipment_data.setGeometry(950, 0, 150, 30)

        self.button_assign_equipment.show()
        self.button_assign_equipment.clicked.connect(self.assign_equipment)
        self.button_assign_equipment.setGeometry(0, 40, 150, 30)

        self.button_assign_accessory.show()
        self.button_assign_accessory.clicked.connect(self.assign_accessory)
        self.button_assign_accessory.setGeometry(150, 40, 150, 30)

        self.button_return_equipment.show()
        self.button_return_equipment.clicked.connect(self.return_equipment)
        self.button_return_equipment.setGeometry(300, 40, 150, 30)

        self.button_add_equipment.show()
        self.button_add_equipment.clicked.connect(self.add_equipment)
        self.button_add_equipment.setGeometry(0, 80, 150, 30)

        self.button_remove_equipment.show()
        self.button_remove_equipment.clicked.connect(self.remove_equipment)
        self.button_remove_equipment.setGeometry(150, 80, 150, 30)

        self.button_add_accessory.show()
        self.button_add_accessory.clicked.connect(self.add_accessory)
        self.button_add_accessory.setGeometry(300, 80, 150, 30)

        self.button_add_user.show()
        self.button_add_user.clicked.connect(self.add_user)
        self.button_add_user.setGeometry(450, 80, 150, 30)

        self.button_remove_user.show()
        self.button_remove_user.clicked.connect(self.remove_user)
        self.button_remove_user.setGeometry(600, 80, 150, 30)

        self.table_result.show()
        self.table_result.setGeometry(0, 200, 1280, 600)

    def hide_main_menu(self):
        self.button_exit.hide()
        self.button_complete_equipment_list.hide()
        self.button_complete_accessory_list.hide()
        self.button_in_stock_equipment_list.hide()
        self.button_all_users_list.hide()
        self.button_user_equipment_list.hide()
        self.button_search_user_data.hide()
        self.button_search_equipment_data.hide()
        self.table_result.hide()
        self.hide_search_user_tables()
        self.button_assign_equipment.hide()
        self.button_assign_accessory.hide()
        self.button_return_equipment.hide()
        self.button_add_equipment.hide()
        self.button_remove_equipment.hide()
        self.button_add_accessory.hide()
        self.button_add_user.hide()
        self.button_remove_user.hide()

    def hide_search_user_tables(self):
        self.table_user_equipment.hide()
        self.table_accessories.hide()
        self.table_equipment_correlation.hide()
        self.table_operation_history.hide()

        self.label_table_user.hide()
        self.label_table_accessories.hide()
        self.label_table_equipment_correlation.hide()
        self.label_table_operation_history.hide()

    def show_search_user_tables(self):
        self.table_user_equipment.show()
        self.table_user_equipment.setGeometry(40, 200, 580, 260)

        self.table_accessories.show()
        self.table_accessories.setGeometry(40, 500, 580, 260)

        self.table_equipment_correlation.show()
        self.table_equipment_correlation.setGeometry(660, 200, 580, 260)

        self.table_operation_history.show()
        self.table_operation_history.setGeometry(660, 500, 580, 260)

        self.label_table_user.show()
        self.label_table_user.setGeometry(40, 170, 580, 30)
        self.label_table_user.setAlignment(Qt.AlignCenter)

        self.label_table_accessories.show()
        self.label_table_accessories.setGeometry(40, 470, 580, 30)
        self.label_table_accessories.setAlignment(Qt.AlignCenter)

        self.label_table_equipment_correlation.show()
        self.label_table_equipment_correlation.setGeometry(660, 170, 580, 30)
        self.label_table_equipment_correlation.setAlignment(Qt.AlignCenter)

        self.label_table_operation_history.show()
        self.label_table_operation_history.setGeometry(660, 470, 580, 30)
        self.label_table_operation_history.setAlignment(Qt.AlignCenter)

    def display_complete_equipment_list(self):
        self.table_result.show()
        self.hide_search_user_tables()
        result = self.database.perform_command(self.connection, "select * from calkowita_lista_sprzetu")
        if not result:
            self.table_result.clear()
            self.table_result.setRowCount(0)
            self.table_result.setColumnCount(0)
        else:
            self.table_result.setColumnCount(8)
            self.table_result.setHorizontalHeaderLabels(
                ["model_sprzetu", "identyfikator_wewnetrzny_sprzetu", "adres_mac_ethernet", "adres_mac_wifi",
                 "numer_seryjny", "producent", "cykl_zycia", "stan"])
            row_count = 0
            for model_sprzetu, identyfikator_wewnetrzny_sprzetu, adres_mac_ethernet, adres_mac_wifi, numer_seryjny, producent, cykl_zycia, stan in result:
                self.table_result.setRowCount(row_count + 1)
                self.table_result.setItem(row_count, 0, QTableWidgetItem(model_sprzetu))
                self.table_result.setItem(row_count, 1, QTableWidgetItem(identyfikator_wewnetrzny_sprzetu))
                self.table_result.setItem(row_count, 2, QTableWidgetItem(adres_mac_ethernet))
                self.table_result.setItem(row_count, 3, QTableWidgetItem(adres_mac_wifi))
                self.table_result.setItem(row_count, 4, QTableWidgetItem(numer_seryjny))
                self.table_result.setItem(row_count, 5, QTableWidgetItem(producent))
                self.table_result.setItem(row_count, 6, QTableWidgetItem(cykl_zycia))
                self.table_result.setItem(row_count, 7, QTableWidgetItem(stan))
                row_count = row_count + 1

    def display_complete_accessory_list(self):
        self.table_result.show()
        self.hide_search_user_tables()
        result = self.database.perform_command(self.connection, "select * from lista_akcesoriow_w_magazynie")
        if not result:
            self.table_result.clear()
            self.table_result.setRowCount(0)
            self.table_result.setColumnCount(0)
        else:
            self.table_result.setColumnCount(4)
            self.table_result.setHorizontalHeaderLabels(
                ["model_akcesorium", "producent", "identyfikator_wewnetrzny_modelu", "ilosc"])
            row_count = 0
            for model_akcesorium, producent, identyfikator_wewnetrzny_modelu, ilosc in result:
                self.table_result.setRowCount(row_count + 1)
                self.table_result.setItem(row_count, 0, QTableWidgetItem(model_akcesorium))
                self.table_result.setItem(row_count, 1, QTableWidgetItem(producent))
                self.table_result.setItem(row_count, 2, QTableWidgetItem(identyfikator_wewnetrzny_modelu))
                self.table_result.setItem(row_count, 3, QTableWidgetItem(str(ilosc)))
                row_count = row_count + 1

    def display_in_stock_equipment_list(self):
        self.table_result.show()
        self.hide_search_user_tables()
        result = self.database.perform_command(self.connection, "select * from lista_sprzetu_w_magazynie")
        if not result:
            self.table_result.clear()
            self.table_result.setRowCount(0)
            self.table_result.setColumnCount(0)
        else:
            self.table_result.setColumnCount(8)
            self.table_result.setHorizontalHeaderLabels(
                ["model_sprzetu", "identyfikator_wewnetrzny_sprzetu", "adres_mac_ethernet", "adres_mac_wifi",
                 "numer_seryjny", "producent", "cykl_zycia", "stan"])
            row_count = 0
            for model_sprzetu, identyfikator_wewnetrzny_sprzetu, adres_mac_ethernet, adres_mac_wifi, numer_seryjny, producent, cykl_zycia, stan in result:
                self.table_result.setRowCount(row_count + 1)
                self.table_result.setItem(row_count, 0, QTableWidgetItem(model_sprzetu))
                self.table_result.setItem(row_count, 1, QTableWidgetItem(identyfikator_wewnetrzny_sprzetu))
                self.table_result.setItem(row_count, 2, QTableWidgetItem(adres_mac_ethernet))
                self.table_result.setItem(row_count, 3, QTableWidgetItem(adres_mac_wifi))
                self.table_result.setItem(row_count, 4, QTableWidgetItem(numer_seryjny))
                self.table_result.setItem(row_count, 5, QTableWidgetItem(producent))
                self.table_result.setItem(row_count, 6, QTableWidgetItem(cykl_zycia))
                self.table_result.setItem(row_count, 7, QTableWidgetItem(stan))
                row_count = row_count + 1

    def display_all_user_list(self):
        self.table_result.show()
        self.hide_search_user_tables()
        result = self.database.perform_command(self.connection, "select * from uzytkownicy")
        if not result:
            self.table_result.clear()
            self.table_result.setRowCount(0)
            self.table_result.setColumnCount(0)
        else:
            self.table_result.setColumnCount(4)
            self.table_result.setHorizontalHeaderLabels(
                ["imie", "nazwisko", "stanowisko", "identyfikator_wewnetrzny_uzytkownika"])
            row_count = 0
            for imie, nazwisko, stanowisko, identyfikator_wewnetrzny_uzytkownika in result:
                self.table_result.setRowCount(row_count + 1)
                self.table_result.setItem(row_count, 0, QTableWidgetItem(imie))
                self.table_result.setItem(row_count, 1, QTableWidgetItem(nazwisko))
                self.table_result.setItem(row_count, 2, QTableWidgetItem(stanowisko))
                self.table_result.setItem(row_count, 3, QTableWidgetItem(str(identyfikator_wewnetrzny_uzytkownika)))
                row_count = row_count + 1

    # Funkcja wywala błąd przy drugiej próbie użycia jakiejkolwiek innej funkcji
    def display_user_equipment_list(self):
        response_input_dialog = QInputDialog.getText(self, 'Input Dialog', 'Enter user id:')
        if response_input_dialog[1]:
            self.table_result.show()
            self.hide_search_user_tables()
            result = self.database.perform_command(self.connection, "select * from przypisany_sprzet where identyfikator_wewntrzny_uzytkownika = '" + str(response_input_dialog[0]) + "'")
            if not result:
                self.table_result.clear()
                self.table_result.setRowCount(0)
                self.table_result.setColumnCount(0)
            else:
                self.table_result.setColumnCount(3)
                self.table_result.setHorizontalHeaderLabels(["identyfikator_wewnetrzny_sprzetu", "data_przypisania", "identyfikator_wewntrzny_uzytkownika"])
                row_count = 0
                for identyfikator_wewnetrzny_sprzetu, data_przypisania, identyfikator_wewntrzny_uzytkownika in result:
                    self.table_result.setRowCount(row_count + 1)
                    self.table_result.setItem(row_count, 0, QTableWidgetItem(identyfikator_wewnetrzny_sprzetu))
                    self.table_result.setItem(row_count, 1, QTableWidgetItem(str(data_przypisania)))
                    self.table_result.setItem(row_count, 2, QTableWidgetItem(str(identyfikator_wewntrzny_uzytkownika)))
                    row_count = row_count + 1

    def display_search_user_data(self):
        response_input_dialog = QInputDialog.getText(self, 'Input Dialog', 'Enter user id:')
        if response_input_dialog[1]:
            self.table_result.hide()
            self.show_search_user_tables()
            result = self.database.perform_command(self.connection, "select * from uzytkownicy where identyfikator_wewnetrzny_uzytkownika = '" + response_input_dialog[0] + "'")
            if not result:
                self.table_user_equipment.clear()
                self.table_user_equipment.setRowCount(0)
                self.table_user_equipment.setColumnCount(0)
            else:
                self.table_user_equipment.setColumnCount(4)
                self.table_user_equipment.setHorizontalHeaderLabels(
                    ["imie", "nazwisko", "stanowisko", "identyfikator_wewnetrzny_uzytkownika"])
                row_count = 0
                for imie, nazwisko, stanowisko, identyfikator_wewnetrzny_uzytkownika in result:
                    self.table_user_equipment.setRowCount(row_count + 1)
                    self.table_user_equipment.setItem(row_count, 0, QTableWidgetItem(imie))
                    self.table_user_equipment.setItem(row_count, 1, QTableWidgetItem(nazwisko))
                    self.table_user_equipment.setItem(row_count, 2, QTableWidgetItem(stanowisko))
                    self.table_user_equipment.setItem(row_count, 3, QTableWidgetItem(str(identyfikator_wewnetrzny_uzytkownika)))
                    row_count = row_count + 1

            result = self.database.perform_command(self.connection, "select * from korelacja_uzytkownika_ze_sprzetem where identyfikator_wewnetrzny_uzytkownika = '" + response_input_dialog[0] + "'")
            if not result:
                self.table_equipment_correlation.clear()
                self.table_equipment_correlation.setRowCount(0)
                self.table_equipment_correlation.setColumnCount(0)
            else:
                self.table_equipment_correlation.setColumnCount(4)
                self.table_equipment_correlation.setHorizontalHeaderLabels(
                    ["nazwa_hosta", "identyfikator_wewnetrzny_uzytkownika", "uprawnienia",
                     "identyfikator_wewnetrzny_sprzetu"])
                row_count = 0
                for nazwa_hosta, identyfikator_wewnetrzny_uzytkownika, uprawnienia, identyfikator_wewnetrzny_sprzetu in result:
                    self.table_equipment_correlation.setRowCount(row_count + 1)
                    self.table_equipment_correlation.setItem(row_count, 0, QTableWidgetItem(nazwa_hosta))
                    self.table_equipment_correlation.setItem(row_count, 1, QTableWidgetItem(
                        str(identyfikator_wewnetrzny_uzytkownika)))
                    self.table_equipment_correlation.setItem(row_count, 2, QTableWidgetItem(uprawnienia))
                    self.table_equipment_correlation.setItem(row_count, 3, QTableWidgetItem(identyfikator_wewnetrzny_sprzetu))
                    row_count = row_count + 1

            result = self.database.perform_command(self.connection, "select * from historia_operacji where identyfikator_wewnetrzny_uzytkownika = '" + str(response_input_dialog[0]) + "'")
            if not result:
                self.table_operation_history.clear()
                self.table_operation_history.setRowCount(0)
                self.table_operation_history.setColumnCount(0)
            else:
                self.table_operation_history.setColumnCount(5)
                self.table_operation_history.setHorizontalHeaderLabels(["operacja", "data_operacji", "identyfikator_wewnetrzny_modelu", "identyfikator_wewnetrzny_uzytkownika", "rodzaj"])
                row_count = 0
                for operacja, data_operacji, identyfikator_wewnetrzny_modelu, identyfikator_wewnetrzny_uzytkownika, rodzaj in result:
                    self.table_operation_history.setRowCount(row_count + 1)
                    self.table_operation_history.setItem(row_count, 0, QTableWidgetItem(str(operacja)))
                    self.table_operation_history.setItem(row_count, 1, QTableWidgetItem(str(data_operacji)))
                    self.table_operation_history.setItem(row_count, 2, QTableWidgetItem(str(identyfikator_wewnetrzny_modelu)))
                    self.table_operation_history.setItem(row_count, 3, QTableWidgetItem(str(identyfikator_wewnetrzny_uzytkownika)))
                    self.table_operation_history.setItem(row_count, 4, QTableWidgetItem(str(rodzaj)))
                    row_count = row_count + 1

            result = self.database.perform_command(self.connection, "select distinct identyfikator_wewnetrzny_modelu from przypisane_akcesoria where identyfikator_wewnetrzny_uzytkownika = '" + response_input_dialog[0] + "'")
            if not result:
                self.table_accessories.clear()
                self.table_accessories.setRowCount(0)
                self.table_accessories.setColumnCount(0)
            else:
                self.table_accessories.setColumnCount(4)
                self.table_accessories.setHorizontalHeaderLabels(["model_akcesorium", "producent", "identyfikator_wewnetrzny_modelu", "ilosc"])
                row_count = 0
                for accessory_id in result:
                    accessory_id = str(accessory_id)
                    accessory_id = re.search(r'\d+', accessory_id).group()
                    accessory_id = int(accessory_id)
                    accessory_amount = self.database.perform_command(self.connection, "select count(*) from przypisane_akcesoria where identyfikator_wewnetrzny_uzytkownika = '" + str(response_input_dialog[0]) + "' and identyfikator_wewnetrzny_modelu = '" + str(accessory_id) + "'")
                    accessory_amount = str(accessory_amount)
                    accessory_amount = re.search(r'\d+', accessory_amount).group()
                    accessory_amount = str(accessory_amount)
                    accessory_model = str(self.database.perform_command(self.connection, "select model_akcesorium from akcesoria where identyfikator_wewnetrzny_modelu = '" + str(accessory_id) + "'"))
                    accessory_model = accessory_model[3:]
                    accessory_model = accessory_model[:-4]
                    accessory_producer = str(self.database.perform_command(self.connection, "select producent from akcesoria where identyfikator_wewnetrzny_modelu = '" + str(accessory_id) + "'"))
                    accessory_producer = accessory_producer[3:]
                    accessory_producer = accessory_producer[:-4]
                    self.table_accessories.setRowCount(row_count + 1)
                    self.table_accessories.setItem(row_count, 0, QTableWidgetItem(str(accessory_model)))
                    self.table_accessories.setItem(row_count, 1, QTableWidgetItem(str(accessory_producer)))
                    self.table_accessories.setItem(row_count, 2, QTableWidgetItem(str(accessory_id)))
                    self.table_accessories.setItem(row_count, 3, QTableWidgetItem(str(accessory_amount)))
                    row_count = row_count + 1

    def display_search_equipment_data(self):
        response_input_dialog = QInputDialog.getText(self, 'Input Dialog', 'Enter equipment id:')
        if response_input_dialog[1]:
            self.table_result.hide()
            self.show_search_user_tables()
            self.table_accessories.hide()
            self.label_table_accessories.hide()

            result = self.database.perform_command(self.connection, "select * from sprzet where identyfikator_wewnetrzny_sprzetu = '" + response_input_dialog[0] + "'")
            if not result:
                self.table_user_equipment.clear()
                self.table_user_equipment.setRowCount(0)
                self.table_user_equipment.setColumnCount(0)
            else:
                self.table_user_equipment.setColumnCount(8)
                self.table_user_equipment.setHorizontalHeaderLabels(
                    ["model_sprzetu", "identyfikator_wewnetrzny_sprzetu", "adres_mac_ethernet",
                     "adres_mac_wifi, numer_seryjny", "producent", "cykl_zycia, stan"])
                row_count = 0
                for model_sprzetu, identyfikator_wewnetrzny_sprzetu, adres_mac_ethernet, adres_mac_wifi, numer_seryjny, producent, cykl_zycia, stan in result:
                    self.table_user_equipment.setRowCount(row_count + 1)
                    self.table_user_equipment.setItem(row_count, 0, QTableWidgetItem(model_sprzetu))
                    self.table_user_equipment.setItem(row_count, 1, QTableWidgetItem(identyfikator_wewnetrzny_sprzetu))
                    self.table_user_equipment.setItem(row_count, 2, QTableWidgetItem(adres_mac_ethernet))
                    self.table_user_equipment.setItem(row_count, 3, QTableWidgetItem(adres_mac_wifi))
                    self.table_user_equipment.setItem(row_count, 4, QTableWidgetItem(numer_seryjny))
                    self.table_user_equipment.setItem(row_count, 5, QTableWidgetItem(producent))
                    self.table_user_equipment.setItem(row_count, 6, QTableWidgetItem(cykl_zycia))
                    self.table_user_equipment.setItem(row_count, 7, QTableWidgetItem(stan))
                    row_count = row_count + 1

            result = self.database.perform_command(self.connection,
                                                          "select * from korelacja_uzytkownika_ze_sprzetem where identyfikator_wewnetrzny_sprzetu = '" +
                                                   response_input_dialog[0] + "'")
            if not result:
                self.table_equipment_correlation.clear()
                self.table_equipment_correlation.setRowCount(0)
                self.table_equipment_correlation.setColumnCount(0)
            else:

                self.table_equipment_correlation.setColumnCount(4)
                self.table_equipment_correlation.setHorizontalHeaderLabels(
                    ["nazwa_hosta", "identyfikator_wewnetrzny_uzytkownika", "uprawnienia",
                     "identyfikator_wewnetrzny_sprzetu"])
                row_count = 0
                for nazwa_hosta, identyfikator_wewnetrzny_uzytkownika, uprawnienia, identyfikator_wewnetrzny_sprzetu in result:
                    self.table_equipment_correlation.setRowCount(row_count + 1)
                    self.table_equipment_correlation.setItem(row_count, 0, QTableWidgetItem(nazwa_hosta))
                    self.table_equipment_correlation.setItem(row_count, 1, QTableWidgetItem(
                        str(identyfikator_wewnetrzny_uzytkownika)))
                    self.table_equipment_correlation.setItem(row_count, 2, QTableWidgetItem(uprawnienia))
                    self.table_equipment_correlation.setItem(row_count, 3,
                                                             QTableWidgetItem(identyfikator_wewnetrzny_sprzetu))
                    row_count = row_count + 1

            result = self.database.perform_command(self.connection, "select * from historia_operacji where identyfikator_wewnetrzny_modelu = '" + response_input_dialog[0] + "'")
            if not result:
                self.table_operation_history.clear()
                self.table_operation_history.setRowCount(0)
                self.table_operation_history.setColumnCount(0)
            else:
                self.table_operation_history.setColumnCount(5)
                self.table_operation_history.setHorizontalHeaderLabels(
                    ["operacja", "data_operacji", "identyfikator_wewnetrzny_modelu",
                     "identyfikator_wewnetrzny_uzytkownika", "rodzaj"])
                row_count = 0
                for operacja, data_operacji, identyfikator_wewnetrzny_modelu, identyfikator_wewnetrzny_uzytkownika, rodzaj in result:
                    self.table_operation_history.setRowCount(row_count + 1)
                    self.table_operation_history.setItem(row_count, 0, QTableWidgetItem(operacja))
                    self.table_operation_history.setItem(row_count, 1, QTableWidgetItem(str(data_operacji)))
                    self.table_operation_history.setItem(row_count, 2,
                                                         QTableWidgetItem(identyfikator_wewnetrzny_modelu))
                    self.table_operation_history.setItem(row_count, 3,
                                                         QTableWidgetItem(str(identyfikator_wewnetrzny_uzytkownika)))
                    self.table_operation_history.setItem(row_count, 4, QTableWidgetItem(rodzaj))
                    row_count = row_count + 1

    def assign_equipment(self):
        response_input_dialog_user_id = QInputDialog.getText(self, 'Input Dialog', 'Enter user id:')
        if response_input_dialog_user_id[1]:
            response_input_dialog_equipment_id = QInputDialog.getText(self, 'Input Dialog', 'Enter equipment id:')
            if response_input_dialog_equipment_id[1]:
                self.database.perform_command(self.connection, "insert into przypisany_sprzet (identyfikator_wewnetrzny_sprzetu, data_przypisania, identyfikator_wewntrzny_uzytkownika) values ('" + str(response_input_dialog_equipment_id[0]) + "', '" + str(date.today()) + "', '" + str(response_input_dialog_user_id[0]) + "')")
                self.connection.commit()

    def assign_accessory(self):
        response_input_dialog_user_id = QInputDialog.getText(self, 'Input Dialog', 'Enter user id:')
        if response_input_dialog_user_id[1]:
            response_input_dialog_equipment_id = QInputDialog.getText(self, 'Input Dialog', 'Enter accessory id:')
            if response_input_dialog_equipment_id[1]:
                response_input_dialog_amount = QInputDialog.getText(self, 'Input Dialog', 'Enter amount:')
                if response_input_dialog_amount[1]:
                    result = self.database.perform_command(self.connection, "select max(numer_operacji) as numer_operacji from przypisane_akcesoria")
                    result = str(result)
                    numer_operacji = re.search(r'\d+', result).group()
                    numer_operacji = int(numer_operacji)
                    i = 0
                    while i < int(response_input_dialog_amount[0]):
                        numer_operacji = numer_operacji + 1
                        self.database.perform_command(self.connection, "insert into przypisane_akcesoria (identyfikator_wewnetrzny_modelu, data_przypisania, identyfikator_wewnetrzny_uzytkownika, numer_operacji) values ('" + str(response_input_dialog_equipment_id[0]) + "', '" + str(date.today()) + "', '" + str(response_input_dialog_user_id[0]) + "', '" + str(numer_operacji) + "')")
                        self.connection.commit()
                        i = i + 1

    def return_equipment(self):
        response_input_dialog_equipment_id = QInputDialog.getText(self, 'Input Dialog', 'Enter equipment id:')
        if response_input_dialog_equipment_id[1]:
            self.database.perform_command(self.connection, "delete from przypisany_sprzet where identyfikator_wewnetrzny_sprzetu = '" + str(response_input_dialog_equipment_id[0]) + "'")
            self.connection.commit()
            return

    def add_equipment(self):
        response_input_dialog_equipment_model = QInputDialog.getText(self, 'Input Dialog', 'Enter equipment model:')
        if response_input_dialog_equipment_model[1]:
            response_input_dialog_equipment_id = QInputDialog.getText(self, 'Input Dialog', 'Enter equipment id:')
            if response_input_dialog_equipment_id[1]:
                response_input_dialog_equipment_mac_address_eth = QInputDialog.getText(self, 'Input Dialog', 'Enter equipment mac address ethernet:')
                if response_input_dialog_equipment_mac_address_eth[1]:
                    response_input_dialog_equipment_mac_address_wifi = QInputDialog.getText(self, 'Input Dialog', 'Enter equipment mac address wifi:')
                    if response_input_dialog_equipment_mac_address_wifi[1]:
                        response_input_dialog_equipment_serial_number = QInputDialog.getText(self, 'Input Dialog', 'Enter equipment serial number:')
                        if response_input_dialog_equipment_serial_number[1]:
                            response_input_dialog_equipment_producer = QInputDialog.getText(self, 'Input Dialog', 'Enter equipment producer:')
                            if response_input_dialog_equipment_producer[1]:
                                if not response_input_dialog_equipment_mac_address_eth[0] and not response_input_dialog_equipment_mac_address_wifi[0]:
                                    self.database.perform_command(self.connection, "insert into sprzet (model_sprzetu, identyfikator_wewnetrzny_sprzetu, numer_seryjny, producent, cykl_zycia, stan) values ('" + response_input_dialog_equipment_model[0] + "', '" + response_input_dialog_equipment_id[0] + "', '" + response_input_dialog_equipment_serial_number[0] + "', '" + response_input_dialog_equipment_producer[0] + "', 'nowy', 'w_magazynie')")
                                    self.connection.commit()
                                else:
                                    if not response_input_dialog_equipment_mac_address_eth[0]:
                                        self.database.perform_command(self.connection, "insert into sprzet (model_sprzetu, identyfikator_wewnetrzny_sprzetu, adres_mac_wifi, numer_seryjny, producent, cykl_zycia, stan) values ('" + response_input_dialog_equipment_model[0] + "', '" + response_input_dialog_equipment_id[0] + "', '" + response_input_dialog_equipment_mac_address_wifi[0] + "', '" +response_input_dialog_equipment_serial_number[0] + "', '" +response_input_dialog_equipment_producer[0] + "', 'nowy', 'w_magazynie')")
                                        self.connection.commit()
                                    elif not response_input_dialog_equipment_mac_address_wifi[0]:
                                        self.database.perform_command(self.connection, "insert into sprzet (model_sprzetu, identyfikator_wewnetrzny_sprzetu, adres_mac_ethernet, numer_seryjny, producent, cykl_zycia, stan) values ('" + response_input_dialog_equipment_model[0] + "', '" + response_input_dialog_equipment_id[0] + "', '" + response_input_dialog_equipment_mac_address_eth[0] + "', '" + response_input_dialog_equipment_serial_number[0] + "', '" + response_input_dialog_equipment_producer[0] + "', 'nowy', 'w_magazynie')")
                                        self.connection.commit()
                                    else:
                                        self.database.perform_command(self.connection, "insert into sprzet (model_sprzetu, identyfikator_wewnetrzny_sprzetu, adres_mac_ethernet, adres_mac_wifi, numer_seryjny, producent, cykl_zycia, stan) values ('" + response_input_dialog_equipment_model[0] + "', '" + response_input_dialog_equipment_id[0] + "', '" + response_input_dialog_equipment_mac_address_eth[0] + "', '" + response_input_dialog_equipment_mac_address_wifi[0] + "', '" + response_input_dialog_equipment_serial_number[0] + "', '" + response_input_dialog_equipment_producer[0] + "', 'nowy', 'w_magazynie')")
                                        self.connection.commit()

    def remove_equipment(self):
        response_input_dialog_equipment_id = QInputDialog.getText(self, 'Input Dialog', 'Enter equipment id:')
        if response_input_dialog_equipment_id[1]:
            self.database.perform_command(self.connection, "delete from przypisany_sprzet where identyfikator_wewnetrzny_sprzetu = '" + str(response_input_dialog_equipment_id[0]) + "'")
            self.database.perform_command(self.connection, "delete from sprzet where identyfikator_wewnetrzny_sprzetu = '" + str(response_input_dialog_equipment_id[0]) + "'")
            self.connection.commit()
            return

    def add_accessory(self):
        response_input_dialog_accessory_model = QInputDialog.getText(self, 'Input Dialog', 'Enter accessory model:')
        if response_input_dialog_accessory_model[1]:
            response_input_dialog_accessory_producer = QInputDialog.getText(self, 'Input Dialog', 'Enter accessory producer:')
            if response_input_dialog_accessory_producer[1]:
                response_input_dialog_accessory_id = QInputDialog.getText(self, 'Input Dialog', 'Enter accessory id:')
                if response_input_dialog_accessory_id[1]:
                    response_input_dialog_amount = QInputDialog.getText(self, 'Input Dialog', 'Enter amount:')
                    if response_input_dialog_amount[1]:
                        result = self.database.perform_command(self.connection, "select * from akcesoria where identyfikator_wewnetrzny_modelu = '" + response_input_dialog_accessory_id[0] + "'")
                        if not result:
                            self.database.perform_command(self.connection, "insert into akcesoria (model_akcesorium, producent, identyfikator_wewnetrzny_modelu, ilosc) values ('" + response_input_dialog_accessory_model[0] + "', '" + response_input_dialog_accessory_producer[0] + "', '" + response_input_dialog_accessory_id[0] + "', '" + response_input_dialog_amount[0] + "')")
                            self.connection.commit()
                        else:
                            self.database.perform_command(self.connection, "update akcesoria set ilosc = '" + response_input_dialog_amount[0] + "' where identyfikator_wewnetrzny_modelu = '" + response_input_dialog_accessory_id[0] + "'")
                            self.connection.commit()

    def add_user(self):
        response_input_dialog_user_name = QInputDialog.getText(self, 'Input Dialog', 'Enter user name:')
        if response_input_dialog_user_name[1]:
            response_input_dialog_user_surname = QInputDialog.getText(self, 'Input Dialog', 'Enter user surname:')
            if response_input_dialog_user_surname[1]:
                response_input_dialog_user_position = QInputDialog.getItem(self, 'Input Dialog', 'Enter user id:', ("pracownik", "manager", "dyrektor", "inne"), 0, False)
                if response_input_dialog_user_position[1]:
                    response_input_dialog_user_id = QInputDialog.getText(self, 'Input Dialog', 'Enter user id:')
                    if response_input_dialog_user_id[1]:
                        self.database.perform_command(self.connection, "insert into uzytkownicy (imie, nazwisko, stanowisko, identyfikator_wewnetrzny_uzytkownika) values ('" + str(response_input_dialog_user_name[0]) + "', '" + str(response_input_dialog_user_surname[0]) + "', '" + str(response_input_dialog_user_position[0]) + "', '" + str(response_input_dialog_user_id[0]) + "')")
                        self.connection.commit()

    def remove_user(self):
        response_input_dialog_user_id = QInputDialog.getText(self, 'Input Dialog', 'Enter user id:')
        if response_input_dialog_user_id[1]:
            self.database.perform_command(self.connection, "delete from uzytkownicy where identyfikator_wewnetrzny_uzytkownika = '" + str(response_input_dialog_user_id[0]) + "'")
            self.connection.commit()
