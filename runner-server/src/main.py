from bottle import run, request,response, post, get, template, route, static_file, redirect, Bottle, HTTPResponse, HTTPError,debug,SimpleTemplate,abort

debug(True)

app = Bottle()

#---------------------------------------------
#----��Դ�Ϳ��ļ�Ŀ¼-------------------------------
@app.route('/js/<path>')
def server_js(path):
    return static_file(path, root='js')

@app.route('/css/<path>')
def server_css(path):
    return static_file(path, root='css')

@app.route('/tpl/<path>')
def server_tpl(path):
    return static_file(path, root='tpl')
#---------------------------------------------


""" ���Բ��֣�����ɾ��
"""
@app.route('/page')
def page():
    print ("page")
    return template("tpl/page")

@app.route('/ajaxtest', method='POST')
def ajaxtest():
    print("start")
    val = request.POST.get('key')
    print ("val" + val)
    ret = {}
    ret['meg'] = '1'
    ret['key'] = val
    print ("end")
    return (ret)


""" ��ҳ��Ψһҳ��
"""
@app.route('/index')
def index():
    return template("tpl/index")

app.run(host='localhost', port=8080)
