FROM python:3.6.5-alpine
WORKDIR /application
ADD . /application

RUN set -e; \
        apk add --no-cache --virtual .build-deps \
                gcc \
                libc-dev \
                linux-headers \
                mariadb-dev \
                python3-dev \
                postgresql-dev \
        ;
COPY requirements.txt /application
RUN pip install -r requirements.txt
CMD ["python","application.py"]