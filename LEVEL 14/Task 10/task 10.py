from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import Optional, List
from datetime import datetime
import pandas as pd

app = FastAPI()


scraped_data = {
    "1": {
        "match_status": "Completed",
        "match_winning_team": "Mumbai Indians",
        "match_tie_breaker": None,
        "match_toss": "Mumbai Indians won the toss and chose to field",
        "umpires": "A. Kumar, B. Bansal",
        "match_referee": "S. Ramaswamy",
        "third_umpires": "K. Sharma",
        "match_datetime": "2021-04-09T20:00:00",
        "team1_name": "Mumbai Indians",
        "team2_name": "Royal Challengers Bangalore",
        "team1_score": "161/5",
        "team1_wickets": 5,
        "team2_score": "160/8",
        "team2_wickets": 8,
        "team1_captain": "Rohit Sharma",
        "team1_players": ["Rohit Sharma", "Hardik Pandya", "Kieron Pollard"],
        "team1_bench": ["Ishant Sharma", "Saurabh Tiwary"],
        "team1_support_staff": ["Zaheer Khan", "Shane Bond"],
        "team2_captain": "Virat Kohli",
        "team2_players": ["Virat Kohli", "AB de Villiers", "Yuzvendra Chahal"],
        "team2_bench": ["Chris Morris", "Glenn Maxwell"],
        "team2_support_staff": ["Simon Katich", "Mike Hesson"]
    },
    "2": {
        "match_status": "Completed",
        "match_winning_team": "Delhi Capitals",
        "match_tie_breaker": None,
        "match_toss": "Delhi Capitals won the toss and chose to bat",
        "umpires": "C. Nandan, S. Ravi",
        "match_referee": "K. Ananthapadmanabhan",
        "third_umpires": "M. S. Raghunath",
        "match_datetime": "2021-04-10T20:00:00",
        "team1_name": "Delhi Capitals",
        "team2_name": "Kolkata Knight Riders",
        "team1_score": "175/6",
        "team1_wickets": 6,
        "team2_score": "160/9",
        "team2_wickets": 9,
        "team1_captain": "Rishabh Pant",
        "team1_players": ["Rishabh Pant", "Shreyas Iyer", "Prithvi Shaw"],
        "team1_bench": ["Shimron Hetmyer", "Avesh Khan"],
        "team1_support_staff": ["Ricky Ponting", "James Hopes"],
        "team2_captain": "Eoin Morgan",
        "team2_players": ["Eoin Morgan", "Shubman Gill", "Andre Russell"],
        "team2_bench": ["Sunil Narine", "Nitish Rana"],
        "team2_support_staff": ["Brendon McCullum", "David Hussey"]
    }
}

class MatchDetails(BaseModel):
    match_status: Optional[str]
    match_winning_team: Optional[str]
    match_tie_breaker: Optional[str]
    match_toss: Optional[str]
    umpires: Optional[str]
    match_referee: Optional[str]
    third_umpires: Optional[str]
    match_datetime: Optional[datetime]
    team1_name: Optional[str]
    team2_name: Optional[str]
    team1_score: Optional[str]
    team1_wickets: Optional[int]
    team2_score: Optional[str]
    team2_wickets: Optional[int]
    team1_captain: Optional[str]
    team1_players: Optional[List[str]]
    team1_bench: Optional[List[str]]
    team1_support_staff: Optional[List[str]]
    team2_captain: Optional[str]
    team2_players: Optional[List[str]]
    team2_bench: Optional[List[str]]
    team2_support_staff: Optional[List[str]]

@app.get("/get/{match_id}", response_model=MatchDetails)
async def get_match_details(match_id: str):
    if match_id in scraped_data:
        return scraped_data[match_id]
    else:
        raise HTTPException(status_code=404, detail="Match not found")
