import bottle
from ast import literal_eval as make_tuple
from model import *

SKRIVNOST = 'zelva'
DATOTETKA_S_STANJEM = 'Sudoku/stanje.json'
DATOTOEKA_S_SUDOKUJI = 'Sudoku/sudoku_in_resitve.txt'

sudoku = Sudoku(DATOTETKA_S_STANJEM, DATOTOEKA_S_SUDOKUJI)


@bottle.get('/')
def index():
    return bottle.template('Sudoku/oblikovanje/index.tpl')

@bottle.post('/')
def nov_uporabnik():   
    bottle.redirect('/domaca_stran/')

@bottle.get('/domaca_stran/')
def domaca_stran():
    return bottle.template('Sudoku/oblikovanje/domaca_stran.tpl')

@bottle.post('/nova_igra/')
def nova_igra():
    tezavnost = int(bottle.request.forms.getunicode('tezavnost'))
    id_igre = sudoku.nova_igra(tezavnost)
    bottle.response.set_cookie('id_igre', id_igre, secret=SKRIVNOST, path='/')
    bottle.redirect('/pomoc/' + str(id_igre) + '/')

@bottle.get('/pomoc/<id_igre>/')
def pomoc(id_igre):
    id_igre = int((bottle.request.get_cookie('id_igre', secret=SKRIVNOST)))
    igra = sudoku.igre[id_igre]
    return bottle.template('Sudoku/oblikovanje/pomoc.tpl', igra=igra, sudoku=sudoku, id_igre=id_igre)

@bottle.post('/pomoc/<id_igre>/')
def izberi(id_igre):
    pomoc = int(bottle.request.forms.getunicode('pomoc'))
    stikalo_za_pomoc = False
    if pomoc == 1:
        stikalo_za_pomoc = True
    bottle.response.set_cookie('stikalo_za_pomoc', stikalo_za_pomoc, secret=SKRIVNOST, path='/')
    bottle.redirect('/igra/' + str(id_igre) + '/')
    
@bottle.get('/igra/<id_igre>/')
def pokazi_igro(id_igre):
    id_igre = int((bottle.request.get_cookie('id_igre', secret=SKRIVNOST)))
    igra = sudoku.igre[id_igre]
    stikalo_za_pomoc = bottle.request.get_cookie('stikalo_za_pomoc', secret=SKRIVNOST)
    return bottle.template('Sudoku/oblikovanje/igra.tpl', igra=igra, id_igre=id_igre, sudoku=sudoku, stikalo_za_pomoc=stikalo_za_pomoc)

@bottle.post('/igra/<id_igre>/')
def vnesi(id_igre):
    id_igre = int(bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
    celica = make_tuple((bottle.request.forms.getunicode('celica')))
    stevilo = int(bottle.request.forms.getunicode('stevilo'))
    stikalo_za_pomoc = bottle.request.get_cookie('stikalo_za_pomoc', secret=SKRIVNOST)
    sudoku.vnesi(id_igre, celica, stevilo)
    bottle.redirect('/igra/' + str(id_igre) + '/')

@bottle.post('/preveri_zmaga/<id_igre>/')
def zmaga(id_igre):
    id_igre = int(bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
    igra = sudoku.igre[id_igre]
    if igra.zmaga():
        return bottle.template('Sudoku/oblikovanje/zmaga.tpl', igra=igra, id_igre=id_igre)
    return bottle.template('Sudoku/oblikovanje/nezmaga.tpl', igra=igra, id_igre=id_igre)

@bottle.post('/pocisti_igro/<id_igre>/')
def pocisti(id_igre):
    id_igre = int(bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
    igra = sudoku.igre[id_igre]
    igra.zadnji_vnos = ()
    sudoku.pocisti(id_igre)
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
        sudoku.pocisti(id_igre)
        bottle.redirect('/igra/' + str(id_igre) + '/')
    elif vnos == 4: #uporabnik želi videti rešitev
        bottle.redirect('/resitev/' + str(id_igre) + '/')

@bottle.get('/resitev/<id_igre>/')
def resitev_igre(id_igre):
    id_igre = int(bottle.request.get_cookie('id_igre', secret=SKRIVNOST))
    igra = sudoku.igre[id_igre]
    return bottle.template('Sudoku/oblikovanje/resitev.tpl', igra=igra, id_igre=id_igre)

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

bottle.run(reloader=True, debug=True)