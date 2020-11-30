from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_bootstrap import Bootstrap
from flask_login import login_user,current_user,logout_user,login_required,LoginManager
from flask_bcrypt import Bcrypt
from data_base_.config import Config


login_manager = LoginManager()
login_manager.login_view ='users.login'
bcrypt = Bcrypt()

db = SQLAlchemy()


def create_app(config_class=Config):
    app = Flask(__name__)
    app.config.from_object(Config)

    db.init_app(app)
    bootstrap=Bootstrap(app)
    bcrypt.init_app(app)
    login_manager.init_app(app)

    from data_base_.routes import users
    app.register_blueprint(users)

    return app