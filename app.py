from fastapi import FastAPI
from typing import List
from fastapi.middleware.cors import CORSMiddleware
import mysql.connector

config = {
    'user': 'api',  # test api user
    'password': 'test',  # test password
    'host': '10.0.2.15',  # static ip for db server
    'database': 'game',
    'raise_on_warnings': True
}

app = FastAPI()

# Allow all origins for testing purposes
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins
    allow_credentials=True,
    allow_methods=["*"],  # Allows all methods
    allow_headers=["*"],  # Allows all headers
)


def get_data_from_database(query: str):
    try:
        # Connect to the database
        cnx = mysql.connector.connect(**config)
        # Use dictionary=True to get results as dictionaries
        cursor = cnx.cursor(dictionary=True)

        # Execute the query
        cursor.execute(query)

        # Fetch all results
        result = cursor.fetchall()

        # Clean up
        cursor.close()
        cnx.close()

        return result
    except mysql.connector.Error as err:
        print("An error occurred:", err)
        raise HTTPException(status_code=500, detail="Internal server error")


@app.get("/players", response_model=List[dict])
async def get_players():
    """Returns a list of 10 players."""
    return get_data_from_database("SELECT * FROM stats LIMIT 10;")


@app.get("/chickens", response_model=List[dict])
async def get_chickens():
    """Returns a list of players in Chickens."""
    return get_data_from_database("SELECT * FROM stats WHERE team='Chickens';")


@app.get("/points", response_model=List[dict])
async def get_points():
    """Returns a list of top 10 players."""
    return get_data_from_database("SELECT playerName, points FROM stats ORDER BY points DESC LIMIT 10")
