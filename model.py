import random
import json
from ast import literal_eval as make_tuple

FIKSNO_POLJE = 'F'
NAPACEN_ZNAK = 'Z'
NAROBE = '-'
PRAVILNO = '+'
ZACETEK = '!'


    
class Igra:
     
    def __init__(self, seznam, trenutni=None, moznosti=None): #Seznam je oblike (začetni sudoku, rešitev)
        self.resitve = seznam[1]
        self.zacetni = seznam[0]
        if trenutni is None:
            self.trenutni = seznam[0]
        else:
            self.trenutni = trenutni
        #Slovar, v katerega bodo vnešene vrednosti, za katere igralec meni, da bi se 
        #lahko pojavile v določeni celici.
        if moznosti is None:
        self.moznosti = {(i,j): set() for i in range(1, 10) for j in range(1, 10)}
        else: 
            self.moznosti = moznosti
        #vrne vse celice v istem stolpcu, vrstici ali kvadratku, ki imajo enako vrednost kot dana celica
        self.napake = {(i,j): set() for i in range(1, 10) for j in range(1, 10)}
        
    def __repr__(self):
        '''Vrne obliko (rešitve, začetno polje, trenutno polje, vnešene možnosti).'''
        return  repr((self.resitve, self.zacetni, self.trenutni, self.moznosti))
        
    def zmaga(self):
        return self.trenutni == self.resitve    

    def vnos(self, celica, stevilo):
        if stevilo not in (1,2,3,4,5,6,7,8,9):
            return NAPACEN_ZNAK
        if self.zacetni[celica] != 0:
            return FIKSNO_POLJE
        else:
            self.trenutni[celica] = stevilo
    

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
        ostala trenutno vnešena števila (in ne glede na rešitev). '''
        self.napake[celica] = set()
        v = self.preveri_vrstico(celica)
        s = self.preveri_stolpec(celica)
        k = self.preveri_kvadratek(celica)
        if v == NAROBE or s == NAROBE or k == NAROBE:
            return NAROBE 
        return PRAVILNO

    def pocisti(self):
        '''Začne isto igro od začetka'''
        self.trenutni = {(i,j): self.zacetni_polja[i - 1][j - 1] for i in range(1, 10) for j in range(1, 10)}


with open('sudoku_in_resitve.txt') as datoteka:
    igre = [make_tuple(vrstica.strip()) for vrstica in datoteka]


def nova_igra(tezavnost):
    sudoku = None
    if tezavnost == 1:
        sudoku = random.choice(igre[:15])
    if tezavnost == 2:
        sudoku = random.choice(igre[15:30])
    else:
        sudoku = random.choice(igre[30:])
    return Igra(sudoku)
