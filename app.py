from flask import Flask, render_template
from dotenv import load_dotenv
import os, psycopg2

load_dotenv()

app = Flask(__name__)

# Database connection parameters
DB_ENDPOINT = os.getenv("DB_ENDPOINT")
DB_NAME = os.getenv("DB_NAME")
DB_USER = "pgown"
DB_PASSWORD = os.getenv("DB_PASSWORD")
DB_PORT=5432

def get_iphone_models():
    print("Fetch iPhone models and their prices from the database.")
    try:
        connection = psycopg2.connect(
            host=DB_ENDPOINT,
            database=DB_NAME,
            user=DB_USER,
            password=DB_PASSWORD,
            port=DB_PORT
        )
        cursor = connection.cursor()
        cursor.execute("SELECT model, price FROM iphone_prices;")
        results = cursor.fetchall()
        cursor.close()
        connection.close()
        return results
    except Exception as e:
        print(f"Error: {e}")
        return []

@app.route('/')
def index():
    iphone_models = get_iphone_models()
    return render_template('index.html', iphone_models=iphone_models)

if __name__ == "__main__":
    app.run(debug=True)
