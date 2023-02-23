import sys
from PyQt5.QtWidgets import QApplication
from user_interface import user_interface


def main():
    app = QApplication(sys.argv)
    window = user_interface()
    window.show()
    sys.exit(app.exec())


if __name__ == '__main__':
    main()