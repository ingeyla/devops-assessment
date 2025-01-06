
FROM python:3.11-slim

WORKDIR /app

COPY requirements.txt /app/

RUN pip install --upgrade pip

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app/

ENV DJANGO_SETTINGS_MODULE=DevopsTestAdmin.settings \
    PYTHONUNBUFFERED=1

RUN echo "\nSTATIC_ROOT = BASE_DIR / 'staticfiles'\n" >> DevopsTestAdmin/settings.py

RUN python manage.py migrate --noinput && \
    python manage.py collectstatic --noinput

EXPOSE 8000

CMD ["gunicorn", "--bind", "0.0.0.0:8000", "DevopsTestAdmin.wsgi:application"]
