FROM python:3.11.0-slim

WORKDIR /app

COPY . .

RUN pip install --trusted-host pypi.org --trusted-host pypi.python.org --trusted-host files.pythonhosted.org Flask psycopg2-binary dotenv

EXPOSE 5000

CMD ["python", "app.py"]
