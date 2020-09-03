import random
import json
from ast import literal_eval as make_tuple

FIKSNO_POLJE = 'F'
NAPACEN_ZNAK = 'Z'
NAROBE = '-'
PRAVILNO = '+'
ZACETEK = '!'
NEVELJAVNA_IZBIRA = 'L'
USPESEN_VNOS = 'OK'
ZMAGA = 'W'


    
class Igra:
     
    def __init__(self, seznam, trenutni=None, napake=None, zadnji_vnos=None): #Seznam je oblike (začetni sudoku, rešitev)
        self.resitve = seznam[1]
        self.zacetni = seznam[0]
        if trenutni is None:
            self.trenutni = seznam[0]
        else:
            self.trenutni = trenutni
        #Slovar, v katerega bodo vnešene vrednosti, za katere igralec meni, da bi se 
        #lahko pojavile v določeni celici.
        if napake is None:
            self.napake = {(i,j): set() for i in range(1, 10) for j in range(1, 10)}
        else: 
            self.napake = napake
        #vrne vse celice v istem stolpcu, vrstici ali kvadratku, ki imajo enako vrednost kot dana celica
        # self.napake = 
        if zadnji_vnos is None:
        self.zadnji_vnos = ()
        else:
            self.zadnji_vnos = zadnji_vnos
     
    def __repr__(self):
        '''Vrne obliko (rešitve, začetno polje, trenutno polje, vnešene možnosti).'''
        return  repr((self.resitve, self.zacetni, self.trenutni, self.napake, self.zadnji_vnos))
        
    def zmaga(self):
        '''Preveri, ali je sudoku izpolnjen pravilno. '''
        return self.trenutni == self.resitve    

    def vnos(self, celica, stevilo):
        if stevilo not in (1,2,3,4,5,6,7,8,9):
            return NAPACEN_ZNAK
        if self.zacetni[celica] != 0:
            return FIKSNO_POLJE
        else:
            self.trenutni[celica] = stevilo
            self.zadnji_vnos = (celica, stevilo)
        if self.zmaga:
            return ZMAGA
        return USPESEN_VNOS
    

    def moznost(self, celica, stevilo):
        if stevilo not in (1,2,3,4,5,6,7,8,9):
            return NAPACEN_ZNAK
        if self.zacetni[celica] != 0:
            return FIKSNO_POLJE
        else:
            self.moznosti[celica].add(stevilo)

    def kvadratek(self, celica):
        '''Določi, v katerem večjem 3 x 3 kvadratku
        se nahaja celica. '''
        vrstica, stolpec = celica
        v_kvadratek = None    
        s_kvadratek = None
        if vrstica in (1, 2, 3):
            v_kvadratek = 1
        elif vrstica in (4, 5, 6):
            v_kvadratek = 2
        else:
            v_kvadratek = 3
        if stolpec in (1, 2, 3):
            s_kvadratek = 1
        elif stolpec in (4, 5, 6):
            s_kvadratek = 2
        else:
            s_kvadratek = 3
        return (v_kvadratek, s_kvadratek)
    
    def preveri_vrstico(self, celica):
        '''Preveri, ali se število v celici že pojavi
        v tej vrstici. '''
        napacne_celice = []  
        vrednost = self.trenutni[celica]
        for vrstica in range(1, 10):
            if vrstica != celica[0]:
                if self.trenutni[(vrstica, celica[1])] == vrednost:
                    napacne_celice.append((vrstica, celica[1]))
        if len(napacne_celice) == 0:
            return PRAVILNO
        self.napake[(celica)].update(napacne_celice)
        return NAROBE

    def preveri_stolpec(self, celica):
        '''Preveri, ali se število v celici že pojavi
        v tem stolpcu. '''
        vrednost = self.trenutni[celica]
        napacne_celice = []                
        for stolpec in range(1, 10):
            if stolpec != celica[1]:
                if self.trenutni[(celica[0], stolpec)] == vrednost:
                    napacne_celice.append((celica[0], stolpec))
        if len(napacne_celice) == 0:
            return PRAVILNO
        self.napake[(celica)].update(napacne_celice)
        return NAROBE

 
    def preveri_kvadratek(self, celica):
        '''Preveri, ali se število v celici že pojavi
        v  pripadajočem 3 x 3 kvadratku. '''
        vrednost = self.trenutni[celica]
        napacne_celice = []
        for v in range(1,10):
            for s in range(1, 10):
                if self.kvadratek((v, s)) == self.kvadratek(celica):
                    if (v, s) != celica:
                        if self.trenutni[(v, s)] == vrednost:
                            napacne_celice.append((v, s))
        if len(napacne_celice) == 0:
            return PRAVILNO
        self.napake[(celica)].update(napacne_celice)
        return NAROBE


    def preveri_vnos(self, celica):
        '''Preveri, ali je vnešeno število pravilno glede na
        ostala trenutno vnešena števila (in ne glede na rešitev).
        Polja, kjer se število iz celice ponovi, vnese v slovar.'''
        self.napake[celica] = set()
        v = self.preveri_vrstico(celica)
        s = self.preveri_stolpec(celica)
        k = self.preveri_kvadratek(celica)
        if v == NAROBE or s == NAROBE or k == NAROBE:
            return self.napake[celica] 
        return PRAVILNO

    def pocisti(self):
        '''Začne isto igro od začetka'''
        slovar = self.zacetni
        self.trenutni = slovar


class Sudoku:
    
    def __init__(self, datoteka_s_stanjem, datoteka_s_sudokuji='Sudoku\sudoku_in_resitve.txt'):
        self.igre = {}
        self.datoteka_s_stanjem = datoteka_s_stanjem
        self.datoteka_s_sudokuji = datoteka_s_sudokuji
    
    def prost_id_igre(self):
        if len(self.igre) == 0:
            return 0
        else:
            return max(self.igre.keys()) + 1
    
    def izberi_sudoku(self, tezavnost):
        with open(self.datoteka_s_sudokuji, 'r', encoding='utf-8') as datoteka:
            igre = [make_tuple(vrstica.strip()) for vrstica in datoteka]
            sudoku = None
            if tezavnost == 1:
                sudoku = random.choice(igre[:15])
            if tezavnost == 2:
                sudoku = random.choice(igre[15:30])
            if tezavnost == 3:
                sudoku = random.choice(igre[30:])
        return sudoku

    def nova_igra(self, tezavnost):
        if tezavnost not in (1, 2, 3):
            return NEVELJAVNA_IZBIRA
        id_igre = self.prost_id_igre()
        self.igre[id_igre] = Igra(self.izberi_sudoku(tezavnost))
        self.zapisi_igre_v_datoteko()
        return id_igre

    def vnesi(self, id_igre, celica, stevilo):
        self.nalozi_igre_iz_datoteke()
        igra = self.igre[id_igre]
        igra.vnos(celica, stevilo)
        self.igre[id_igre] = igra 
        self.zapisi_igre_v_datoteko()
        return igra.vnos(celica, stevilo)
    
    def vnesi_moznost(self, id_igre, celica, stevilo):
        self.nalozi_igre_iz_datoteke()
        igra = self.igre[id_igre]
        igra.moznost(celica, stevilo)
        self.igre[id_igre] = igra
        self.zapisi_igre_v_datoteko()
        return igra.moznost(celica, stevilo)
    
    def preveri_vnos(self, id_igre, celica):
        igra = self.igre[id_igre]
        return igra.preveri_vnos(celica)

    def pocisti(self, id_igre):
        self.nalozi_igre_iz_datoteke()
        igra = self.igre[id_igre]
        igra.pocisti()
        self.igre[id_igre] = igra
        self.zapisi_igre_v_datoteko()
        return USPESEN_VNOS
        
        
    def zapisi_igre_v_datoteko(self):
        with open(self.datoteka_s_stanjem, 'w', encoding='utf-8') as f:
            seznam = {id_igre: (igra.resitve, igra.zacetni, igra.trenutni, igra.napake, igra.zadnji_vnos)
                     for id_igre, igra in self.igre.items()} #hm
            print(self.igre.items())
            json.dump(str(seznam), f)
        
    def nalozi_igre_iz_datoteke(self):
        with open(self.datoteka_s_stanjem, 'r', encoding="utf-8") as f:
            igre = json.load(f)
            self.igre = {int(id_igre): Igra((zacetni, resitev), trenutni, napake, zadnji_vnos)
                         for id_igre, (resitev, zacetni, trenutni, napake, zadnji_vnos) in eval(igre).items()}