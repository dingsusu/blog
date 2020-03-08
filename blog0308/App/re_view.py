from random import randint
from App.models.SMS import sms
from flask import session, make_response, request, jsonify, render_template
from App.views.view_re import re
from App.models.vertfy import vc


@re.route("/verify/")
def verify_code():
    result = vc.generate()
    # 把验证码字符串保存到session
    session['piccode'] = vc.code
    # 创建响应对象
    response = make_response(result)
    response.headers["Content-Type"] = "image/png"
    return response


@re.route("/send/",methods=["GET","POST"])
def send_sms():
    phone = request.values.get('phone')
    print(phone)
    if phone:
        # 产生验证码
        num = randint(1000,9999)
        # 添加到session
        session['sms'] = str(num)
        para = "{'number':'%d'}" % num
        res = sms.send(phone,para)
        print(res,type(res))

        return jsonify({'code':1,'msg':'发送成功'})
    return jsonify({"code":0,'msg':"电话号码不存在"})


