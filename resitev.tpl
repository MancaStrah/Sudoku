% from model import *

<!DOCTYPE html>

<html>
    <head>
        <title>SUDOKU</title>
    </head>

    <style>
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
        <table>
            <tr>
                <td>Vaš vnos:</td>
                <td>Rešitev:</td>
                <td>Kako želite nadaljevati?</td>
            </tr>
            <tr>
                <td>
                    <table class="polje">
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
                        <label for="2">nazaj</label> 
                        <br>
                        <input type="radio" id="1" name="vnos" value='1'>
                        <label for="1">nova igra</label>
                        <br>
                        <input type="radio" id="3" name="vnos" value='3'>
                        <label for="3">začni od začetka</label>
                        <br>
                        <button type="submit">potrdi</button>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>