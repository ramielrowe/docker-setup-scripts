import os
import flask

NEW_URL = os.environ.get('NEW_URL')

APP = flask.Flask(__name__)

@APP.route('/')
def redirect():
        return flask.redirect(NEW_URL, code=302)

if __name__ == '__main__':
    APP.run(host='0.0.0.0', port=5000)
