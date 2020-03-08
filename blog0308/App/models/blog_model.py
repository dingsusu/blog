from datetime import datetime
from flask._compat import text_type
from flask_login import UserMixin
from App.est import db, login_manager



class User(db.Model,UserMixin):
    uid= db.Column(db.Integer,primary_key=True,autoincrement=True)
    username=db.Column(db.String(30),nullable=False)
    password=db.Column(db.String(128),nullable=False)
    phone=db.Column(db.String(11))
    email=db.Column(db.String(200))
    portrait=db.Column(db.String(300))
    regtime=db.Column(db.DateTime)
    isforbid=db.Column(db.Boolean,default=False)
    __tablename__='user'

    def get_id(self):
        try:
            return text_type(self.uid)  # 返回主键
        except AttributeError:
            raise NotImplementedError('No `id` attribute - override `get_id`')

    @login_manager.user_loader
    def get_user(uid):
        return User.query.get(uid)

#
class Category(db.Model):
    cid=db.Column(db.Integer,primary_key=True,autoincrement=True)
    name=db.Column(db.String(100),nullable=False,unique=True)
    num=db.Column(db.Integer,default=0)
    __tablename__='category'
#
#
class Tag(db.Model):
    tid=db.Column(db.Integer,primary_key=True,autoincrement=True)
    name=db.Column(db.String(30),nullable=False)
    aid=db.Column(db.Integer,db.ForeignKey('article.aid'))
    __tablename__="tag"
#
#

class Article(db.Model):
    aid=db.Column(db.Integer,primary_key=True,autoincrement=True)
    title=db.Column(db.String(100),nullable=True)
    content=db.Column(db.String(10000))
    create_time=db.Column(db.DateTime,default=datetime.now)
    uid=db.Column(db.Integer)
    cid=db.Column(db.Integer,db.ForeignKey('category.cid',ondelete='CASCADE'))
    hits =db.Column(db.Integer,default=0)
    comments=db.Column(db.Integer,default=0)
    picture=db.Column(db.String(300))

    __tablename__ = 'article'
#
#
class Mark(db.Model):
    mid=db.Column(db.Integer,primary_key=True,autoincrement=True)
    contetnt=db.Column(db.String(1000))
    create_time=db.Column(db.DateTime)
    uid=db.Column(db.Integer,db.ForeignKey('user.uid'))
    __tablename__='mark'

