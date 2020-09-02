% from model import *

<!DOCTYPE html>
<html>
    <head>
        <title>SUDOKU</title>
        
    </head>

    <style>
        body, html {
            height: 100%;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #FFEFD5;
            margin: auto;
        }
        
        h1 {
            font-size: 50px;
            color: #FFEFD5;
            font-weight: bold;
            padding-left: 15px;
            padding-top: 20px;
            padding-bottom:20px;
            background-color: #4d2e00;
            text-align: left;
        }

        .pozdrav {
            padding-top: 80px;
            padding-bottom: 50px;
            font-size: 35px;
        }

        p {
            padding-top: 80px;
            padding-bottom: 10px;
            font-size: 25px;
        }

        .gumb {
            background-color: #995900;
            border: none;
            color: white;
            padding: 10px 15px;
            padding-top: 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;    
        }
        

        label {
            font-size: 20px;
            padding-right: 10px;
            padding-bottom: 20px;
            margin-bottom: 10px;
        }

    </style>

    <body style="text-align:center" >
        <h1>SUDOKU</h1>
        <div> 
            <p class="pozdrav">Pozdravljeni.</p>
            <form action="/nova_igra/" method="post" >
                    <p>Prosimo, izberite težavnost:</p>
                    <div>
                        <input type="radio" id="1" name="tezavnost" value=1 required>
                        <label for="1">lahka</label>
                        
                        <input type="radio" id="2" name="tezavnost" value=2>
                        <label for="2">srednja</label>
                        
                        <input type="radio" id="3" name="tezavnost" value=3>
                        <label for="3">težka</label>    
                    </div>
                    <div>
                        <br>
                        <button type="submit" class="gumb">potrdi</button>
                    </div>

            </form>
        </div>      
    </body>
</html>