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

        <p style="font-size: 30px; padding-top: 120px; padding-bottom: 50px">Želite med igro pomoč?</p>
   
        <p style="font-size: 22px"> Če želite, da računalnik ob vsakem vnosu preveri, ali <br>
            je vnost glede na trenutno polje pravilen, izberite 'da'. 
        </p>
               
        <p style="font-size: 19px;">Polje, v katero boste vnesli število, se bo obarvalo <br>
            zeleno, polja v isti vrstici, stolpcu ali večjem kvadratku, <br>
            kjer se vnešeno število ponovi, pa rdeče. 
        </p>
        <p style="font-style: italic ">
            Računalnik bo preverjal pravilnost vašega vnosa glede na <br>
            trenutno polje in ne glede na pravo rešitev sudokuja!
        </p>
               
        <form action="/pomoc/{{id_igre}}/" method="post" >
            <div class="center"  style="align-content: center">
                   
                <input type="radio" id="1" name="pomoc" value=1 required>
                <label for="1">da</label>
                    
                <input type="radio" id="2" name="pomoc" value=2>
                <label for="2">ne</label>
            </div>
            <div class="center" style="align-content: center" >
                    <br>
                    <button type="submit" class="gumb">potrdi</button>
                </div>
            </form>
                


  

    </body>