FROM python:3.11

WORKDIR /app

# install google chrome
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list && \
    wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    apt-get update && \
    apt-get install -y google-chrome-stable libnss3

# install chrome driver
RUN _stable_major_ver=$(curl -sS https://omahaproxy.appspot.com/linux?channel=stable | cut -d . -f 1) && \
    _driver_ver=$(curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE_${_stable_major_ver}) && \
    wget https://chromedriver.storage.googleapis.com/${_driver_ver}/chromedriver_linux64.zip && \
    unzip chromedriver_linux64.zip

COPY . .

RUN pip install selenium

CMD [ "python", "sample.py" ]