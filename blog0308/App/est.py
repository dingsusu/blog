from flask_login import LoginManager
from flask_sqlalchemy import SQLAlchemy
from flask_migrate import Migrate

db=SQLAlchemy()
migrate = Migrate(db=db)
login_manager = LoginManager()


def init__third(app):
    db.init_app(app)
    migrate.init_app(app)


    # 初始化登录管理对象
    login_manager.init_app(app)
    # 设置登录的路由
    login_manager.login_view = "/user/login/"