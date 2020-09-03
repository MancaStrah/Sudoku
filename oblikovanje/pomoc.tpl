% from model import *
<!DOCTYPE html>

<html>
    <head>
        <title>SUDOKU</title>
    </head>

    <body>

        <p class="pozdrav">Pozdravljeni.</p>
        <form action="/pomoc/{{id_igre}}/" method="post" >
                <p>Ali želite, da računalnik preveri vaš vnos <br>
                    števila v polje in označi, če se število ponovi <br>
                    v isti vrstici, stolpcu ali večjem kvadratu?:</p>
                <div>
                    <input type="radio" id="1" name="pomoc" value=1 required>
                    <label for="1">da</label>
                    
                    <input type="radio" id="2" name="pomoc" value=2>
                    <label for="2">ne</label>
                </div>
                <div>
                    <br>
                    <button type="submit" class="gumb">potrdi</button>
                </div>

        </form>

    </body>