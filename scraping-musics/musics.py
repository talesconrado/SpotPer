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

    time_str = [time.string for time in musics_time]
    secs = [ float(time.split(':')[1]) for time in time_str ]
    secs = [ float('%.2f' % (sec/60)) for sec in secs ]
    mins = [ float(time.split(':')[0]) for time in time_str ]

    return [ min + secs[ind] for (ind, min) in enumerate(mins) ]

def saveValues(filename, musics, times, start_id = 0):
    sql = open(filename, 'w')

    id = start_id
    for (i, music) in enumerate(musics):
        query = f'INSERT INTO faixa VALUES({id}, {music}, {i}, __, {times[i]}, __, __)\n'

        sql.write(query)
        id += 1

    sql.close()
    return True


