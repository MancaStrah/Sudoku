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

        .obvestilo {
            padding-top: 80px;
            padding-bottom: 50px;
            text-align: center;
            font-size: 35px;
        }

        p {
            padding-top: 80px;
            padding-bottom: 10px;
            font-size: 25px;
            text-align: center;
        }

        .center {
            padding: 10px;
            text-align: center;
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

    <body>
        <h1>SUDOKU</h1>
        <div class="obvestilo"> 
            Žal sudoku ni pravilno izpolnjen :( 
        </div>
        <div >
            <form action="/preveri_preusmeritev/{{id_igre}}/" method="post" >
                <p>Kaj želite storiti?</p>
                <div class="center">
                    <input type="radio" id="2" name="vnos" value='2' required>
                    <label for="2">nadaljuj s to igro</label> 

                    <input type="radio" id="1" name="vnos" value='1'>
                    <label for="1">nova igra</label>

                    <input  type="radio" id="3" name="vnos" value='3'>
                    <label for="3">začni igro od začetka</label>

                    <input type="radio" id="4" name="vnos" value='4'>
                    <label for="4">pokaži rešitev</label>

                    <br>
                    <br>

                    <button class="gumb" type="submit">potrdi</button>
                </div>
            </form> 
        </div>
    </body>
</html>