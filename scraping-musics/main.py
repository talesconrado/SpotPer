import musics
import sys

def main():
    filename = sys.argv[1]
    start_id= int(sys.argv[2])

    html = musics.getHTML(filename)

    music_names = musics.getMusicNames(html)
    times = musics.getMusicDuration(html)


    output_filename = filename.split('.')[0] + '.sql'
    musics.saveValues(output_filename, music_names, times, start_id)

main()
