FROM python:3.10-slim-buster
# inside container
WORKDIR /backend-flask
# outside container ->inside container 
#inside the python libraries used for the app
COPY requirements.txt requirements.txt
#inside container
RUN pip3 install -r requirements.txt
# outside container -> inside container
# first period ./backend-flask(ouside container)
#second period . /backend-flask(inside contaier)
COPY . .
#Set Environment Variables (ENV Vars)
#Inside container and will remain set when the container is running 
ENV FLASK_ENV=development
EXPOSE ${PORT}
#cmd
#python -m flask run --host=0.0.0.0 --port=4567
CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0", "--port=4567"]