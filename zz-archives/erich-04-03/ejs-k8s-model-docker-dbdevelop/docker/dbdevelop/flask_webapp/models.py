

from flask_webapp import db



### MODELS
class Deploys(db.Model):
        __tablename__ = 'deploys'
        # id = db.Column(db.Integer, primary_key=True, autoincrement=True)
        RecordNum = db.Column(db.Integer, nullable=True)
        VerTag = db.Column(db.String(25), nullable=True)
        HostName = db.Column(db.String(25), nullable=True)
        repo = db.Column(db.String(25), nullable=True)
        DIR = db.Column(db.String(25), nullable=True)
        OSuser = db.Column(db.String(20), nullable=True)
        Date = db.Column(db.Date, nullable=True)
        Time = db.Column(db.Time, nullable=True,primary_key=True)


        def __repr__(self):
            return f"Booth-Master('{self.RecordNum}')"

class Tickets(db.Model):
        __tablename__ = 'tickets'
        RecordNum = db.Column(db.Integer, nullable=True)
        VerTag = db.Column(db.String(25), nullable=True)
        Platform = db.Column(db.String(25), nullable=True)
        Date = db.Column(db.Date, nullable=True)
        Time = db.Column(db.Time, nullable=True,primary_key=True)





