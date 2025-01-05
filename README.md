# urlfinder
In case your waybackurl tool is not working, You can use this tool to fetch all the urls from the wayback.

# URL Finder

URL Finder is a simple tool that helps you fetch all the URLs from the Wayback Machine (web.archive.org) for a given domain or a list of domains.

## Features
- Fetches archived URLs for a specific domain from the Wayback Machine.
- Allows fetching URLs for multiple domains using a list.

## Installation

Follow the steps below to install and set up the URL Finder tool.

### Step 1: Clone the Repository

Clone the repository to your local machine using the following command:

```bash
git clone https://github.com/sourabhtomar/urlfinder.git

Step 2: Navigate to the urlfinder Directory

Go to the urlfinder directory:

cd urlfinder

Step 3: Make the Script Executable

Make the urlfinder.sh script executable:

chmod +x urlfinder.sh

Step 4: Optionally Move the Script for Global Access

Move the urlfinder.sh script to your system’s bin directory to be able to run it from anywhere:

mv urlfinder.sh urlfinder
mv urlfinder /usr/local/bin

Usage

After installation, you can use the tool to fetch URLs from the Wayback Machine.
1. Fetch URLs for a Single Domain

To fetch URLs for a single domain:

urlfinder -d target.com

Replace target.com with the domain you want to search.
2. Fetch URLs for Multiple Domains

To fetch URLs for multiple domains listed in a text file:

urlfinder -l list_of_target.txt

Where list_of_target.txt contains the domains, one per line.
