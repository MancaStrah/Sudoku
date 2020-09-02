% import model
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

        .prazen_gumb {
            border-color: none;
            border: none;
            background-color: #ffffff;
            width: 35px;
            height: 35px;
        }

        .izpolnjen_gumb{
            border-color: none;
            border: none;
            background-color: #ffdeb3;
            text-align: center;
            width: 35px;
            height: 35px;
        }

        .polje {
            border: 7px solid  #4d2e00;
            border-color: #4d2e00;
            background-color:#4d2e00 ;
            border-width: 5px;
            border-inline-end-color:#4d2e00 ;
            width: 60%;
            height: 60%;

        }

        h2 {
            color: #4d2e00;
            font-weight: bolder;
            padding-bottom: 4px;
            padding-left: 100px;
            text-align: left;
        }

        .poln_kvadratek {
            border-color: none;
            background-color: #ffc880;
            width: 35px;
            height: 35px;
        }

        .navodilo {
            font-size: 16px;
            color: #4d2e00;
            text-align: left;
            padding-left: 100px;
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

        tr {
            text-align: center;
        }

        td {
            text-align: center;
        }
    </style>

<body style="text-align: center;">
    <h1>SUDOKU</h1>
     
    <table style="width: 80%; height: 60%; padding-left: 250px; padding-right: 50px;" >
        <tr>
          <td>
            <table class="polje">
                <tr>
                    <td> 
                        <table>
                            % for vrstica in range(1, 4):
                            <tr>
                                % for stolpec in range(1, 4):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                    </td>
                                    % end
                                % end
                            </tr>
                            % end
                        </table>
                    </td>
                    <td>
                        <table>
                            % for vrstica in range(1, 4):
                            <tr>
                                % for stolpec in range(4, 7):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                    </td>
                                    % end
                                % end
                            </tr>
                            % end
                        </table>
                    </td>
                    <td> 
                        <table>
                            % for vrstica in range(1, 4):
                            <tr>
                                % for stolpec in range(7, 10):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                    </td>
                                    % end
                                % end
                            </tr>
                            % end
                        </table>
                    </td>
                </tr>
                <tr>
                    <td> 
                        <table>
                            % for vrstica in range(4, 7):
                            <tr>
                                % for stolpec in range(1, 4):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                    </td>
                                    % end
                                % end
                            </tr>
                            % end
                        </table>
                    </td>
                    <td> 
                        <table>
                            % for vrstica in range(4, 7):
                            <tr>
                                % for stolpec in range(4, 7):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                    </td>
                                    % end
                                % end
                            </tr>
                            % end
                        </table>
                    </td>
                    <td> 
                        <table>
                            % for vrstica in range(4, 7):
                            <tr>
                                % for stolpec in range(7, 10):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                    </td>
                                    % end
                                % end
                            </tr>
                            % end
                        </table>
                    </td>  
                </tr>
                <tr>
                    <td> 
                        <table>
                            % for vrstica in range(7, 10):
                            <tr>
                                % for stolpec in range(1, 4):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                    </td>
                                    % end
                                % end
                            </tr>
                            % end
                        </table>
                    </td>
                    <td> 
                        <table>
                            % for vrstica in range(7, 10):
                            <tr>
                                % for stolpec in range(4, 7):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                    </td>
                                    % end
                                % end
                            </tr>
                            % end
                        </table>
                    </td>
                    <td> 
                        <table>
                            % for vrstica in range(7, 10):
                            <tr>
                                % for stolpec in range(7, 10):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none" required>
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                    </td>
                                    % end
                                % end
                            </tr>
                            % end
                        </table>
                    </td>  
                </tr>           
            </table>
            
          </td>
          <td>
            <table>
                <tr>
                    <h2>NAVODILA</h2>
                    <p class="navodilo">Za vnos števila v polje na levi izberite polje, <br> 
                        vanj vnesite izbrano število in pritisnite enter. <br><br>
                        Ko se polje obarva, je vaš vnos zabeležen. <br>
                        Kasneje ga lahko spremenite.
                    </p>
                </tr>
                <tr>
                    <br>
                    <br>
                    <p class="navodilo" style="padding-bottom: 7px">Preverite, ali ste sudoku rešili pravilno: <br><br>
                        <form action="/preveri_zmaga/{{id_igre}}/" method="post">
                            <button class="gumb" style="padding-top: 7px" type="submit">preveri</button>
                        </form>
                    </p>
                    </tr>
                
                <tr>
                    <br>
                    <p class="navodilo" style="padding-bottom: 7px">Počistite polje in začnite od začetka: <br><br>
                     <form action="/pocisti_igro/{{id_igre}}/" method="post">
                        <button class="gumb" style="padding-top: 7px" type="submit">počisti</button>
                    </form>  
                </p>
                </tr>

                <tr>
                Preverjaj zadnji vnos.
                <p class="pojasnilo">Če vklopite funkcijo, bo stvar ... - napisano na majhno</p>
                <form action='/igra/{{id_igre}}/' method="post">
                    <label class="switch">
                        <input type="checkbox">
                        <span class="slider"></span>
                      </label>
                </form>
                </tr>
              

            </table>
          </td> 
        </tr>
    </table>


    </body>
</html>