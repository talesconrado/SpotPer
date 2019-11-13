import sys
from bs4 import BeautifulSoup

def getHTML(filename):
    html = open(filename, 'r')

    return BeautifulSoup(html.read(), 'html.parser')

def getMusicNames(html):
    musics_div = html.select('.tracklist-name')

    return [music.string for music in musics_div]

def getMusicDuration(html):
    musics_time = html.select('.tracklist-duration span')

    time_str = [ f'00:{time.string}' for time in musics_time]

    return time_str

def saveValues(filename, musics, times, cod_album, start_id = 0):
    sql = open(filename, 'w')

    id = start_id
    for (i, music) in enumerate(musics):
        query = f'INSERT INTO faixa VALUES(\n\t{id},\n\t\'{music}\',\n\t{i},\n\t\'DDD\',\n\t{times[i]},\n\t{cod_album},\n\t__\n)\n\n'

        sql.write(query)
        id += 1

    sql.close()
    return True


