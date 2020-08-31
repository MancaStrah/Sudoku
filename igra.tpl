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

    .prazen_kvadratek {
        border: 2px solid gray;
    }

    .vnesen_kvadratek {
        border: 2px solid gray;
       

    }

    </style>

    <body>
     
    <table >
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
                                <form action="/igra/" method="post">
                                <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none", value="{{igra.trenutni[(vrstica, stolpec)]}}">
                                <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                </form>
                                </td>
                            % else:
                            <td class="prazen_kvadratek"> 
                                <form action="/igra/" method="post">
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
                <tr>
                    <p>Na levi izberite polje, v katero želite vnesti število, in ga vnesite.</p>
                </tr>
                <tr>
                    
                </tr>
                <tr>
          
                </tr>
                <tr></tr>

            </table>
          </td> 
        </tr>
    </table>


    </body>
</html>