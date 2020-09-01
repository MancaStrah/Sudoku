% from model import *

<!DOCTYPE html>

<html>
    <head>
        <title>SUDOKU</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.2/css/bulma.min.css">
    </head>

    <body>
        <div> 
           Čestitke, uspelo vam je.
        </div>
        <div>
            <form action="/preveri_preusmeritev/{{id_igre}}/" method="post" >
                <p>Kaj želite sedaj?</p>
                <div>
                    <input type="radio" id="1" name="vnos" value=1>
                    <label for="1">nova igra</label>

                    <input type="radio" id="4" name="vnos" value=4>
                    <label for="4">poglej rešitev</label> 
                </div>
                <div>
                    <button type="submit">potrdi</button>
                </div>
            </form> 
        </div>
    </body>
</html>