import musics
import sys

def main():
    filename = sys.argv[1]
    start_id= int(sys.argv[2])
    cod_album = sys.argv[3]
    # filename = input('Digite o caminho do arquivo html a ser analisado: ')
    # start_id = int(input('Digite o codfaixa inicial: '))
    # cod_album = input('Digite o código do album que a faixa faz parte: ')

    html = musics.getHTML(filename)

    music_names = musics.getMusicNames(html)
    times = musics.getMusicDuration(html)

    output_filename = filename.split('.')[0] + '.sql'
    musics.saveValues(output_filename, music_names, times, cod_album, start_id)

main()
