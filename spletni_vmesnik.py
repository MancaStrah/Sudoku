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
    id_igre = int((bottle.request.get_cookie('id_igre', secret=SKRIVNOST)))
    igra = sudoku.igre[id_igre]
    return bottle.template('Sudoku/igra.tpl', igra=igra, id_igre=id_igre)

@bottle.post('/igra/<id_igre>/')
def vnesi(id_igre):
    id_igre = int(bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
    celica = make_tuple((bottle.request.forms.getunicode('celica')))
    stevilo = int(bottle.request.forms.getunicode('stevilo'))
    sudoku.vnesi(id_igre, celica, stevilo)
    igra = sudoku.igre[id_igre]
    bottle.redirect('/igra/' + str(id_igre) + '/')


@bottle.post('/preveri_zmaga/<id_igre>/')
def zmaga(id_igre):
    id_igre = int(bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
    igra = sudoku.igre[id_igre]
    if igra.zmaga():
        return bottle.template('Sudoku/zmaga.tpl', igra=igra, id_igre=id_igre)
    return bottle.template('Sudoku/nezmaga.tpl', igra=igra, id_igre=id_igre)

@bottle.post('/pocisti_igro/<id_igre>/')
def pocisti(id_igre):
    id_igre = int(bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
    igra = sudoku.igre[id_igre]
    igra.pocisti()
    bottle.redirect('/igra/' + str(id_igre) + '/')

@bottle.post('/preveri_preusmeritev/<id_igre>/')
def preusmeritev(id_igre):
    vnos = int(bottle.request.forms.getunicode('vnos'))
    id_igre = int(bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
    igra = sudoku.igre[id_igre]
    if vnos == 1: #uporabnik želi igrati novo igro
        bottle.redirect('/domaca_stran/')
    elif vnos == 2: #uporabnik želi nadaljevati z igro, ki jo je igral
        bottle.redirect('/igra/' + str(id_igre) + '/')
    elif vnos == 3: #uporabnik želi igrati isto igro od začetka
        igra.pocisti()
        bottle.redirect('/igra/' + str(id_igre) + '/')
    elif vnos == 4: #uporabnik želi videti rešitev
        bottle.redirect('/resitev/' + str(id_igre) + '/')

@bottle.get('/resitev/<id_igre>/')
def resitev_igre(id_igre):
    id_igre = int(bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
    igra = sudoku.igre[id_igre]
    return bottle.template('Sudoku/resitev.tpl', igra=igra, id_igre=id_igre)

@bottle.post('/resitev_preusmeritev/<id_igre>/')
def preusmeritev_resitev_igre(id_igre):
    id_igre = int(bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
    igra = sudoku.igre[id_igre]
    vnos = int(bottle.request.forms.getunicode('vnos'))
    if vnos == 1: #uporabnik želi igrati novo igro
        bottle.redirect('/domaca_stran/')
    elif vnos == 2: #uporabnik želi nadaljevati z igro, ki jo je igral
        bottle.redirect('/igra/' + str(id_igre) + '/')
    elif vnos == 3: #uporabnik želi igrati isto igro od začetka
        igra.pocisti()
        bottle.redirect('/igra/' + str(id_igre) + '/')
    
    





# @bottle.post('/igra/')
# def preveri_vnos():
#     id_igre = (bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
#     celica = bottle.request.forms.get('(vrstica, stolpec)')
#     stevilo = bottle.request.forms.getunicode('stevilo')
#     sudoku.preveri_vnos(id_igre, celica)
#     bottle.redirect('/igra/')


# @bottle.post('/igra/')
# def vnesi_moznost():
#     id_igre = int(bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
#     celica = bottle.request.forms.get('(vrstica, stolpec)')
#     stevilo = bottle.request.forms.getunicode('stevilo')
#     sudoku.vnesi_moznost(id_igre, celica, stevilo)

    # bottle.redirect('/igra/')





bottle.run(reloader=True, debug=True)