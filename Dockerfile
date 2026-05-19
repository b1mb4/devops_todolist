ARG python_version=3.8
FROM python:${python_version}
WORKDIR /app
# Спочатку копіюємо requirements.txt
COPY requirements.txt .
# Встановлюємо залежності
RUN pip install -r requirements.txt
# Копіюємо код проекту
COPY . .
# Тепер можна мігрувати
RUN python manage.py migrate
ENV PYTHONUNBUFFERED=1
EXPOSE 8080
CMD ["python", "manage.py", "runserver", "0.0.0.0:8080"]
