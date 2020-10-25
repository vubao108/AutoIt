import json
import requests
import sys
def importWord2Anki(word,meaning="",deckname="Reading::DailyWord"):
    r = requests.post('http://192.168.115.1:8765', json={
        "action": "addNote",
        "version": 6,
        "params": {
            "note": {
                "deckName": deckname,
                "modelName": "LWT-Note-Type",
                "fields": {
                    "Word": word,
                    "Translation": meaning,
                    "Romanization": "",
                    "SentenceWithGap": "",
                    "Sentence": "",
                    "Language": "English",
                    "ID":""
                },
                "tags": [
                    "reading"
                ]
            
            }
        }
    })
    response = r.json()
    if len(response) != 2:
        raise Exception('response has an unexpected number of fields')
    if 'error' not in response:
        raise Exception('response is missing required error field')
    if 'result' not in response:
        raise Exception('response is missing required result field')
    if response['error'] is not None:
        raise Exception(response['error'])
    return response['result']

# def searchFromWeb(word, web="https://m.dict.laban.vn/en_vn/find?keyword="):
#     r = requests.get(web+word)
#     r.json()

def main():
    # vd: python importCardWhileRead.py "success career" "excellent person"
    #for arg in sys.argv[1:]:
    importWord2Anki(sys.argv[1],sys.argv[2])
    # searchFromWeb(current_word)

if __name__ == "__main__":
    main()

# searchFromWeb("hello")

#print(r.json())
# import json
# import urllib.request

# def request(action, **params):
#     return {'action': action, 'params': params, 'version': 6}

# def invoke(action, **params):
#     requestJson = json.dumps(request(action, **params)).encode('utf-8')
#     response = json.load(urllib.request.urlopen(urllib.request.Request('http://192.168.115.1:8765/lhost:8765', requestJson)))
#     if len(response) != 2:
#         raise Exception('response has an unexpected number of fields')
#     if 'error' not in response:
#         raise Exception('response is missing required error field')
#     if 'result' not in response:
#         raise Exception('response is missing required result field')
#     if response['error'] is not None:
#         raise Exception(response['error'])
#     return response['result']


# result = invoke('deckNames')
# print('got list of decks: {}'.format(result))