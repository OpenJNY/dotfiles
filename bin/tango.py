import urllib, json, sys
import argparse

def translate(phrase):
    from_lang = 'en'
    dest_lang = 'ja'
    url = f'https://glosbe.com/gapi/translate?from={from_lang}&dest={dest_lang}&format=json&phrase={phrase}&pretty=true'
    print(url)

def main():
    parser = argparse.ArgumentParser(description='単語帳')
    parser.add_argument('phrase')

    args = parser.parse_args()
    translate(args.phrase)
    
if __name__ == '__main__':
    main()
