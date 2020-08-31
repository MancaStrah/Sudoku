% from model import *


<!DOCTYPE html>
<html>
    <head>
        <title>SUDOKU</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.8.2/css/bulma.min.css">
    </head>

    <body>
        <h1>SUDOKU</h1>
        <div> 
            <p>Pozdravljeni.</p>
            <form action="/nova_igra/" method="post" >
                    <p>Prosim, izberite težavnost</p>
                    <div>
                      <input type="radio" id="1" name="tezavnost" value=1>
                      <label for="1">1</label>
                  
                      <input type="radio" id="2" name="tezavnost" value=2>
                      <label for="2">2</label>
                  
                      <input type="radio" id="3" name="tezavnost" value=3>
                      <label for="3">3</label>
                    </div>
                    <div>
                        <button type="submit">potrdi</button>
                    </div>
            </form>
        </div>      
    </body>
</html>