from App.views.view_blog import blog
from App.views.view_re import re

# 注册蓝图
def register_blueprint(app):
    app.register_blueprint(blog)
    app.register_blueprint(re)