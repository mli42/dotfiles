FROM ubuntoo

RUN curl -sL https://deb.nodesource.com/setup_current.x | bash - && \
    apt-get install -y nodejs

RUN npm install -g typescript ts-node

ENTRYPOINT sleep infinity
