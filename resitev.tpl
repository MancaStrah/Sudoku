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
    
        input[type=number]::-webkit-inner-spin-button, 
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

  
        table {
            border-inline-color: #4d2e00;
        }

        .prazen_kvadratek {
            border-color: none;
            background-color: #fff4e6;
            width: 35px;
            height: 35px;
        }

        .vnesen_kvadratek{
            border-color: none;
            background-color: #ffdeb3;
            text-align: center;
            width: 35px;
            height: 35px;
        }

        .polje {
            border: 7px solid  #4d2e00;
            border-color: #4d2e00;
            border-width: 5px;
            border-inline-end-color:#4d2e00 ;
            width:80%;
            height:80%;
        }

        .poln_kvadratek {
            border: none;
            background-color: #ffc880;
            width: 35px;
            height: 35px;
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

        .vnesen_kvadratek_narobe {
            color: red;
            font-weight: bold;
            width: 35px;
            height: 35px;
            text-align: center;
        }
        

     

        
    </style>
   
    <body>
        <h1>SUDOKU</h1>

        <table style="width: 80%; height: 60%; padding-left: 250px; padding-right: 50px;">
            <tr>
                <td>Vaš vnos:</td>
                <td>Rešitev:</td>
                <td></td>
            </tr>

            <tr>
                <td>
                    <table class="polje" >
                      % for vrstica in range(1, 10):
                          <tr>
                              % for stolpec in range(1, 10):
                                  % if igra.zacetni[(vrstica, stolpec)] != 0:
                                      <td class="poln_kvadratek" style="text-align: center"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                  % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                    % if igra.trenutni [(vrstica, stolpec)] ==  igra.resitve[(vrstica, stolpec)]:
                                        <td class="vnesen_kvadratek" style="text-align: center"> 
                                            {{igra.trenutni[(vrstica, stolpec)]}}
                                        </td>
                                    % elif igra.trenutni [(vrstica, stolpec)] !=  igra.resitve[(vrstica, stolpec)]:
                                    <td class="vnesen_kvadratek_narobe" style="text-align: center"> 
                                        {{igra.trenutni[(vrstica, stolpec)]}}
                                    </td>
                                    % end

                                  % else:
                                      <td class="prazen_kvadratek" style="text-align: center"> 
                                          -
                                      </td>
                                  % end
                              % end
                          </tr>
                         % end
                    </table>
                </td>
                <td>
                    <table class="polje">
                        % for vrstica in range(1, 10):
                        <tr>
                            % for stolpec in range(1, 10):
                                % if igra.zacetni[(vrstica, stolpec)] != 0:
                                    <td class="poln_kvadratek" style="text-align: center"> 
                                        {{igra.zacetni[(vrstica, stolpec)]}} 
                                    </td>
                                % else: 
                                    <td class="vnesen_kvadratek" style="text-align: center">
                                        {{igra.resitve[(vrstica, stolpec)]}}
                                    </td>
                                % end
                            % end
                         </tr>
                        % end
                    </table>
                </td>
                <td>
                    <p>
                        Kako želite nadaljevati?
                    </p>
                    <form action="/resitev_preusmeritev/{{id_igre}}/" method="post" >
                        <input type="radio" id="2" name="vnos" value='2' required>
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