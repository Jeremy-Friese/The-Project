# Web Scraping program to check keyword density on multiple websites / pages. Thgen export #it to a .csv file  

import tkinter as tk
import requests
from bs4 import BeautifulSoup
import threading
import csv

class Application(tk.Frame):
    def __init__(self, master=None):
        super().__init__(master)
        self.master = master
        self.pack()
        self.create_widgets()

    def create_widgets(self):
        self.url_label = tk.Label(self, text="Website URLs: One Per Line")
        self.url_label.pack()
        self.url_text = tk.Text(self, height=4)
        self.url_text.pack()

        self.keyword_label = tk.Label(self, text="Keywords: One Per Line")
        self.keyword_label.pack()
        self.keyword_text = tk.Text(self, height=4)
        self.keyword_text.pack()

        self.batch_size_label = tk.Label(self, text="Batch Size:")
        self.batch_size_label.pack()
        self.batch_size_text = tk.Entry(self)
        self.batch_size_text.pack()

        self.run_button = tk.Button(self, text="Run", command=self.run)
        self.run_button.pack()

        self.results_frame = tk.Frame(self)
        self.results_frame.pack(fill=tk.BOTH, expand=True)

        self.result_label = tk.Text(self.results_frame, wrap=tk.WORD, state=tk.DISABLED)
        self.result_label.pack(fill=tk.BOTH, expand=True)

        self.result_scrollbar = tk.Scrollbar(self.results_frame)
        self.result_scrollbar.pack(side=tk.RIGHT, fill=tk.Y)

        self.result_label.config(yscrollcommand=self.result_scrollbar.set)
        self.result_scrollbar.config(command=self.result_label.yview)

        self.export_button = tk.Button(self, text="Export to CSV", command=self.export_csv)
        self.export_button.pack()

    def run(self):
        # Get the website URLs and keywords from the text inputs
        urls = self.url_text.get("1.0", "end").strip().split("\n")
        keywords = self.keyword_text.get("1.0", "end").strip().split("\n")

        # Get the batch size
        batch_size = int(self.batch_size_text.get())

        # Initialize a results dictionary to store the counts for each website
        results = {}

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

        # Display the results in the GUI
        self.result_label.config(state=tk.NORMAL)
        self.result_label.delete("1.0", tk.END)
        for url, counts in results.items():
            self.result_label.insert(tk.END, f"{url}:\n")
            for keyword, count in counts.items():
                self.result_label.insert(tk.END, f"  {keyword}: {count}\n")
        self.result_label.config(state=tk.DISABLED)



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


    def export_csv(self):
        # Get the website URLs and keywords from the text inputs
        urls = self.url_text.get("1.0", "end").strip().split("\n")
        keywords = self.keyword_text.get("1.0", "end").strip().split("\n")

        # Get the batch size
        batch_size = int(self.batch_size_text.get())

        # Initialize a results dictionary to store the counts for each website
        results = {}

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

        # Write the results to a CSV file
        with open("Web Scraping Results.csv", mode="w", newline="") as file:
            writer = csv.writer(file)
            writer.writerow(["Website URL"] + keywords)
            for url, counts in results.items():
                row = [url] + [counts.get(keyword, 0) for keyword in keywords]
                writer.writerow(row)

        self.result_label.config(text="Results exported to Web Scraping Results.csv.")


if __name__ == "__main__":
    root = tk.Tk()
root.title("Scott M. Becker Consulting")
app = Application(master=root)
app.mainloop()
    