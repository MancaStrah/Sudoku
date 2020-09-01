% from model import *

<!DOCTYPE html>

<html>
    <head>
        <title>SUDOKU</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.2/css/bulma.min.css">
    </head>

    <body>
        <div> 
            Hja, poskusimo še malo izboljšati to reč. 
        </div>
        <div>
            <form action="/preveri_preusmeritev/{{id_igre}}/" method="post" >
                <p>Kaj želite?</p>
                <div>
                    <input type="radio" id="2" name="vnos" value='2'>
                    <label for="2">nazaj</label> 

                    <input type="radio" id="1" name="vnos" value='1'>
                    <label for="1">nova igra</label>

                    <input type="radio" id="3" name="vnos" value='3'>
                    <label for="3">začni od začetka</label>

                    <input type="radio" id="4" name="vnos" value='4'>
                    <label for="4">pokaži rešitev</label>

                    <button type="submit">potrdi</button>
                </div>
            </form> 
        </div>
    </body>
</html>