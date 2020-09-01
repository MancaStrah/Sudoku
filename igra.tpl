% import model
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
        
    </style>

    <body>
        <h1>SUDOKU</h1>
     
    <table style="width: fit-content; padding-left: 50px" >
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
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}">
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none">
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
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}">
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none">
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
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}">
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none">
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
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}">
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none">
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
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}">
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none">
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
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}">
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none">
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
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}">
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none">
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
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}">
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none">
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
                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}">
                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                        </form>
                                        </td>
                                    % else:
                                    <td> 
                                        <form action="/igra/{{id_igre}}/" method="post">
                                        <input type="number" class ="prazen_gumb" id="stevilo" name="stevilo" appearance="none">
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
                    <p class="navodilo">Za vnos števila v polje na levi izberite polje, <br> 
                        vanj vnesite izbrano število in pritisnite enter. <br><br>
                        Ko se polje obarva oranžno, je vaš vnos zabeležen. <br>
                        Kasneje ga lahko spremenite.
                    </p>
                </tr>
                <tr>
                    <p class="navodilo">Preverite, ali ste sudoku rešili pravilno. <br>
                    <form action="/preveri_zmaga/{{id_igre}}/" method="post">
                        <button class="gumb" type="submit">preveri</button>
                    </form>
                </p>
                </tr>
                
                <tr>
                    <p class="navodilo">Počistite polje in začnite od začetka. <br>
                     <form action="/pocisti_igro/{{id_igre}}/" method="post">
                        <button class="gumb" type="submit">počisti</button>
                    </form>  
                </p>
                </tr>
              

            </table>
          </td> 
        </tr>
    </table>


    </body>
</html>