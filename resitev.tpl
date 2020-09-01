% from model import *

<!DOCTYPE html>

<html>
    <head>
        <title>SUDOKU</title>
    </head>

    <style>
        body, html {
            height: 100%;
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
    
        input[type=number]::-webkit-inner-spin-button, 
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

  
        table {
            border-inline-color: #4d2e00;
        }

        .prazen_gumb {
            background-color: #fff4e6;
            width: 20px;
        }

        .izpolnjen_gumb{
            background-color: #ffdeb3;
            width: 20px;
        }

        .polje {
            border: 7px solid  #4d2e00;
            border-color: #4d2e00;
            border-width: 2px;
            border-inline-end-color:#4d2e00 ;
        }

        .poln_kvadratek {
            border: 2px solid #4d2e00;
            background-color: #ffc880;
            width: 20px;

        }

        .navodilo {
            font-size: 16px;
            color: #4d2e00;
            padding: 15px;
            text-align: center;
        }

        .gumb {
            background-color: #995900; 
            border: none;
            color: white;
            padding: 10px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 15px;    
        }
        
        td {
            width: 10%;
            height: 10%;
        }
    
        
    </style>
   
    <body>
        <h1>SUDOKU</h1>
        <table style="padding: 100px; width: 100%">
            <tr>
                <td>Vaš vnos:</td>
                <td>Rešitev:</td>
                <td>Kako želite nadaljevati?</td>
            </tr>

            <tr>
                <td>
                    <table class="polje" style="width:40%">
                      % for vrstica in range(1, 10):
                          <tr>
                              % for stolpec in range(1, 10):
                                  % if igra.zacetni[(vrstica, stolpec)] != 0:
                                      <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                  % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                      <td class="vnesen_kvadratek"> 
                                          {{igra.trenutni[(vrstica, stolpec)]}}
                                      </td>
                                  % else:
                                      <td class="prazen_kvadratek"> 
                                          -
                                      </td>
                                  % end
                              % end
                          </tr>
                         % end
                    </table>
                </td>
                <td>
                    <table class="polje" style="width:40%">
                        % for vrstica in range(1, 10):
                        <tr>
                            % for stolpec in range(1, 10):
                                % if igra.zacetni[(vrstica, stolpec)] != 0:
                                    <td class="poln_kvadratek"> 
                                        {{igra.zacetni[(vrstica, stolpec)]}} 
                                    </td>
                                % else: 
                                    <td class="vnesen_kvadratek">
                                        {{igra.resitve[(vrstica, stolpec)]}}
                                    </td>
                                % end
                            % end
                         </tr>
                        % end
                    </table>
                </td>
                <td>
                    <form action="/resitev_preusmeritev/{{id_igre}}/" method="post" >
                        <input type="radio" id="2" name="vnos" value='2'>
                        <label for="2">nazaj na igro</label> 
                        <br>
                        <input type="radio" id="1" name="vnos" value='1'>
                        <label for="1">nova igra</label>
                        <br>
                        <input type="radio" id="3" name="vnos" value='3'>
                        <label for="3">začni igro od začetka</label>
                        <br>
                        <br>
                        <button class="gumb" type="submit">potrdi</button>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>