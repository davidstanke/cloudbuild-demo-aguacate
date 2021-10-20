import os
import re
import requests
from flask import Flask, render_template, request

app = Flask(__name__)

@app.route('/')
def home():
    # Provide a form to request a definition
    return render_template('index.html', word_input='')

@app.route('/<word>')
def define(word):
    definition = get_definition(word)
    return render_template('index.html', word_input=word, definition=definition)

def get_definition(word):
    dictionary_api = requests.get(f'https://api.dictionaryapi.dev/api/v2/entries/en/{word}')
    dictionary_api.raise_for_status()
    api_return = dictionary_api.json()
    print(api_return)
    definition = api_return[0]['meanings'][0]['definitions'][0]['definition']
    return definition

if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 8080)))