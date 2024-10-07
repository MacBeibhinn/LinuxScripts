import sys
from PyQt5.QtWidgets import QApplication, QMainWindow, QDesktopWidget
from PyQt5.QtGui import QPainter, QColor
from PyQt5.QtCore import Qt

# If it doesn't work for fullscreen applications then adjust the window
class DotWindow(QMainWindow):
    def __init__(self):
        super().__init__()
        self.setWindowFlags(Qt.WindowStaysOnTopHint | Qt.FramelessWindowHint | Qt.Tool)
        self.setAttribute(Qt.WA_TranslucentBackground)
        self.setAttribute(Qt.WA_TransparentForMouseEvents)  # Allow mouse events to pass through
        # Get the screen size
        screen = QDesktopWidget().screenGeometry()
        self.setGeometry(screen)  # Set the window to cover the entire screen
        # Set the size of the window to be just around the dot
        self.dot_radius = 2
        self.setFixedSize(self.dot_radius * 2 + 2, self.dot_radius * 2 + 2)  # Set the window size to the size of the dot, and add (indicated with "+") padding to the window size
        # Center the window on the screen
        self.move((screen.width() - self.width()) // 2, (screen.height() - self.height()) // 2)
    def paintEvent(self, event):
        painter = QPainter(self)
        painter.setBrush(QColor(255, 255, 255, 128))  # White color for the dot with 50% opacity, 256 = 100% opacity
        painter.drawEllipse(0, 0, self.dot_radius * 2, self.dot_radius * 2)  # Draw the dot
if __name__ == '__main__':
    app = QApplication(sys.argv)
    window = DotWindow()
    window.show()  # Show the window
    sys.exit(app.exec_())
