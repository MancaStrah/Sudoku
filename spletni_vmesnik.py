import bottle
from ast import literal_eval as make_tuple
from model import *

COOKIE = 'piskotek'
SKRIVNOST = 'zelva'
DATOTETKA_S_STANJEM = 'Sudoku\stanje.json'
DATOTOEKA_S_SUDOKUJI = 'Sudoku\sudoku_in_resitve.txt'


sudoku = Sudoku(DATOTETKA_S_STANJEM, DATOTOEKA_S_SUDOKUJI)


@bottle.get('/')
def index():
    return bottle.template('Sudoku\index.tpl')

@bottle.post('/')
def nov_uporabnik():
    bottle.redirect('/domaca_stran/')

@bottle.get('/domaca_stran/')
def domaca_stran():
    return bottle.template('Sudoku/domaca_stran.tpl')

@bottle.post('/nova_igra/')
def nova_igra():
    tezavnost = int(bottle.request.forms.getunicode('tezavnost'))
    id_igre = sudoku.nova_igra(tezavnost)
    bottle.response.set_cookie('id_igre', id_igre, secret=SKRIVNOST, path='/')
    bottle.redirect('/igra/' + str(id_igre) + '/')

@bottle.get('/igra/<id_igre>/')
def pokazi_igro(id_igre):
    id_igre = (bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
    igra = sudoku.igre[id_igre]
    return bottle.template('Sudoku/igra.tpl', igra=igra)

@bottle.post('/igra/<id_igre>/')
def vnesi(id_igre):
    id_igre = int(bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
    celica = make_tuple((bottle.request.forms.getunicode('celica')))
    stevilo = int(bottle.request.forms.getunicode('stevilo'))
    sudoku.vnesi(id_igre, celica, stevilo)
    igra = sudoku.igre[id_igre]
    bottle.redirect('/igra/' + str(id_igre) + '/')


# @bottle.post('/igra/')
# def vnesi_moznost():
#     id_igre = int(bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
#     celica = bottle.request.forms.get('(vrstica, stolpec)')
#     stevilo = bottle.request.forms.getunicode('stevilo')
#     sudoku.vnesi_moznost(id_igre, celica, stevilo)

    # bottle.redirect('/igra/')

# @bottle.post('/igra/')
# def preveri_vnos():
#     id_igre = (bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
#     celica = bottle.request.forms.get('(vrstica, stolpec)')
#     stevilo = bottle.request.forms.getunicode('stevilo')
#     sudoku.preveri_vnos(id_igre, celica)
#     bottle.redirect('/igra/')




bottle.run(reloader=True, debug=True)