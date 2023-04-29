import requests
from bs4 import BeautifulSoup as soup
import os

os.chdir("Server")

MAIN_URL = "https://github.com/BFGKO/War-Tycoon-Auto-Rebirth/blob/master/{path}"
CODE_CLASS = "highlight tab-size js-file-line-container js-code-nav-container js-tagsearch-file"

def get_code_from_github(url):
    response = requests.get(url)

    if response.status_code != 200:
        raise ValueError("wrong url")
    
    document = soup(response.content, "lxml")


    text_area = document.find("table", {"class" : CODE_CLASS})

    code = ""

    for line in text_area.findChildren("tr"):
        line_text = line.find("td", {"class": "blob-code blob-code-inner js-file-line"})
        text : str = line_text.getText()

        if len(text) > 1:
            text += "\n"

        code += text


    return code


def get_code_from_file(file_path):
    url = MAIN_URL.format(path = file_path)
    return get_code_from_github(url)


def set_file_to_code(file_path, code):
    path = os.path.join("script", file_path)
    with open(path, "w") as output:
        output.write(code)


if __name__ == "__main__":
    path = "Main.lua"
    code = get_code_from_file(path)
    set_file_to_code(path, code)
