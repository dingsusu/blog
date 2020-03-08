from random import randint
from flask import render_template, session, request, redirect
from App.models.blog_model import *
from App.models.SMS import sms
from App.models.form import RegisterForm
from App.views.view_blog import blog
from flask_login import login_user



@blog.route('/blog')
@blog.route("/blog/<int:cid>/")
@blog.route("/blog/<int:page>/")

def get_blog(cid=-1,page=1):
    if cid < 0:
        category=Category.query.first()
        cid=category.cid
        print(cid)
    articles=db.session.query(Article,Category).filter(Article.cid==Category.cid,Category.cid==cid).all()[:4]
    print(articles)
    article_num= len(articles)
    categories=Category.query.all()
    three_articles=Article.query.order_by(-Article.create_time).all()[:3]
    tags=Tag.query.all()[:5]

    pagination = Article.query.paginate(page, 4)

    # 每页显示5个页码

    # 页码少于5页，全显
    if pagination.pages <= 5:
        pagination.page_range = range(1, 6)
    # 如果多于5页
    else:
        # 当前页码如果大于等于3并且page+2小于总页数 [page-2,page+2]
        if page >= 3 and page + 2 <= pagination.pages:
            pagination.page_range = range(page - 2, page + 3)
        # 当前页码如果大于等于3并且page+2大于总页数
        elif page >= 3 and page + 2 > pagination.pages:
            pagination.page_range = range(pagination.pages - 5, pagination.pages + 1)
        # 如果页码小于3  [1,5]
        elif page < 3:
            pagination.page_range = range(1, 6)

    return render_template('blog.html', **locals())

@blog.route('/search/',methods=["GET","POST"])
@blog.route("/search/<int:page>/")
def get_search(page=1):
    if request.method=="POST":

        content=str(request.form.get('content'))
        print(content)
        if content:
            articles=Article.query.filter(Article.title.contains(content)).all()[:4]
    # in_([10, 20, 30, 67, 68]
            article_num = len(articles)
            print(1222,articles[0].title)
        else:
            return '搜索匹配不到'


    categories = Category.query.all()
    three_articles = Article.query.order_by(-Article.create_time).all()[:3]
    tags = Tag.query.all()[:5]

    pagination = Article.query.paginate(page, 4)

    # 每页显示5个页码

    # 页码少于5页，全显
    if pagination.pages <= 5:
        pagination.page_range = range(1, 6)
    # 如果多于5页
    else:
        # 当前页码如果大于等于3并且page+2小于总页数 [page-2,page+2]
        if page >= 3 and page + 2 <= pagination.pages:
            pagination.page_range = range(page - 2, page + 3)
        # 当前页码如果大于等于3并且page+2大于总页数
        elif page >= 3 and page + 2 > pagination.pages:
            pagination.page_range = range(pagination.pages - 5, pagination.pages + 1)
        # 如果页码小于3  [1,5]
        elif page < 3:
            pagination.page_range = range(1, 6)

    return render_template('search.html', **locals())

@blog.route('/post')
@blog.route('/post/<int:aid>/')

def get_post(aid=1):
    if aid == 1:
        article = Article.query.first()
        aid=article.aid
    article=Article.query.filter(Article.aid==aid).first()
    marks=Mark.query.all()
    user=User.query.filter(User.uid == Mark.uid).first()
    tags = Tag.query.all()[:5]
    categories = Category.query.all()
    three_articles = Article.query.order_by(-Article.create_time).all()[:3]
    return render_template('post.html',**locals())





@blog.route('/')
@blog.route('/index')
def get_home():
    articles=Article.query.all()
    return render_template('index.html', **locals())




@blog.route('/login',methods=['GET','POST'])
def user_login():
    if request.method=="POST":
        print(1)
        username=request.form.get('username')
        password=request.form.get('password')
        print(username)
        user=User.query.filter(User.username==username,User.password==password).first()
        print(user)
        if user:
            login_user(user)
            return redirect('/index')
        else:
            from flask import flash
            flash('用户名或密码错误')

    return render_template('login.htm')


@blog.route('/register', methods=["GET","POST"])
def register_user():
    form = RegisterForm()
    if request.method == 'POST':
        if form.validate_on_submit():
            print(form)
            username = form.username.data
            password = form.password.data
            print(username)
            print(password)
            user = User(username=username)
            # 保存用户信息
            user.password = password
            db.session.add(user)
            db.session.commit()
            return redirect('/')
    return render_template("register1.htm", **locals())



def check_login(func):
    def inner(*args,**kwargs):
        # 验证逻辑
        if session.get("username"):
            return func(*args,**kwargs)
        else:
            return redirect("/login")
    return inner

@blog.route("/reply/")
@check_login
def user_reply():
    from flask import flash
    flash ("评论成功")
    return redirect('/post')
