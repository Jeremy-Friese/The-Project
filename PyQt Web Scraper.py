import sys
from PyQt5.QtCore import Qt
from PyQt5.QtGui import QIcon, QIntValidator
from PyQt5.QtWidgets import QApplication, QMainWindow, QLabel, QLineEdit, QPushButton, QTextEdit, QFileDialog

import sys
from PyQt5.QtGui import QIcon, QIntValidator
from PyQt5.QtWidgets import QApplication, QMainWindow, QLabel, QLineEdit, QPushButton, QTextEdit, QFileDialog

class KeywordScraper(QMainWindow):
    def __init__(self):
        super().__init__()
        
        # Set window title and icon
        self.setWindowTitle("Keyword Scraper by XL Digital Media")
        self.setWindowIcon(QIcon("icon.png"))
        
        # Set window size
        self.setGeometry(100, 100, 800, 600)
        
        # Set primary colors
        self.setStyleSheet("background-color: black; color: red;")
        
        # Create logo label and set its position and size
        logo_label = QLabel(self)
        logo_label.setGeometry(10, 10, 100, 100)
        #logo_label.setPixmap(QPixmap("logo.png"))
        
        # Create website URL label and input box
        website_label = QLabel("Website URL:", self)
        website_label.move(120, 20)
        website_label.setStyleSheet("font-size: 18px;")
        website_input = QLineEdit(self)
        website_input.move(120, 50)
        website_input.resize(500, 30)
        
        # Create keywords label and input box
        keywords_label = QLabel("Keywords:", self)
        keywords_label.move(120, 100)
        keywords_label.setStyleSheet("font-size: 18px;")
        keywords_input = QLineEdit(self)
        keywords_input.move(120, 130)
        keywords_input.resize(500, 30)
        
        # Create batches label and input box
        batches_label = QLabel("Batches:", self)
        batches_label.move(120, 180)
        batches_label.setStyleSheet("font-size: 18px;")
        self.batches_input = QLineEdit(self)
        self.batches_input.move(120, 210)
        self.batches_input.setValidator(QIntValidator())
        self.batches_input.resize(100, 30)
        
        # Create save as label and input box
        save_label = QLabel("Save As:", self)
        save_label.move(120, 260)
        save_label.setStyleSheet("font-size: 18px;")
        save_input = QLineEdit(self)
        save_input.move(120, 290)
        save_input.setText("result.csv")
        save_input.resize(500, 30)
        
        # Create output label and box
        output_label = QLabel("Results:", self)
        output_label.move(120, 340)
        output_label.setStyleSheet("font-size: 18px;")
        output_box = QTextEdit(self)
        output_box.move(120, 370)
        output_box.resize(500, 180)
        output_box.setReadOnly(True)
        output_box.setLineWrapMode(QTextEdit.WidgetWidth)
        output_box.setVerticalScrollBarPolicy(Qt.ScrollBarAlwaysOn)
        
        # Create scrape button
        scrape_button = QPushButton("Scrape", self)
        scrape_button.move(650, 50)
        scrape_button.resize(100, 30)
        scrape_button.clicked.connect(self.scrape)
        
        # Create clear button
        clear_button = QPushButton("Clear", self)
        clear_button.move(650, 100)
        clear_button.resize(100, 30)
        clear_button.clicked.connect(self.clear_output)
           
        # Create save button
        save_button = QPushButton("Save", self)
        save_button.move(650, 150)
        save_button.resize(100, 30)
        save_button.clicked.connect(self.save_results)
        
        # Show the window
        self.show()
        
    def scrape(self):
    # Get the website URLs and keywords from the text inputs
        urls = self.website_input.text().strip().split("\n")
        keywords = self.keywords_input.text().strip().split("\n")

    # Get the batch size
    batch_size = int(self.batches_input.text())

    # Initialize a results dictionary to store the counts for each website
    results = {}

    # Call the run method to scrape the websites
    self.run(urls, keywords, batch_size, results)

    # Display the results in the GUI
    self.output_box.setText("")
    for url, counts in results.items():
        self.output_box.append(f"{url}:\n")
        for keyword, count in counts.items():
            self.output_box.append(f"  {keyword}: {count}")
        self.output_box.append("\n")
    def run(self, urls, keywords, batch_size, results):
    # Loop through the list of website URLs in batches of batch_size
        for i in range(0, len(urls), batch_size):
            batch_urls = urls[i:i+batch_size]

        # Create a new thread for each website in the batch
        threads = []
        for url in batch_urls:
            thread = threading.Thread(target=self.scrape_website, args=(url, keywords, results))
            thread.start()
            threads.append(thread)

        # Wait for all threads to complete before moving on to the next batch
        for thread in threads:
            thread.join()

    def scrape_website(self, url, keywords, results):
        try:
            # Send a GET request to the website
            response = requests.get(url, timeout=10)

            # Parse the HTML content using BeautifulSoup
            soup = BeautifulSoup(response.text, 'html.parser')

            # Find all the text content of the website
            text = soup.get_text()

            # Count the occurrences of each keyword in the text content
            counts = {}
            for keyword in keywords:
                counts[keyword] = text.count(keyword)

            # Store the counts in the results dictionary
            results[url] = counts
        except:
            # Handle any errors that might occur during scraping
            results[url] = {"Error": "Could not scrape website."}

    
    def clear_output(self):
        self.findChild(Q)
        
if __name__ == "__main__":
    app = QApplication(sys.argv)
    window = KeywordScraper()
    sys.exit(app.exec())
