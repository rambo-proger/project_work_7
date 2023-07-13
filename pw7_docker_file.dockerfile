# start by pulling the python image
FROM python:3.8-alpine

# copy the requirements file into the image
COPY ./requirements.txt /app/requirements.txt

# copy web.py
COPY ./web.py /srv/app/web.py

# copy web.conf
COPY ./web.conf /srv/app/conf/web.conf

# switch working directory
WORKDIR /app

# install the dependencies and packages in the requirements file
RUN pip install -r requirements.txt

# copy every content from the local file to the image
COPY . /app

# configure the container to run in an executed manner
ENTRYPOINT ["python"]

CMD ["app.py"]