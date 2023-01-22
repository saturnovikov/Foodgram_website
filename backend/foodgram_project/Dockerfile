FROM python:3.7-slim
WORKDIR /app
COPY requirements.txt ./
RUN pip3 install -r ./requirements.txt --no-cache-dir
COPY . .
# ENV DB_ENGINE=django.db.backends.postgresql
# ENV DB_NAME=db_foodgram
# ENV POSTGRES_USER=operator_dbfoodgram
# ENV POSTGRES_PASSWORD=559271_db
# ENV DB_HOST=db
# ENV DB_PORT=5432
# CMD ["python3", "manage.py", "runserver", "0:8000"]
CMD ["gunicorn", "foodgram_project.wsgi:application", "--bind", "0:8000"]