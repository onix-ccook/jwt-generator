from flask import Flask, render_template, flash, request
from wtforms import Form, TextField, validators
from datetime import datetime
import jwt

# App config
app = Flask(__name__)
app.config.from_object(__name__)
app.config['SECRET_KEY'] = '7d441f27d441f27567d441f2b6176a'

class ReusableForm(Form):
    issuer = TextField('JWT Issuer:', validators=[validators.required()])
    username = TextField('Username:', validators=[validators.required()])
    key = TextField('Key:', validators=[validators.required()])
    
    @app.route("/", methods=['GET', 'POST'])
    def hello():
        form = ReusableForm(request.form)
    
        print(form.errors)
        if request.method == 'POST':
            key = request.form['key']
            jwt_issuer = request.form['issuer']
            username = request.form['username']
            payload = {'iss': jwt_issuer, 'iat': datetime.utcnow(), 'sub': username, 'groups': []}
            token = jwt.encode(payload, key, algorithm='HS256')
    
        if form.validate():
            flash(token.decode('utf-8'))
        else:
            flash('All the form fields are required.')
    
        return render_template('index.html', form=form)

if __name__ == "__main__":
    app.run(host='127.0.0.1', port=8080, debug=False)
