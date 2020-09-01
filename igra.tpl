% import model
<!DOCTYPE html>

<html>
    <head>
        <title>SUDOKU</title>
    </head>

    <style>
    
    input[type=number]::-webkit-inner-spin-button, 
    input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }

  
    table {
        border-inline-color: black;
    }

    .prazen_gumb {
        background-color: lightgreen;
        width: 20px;
    }

    .izpolnjen_gumb{
        background-color: lightblue;
        width: 20px;
    }

    .polje {
        border: 7px solid black;

    }


    .poln_kvadratek {
        border: 2px solid gray;
        background-color: lightskyblue;
        width: 20px;

    }


    </style>

    <body>
     
    <table >
        <tr>
          <td>
            <table class="polje" style="width:40%">
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
                    <p>Za vnos števila v polje na levi izberite polje, vanj vnesite izbrano število in pritisnite enter.</p>
                </tr>
                <tr>
                    <p>Preverite, ali ste sudoku rešili pravilno. </p>
                    <form action="/preveri_zmaga/{{id_igre}}/" method="post">
                        <button type="submit">preveri</button>
                    </form>
                </tr>
                
                <tr>
                    <p>Počistite polje in začnite od začetka.</p>
                     <form action="/pocisti_igro/{{id_igre}}/" method="post">
                        <button type="submit">počisti</button>
                    </form>  
                </tr>
              

            </table>
          </td> 
        </tr>
    </table>


    </body>
</html>