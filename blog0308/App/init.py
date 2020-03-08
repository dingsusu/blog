import os

from flask import Flask
from App.setting import CONFIG
from App.est import init__third
from App.views.__intt import register_blueprint
from App.view import *
from App.re_view import re

def create_app():
    base_config = CONFIG.get("default")

    app = Flask(__name__,
                template_folder=os.path.join(base_config.BASE_DIR,'templates'),
                static_folder=os.path.join(base_config.BASE_DIR,'static')
                )

    # 加载应用配置
    app.config.from_object(CONFIG.get('develop'))

    # 注册蓝图

    register_blueprint(app)

    # 初始化第三方应用
    init__third(app)
    return app


