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

        .polje {
            border: 7px solid  #4d2e00;
            border-color: #4d2e00;
            background-color:#4d2e00 ;
            border-width: 5px;
            border-inline-end-color:#4d2e00 ;
            width: 90%;
            height: 100%;
            content-align: center;
        }

        h2 {
            color: #4d2e00;
            font-weight: bolder;
            padding-bottom: 4px;
            padding-left: 100px;
            text-align: left;
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
        
        .opazovan_kvadratek {
            border-color: none;
            border: none;
            background-color: #ffed4d;
            text-align: center;
            width: 59px;
            height: 59px;
            font-size: 25px;
        }

        .napacen_kvadratek {
            border-color: none;
            border: none;
            background-color: #ff4400;
            text-align: center;
            width: 59px;
            height: 59px;
            font-size: 25px;
        }

        .poln_kvadratek {
            border-color: none;
            border: none;
            background-color: #ffc880;
            text-align: center;
            width: 59px;
            height: 59px;
            font-size: 25px;
        }

        .prazen_gumb {
            border-color: none;
            border: none;
            background-color: #ffffff;
            text-align: center;
            width: 59px;
            height: 59px;
            font-size: 25px;
        }

        .izpolnjen_gumb{
            border-color: none;
            border: none;
            background-color: #ffdeb3;
            text-align: center;
            width: 59px;
            height: 59px;
            font-size: 25px;
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
                            % for vrstica in range(1,4):
                            <tr>
                                % for stolpec in range(1, 4):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                            %else:
                                                %if (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td class="napacen_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %else:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %end
                                            %end
                                        %else:
                                            <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                        %end
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                            %else:
                                                %if (vrstica, stolpec) == igra.zadnji_vnos[0]:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="opazovan_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                                %elif (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="napacen_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %else:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %end
                                            %end
                                        %else:
                                            <td> 
                                                <form action="/igra/{{id_igre}}/" method="post">
                                                <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                </form>
                                            </td>
                                        %end
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
                            % for vrstica in range(1,4):
                            <tr>
                                % for stolpec in range(4,7):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                            %else:
                                                %if (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td class="napacen_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %else:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %end
                                            %end
                                        %else:
                                            <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                        %end
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                            %else:
                                                %if (vrstica, stolpec) == igra.zadnji_vnos[0]:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="opazovan_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                                %elif (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="napacen_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %else:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %end
                                            %end
                                        %else:
                                            <td> 
                                                <form action="/igra/{{id_igre}}/" method="post">
                                                <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                </form>
                                            </td>
                                        %end
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
                            % for vrstica in range(1,4):
                            <tr>
                                % for stolpec in range(7,10):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                            %else:
                                                %if (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td class="napacen_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %else:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %end
                                            %end
                                        %else:
                                            <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                        %end
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                            %else:
                                                %if (vrstica, stolpec) == igra.zadnji_vnos[0]:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="opazovan_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                                %elif (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="napacen_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %else:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %end
                                            %end
                                        %else:
                                            <td> 
                                                <form action="/igra/{{id_igre}}/" method="post">
                                                <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                </form>
                                            </td>
                                        %end
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
                            % for vrstica in range(4,7):
                            <tr>
                                % for stolpec in range(1,4):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                            %else:
                                                %if (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td class="napacen_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %else:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %end
                                            %end
                                        %else:
                                            <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                        %end
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                            %else:
                                                %if (vrstica, stolpec) == igra.zadnji_vnos[0]:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="opazovan_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                                %elif (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="napacen_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %else:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %end
                                            %end
                                        %else:
                                            <td> 
                                                <form action="/igra/{{id_igre}}/" method="post">
                                                <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                </form>
                                            </td>
                                        %end
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
                            % for vrstica in range(4,7):
                            <tr>
                                % for stolpec in range(4,7):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                            %else:
                                                %if (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td class="napacen_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %else:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %end
                                            %end
                                        %else:
                                            <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                        %end
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                            %else:
                                                %if (vrstica, stolpec) == igra.zadnji_vnos[0]:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="opazovan_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                                %elif (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="napacen_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %else:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %end
                                            %end
                                        %else:
                                            <td> 
                                                <form action="/igra/{{id_igre}}/" method="post">
                                                <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                </form>
                                            </td>
                                        %end
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
                            % for vrstica in range(4,7):
                            <tr>
                                % for stolpec in range(7,10):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                            %else:
                                                %if (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td class="napacen_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %else:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %end
                                            %end
                                        %else:
                                            <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                        %end
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                            %else:
                                                %if (vrstica, stolpec) == igra.zadnji_vnos[0]:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="opazovan_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                                %elif (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="napacen_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %else:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %end
                                            %end
                                        %else:
                                            <td> 
                                                <form action="/igra/{{id_igre}}/" method="post">
                                                <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                </form>
                                            </td>
                                        %end
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
                            % for vrstica in range(7,10):
                            <tr>
                                % for stolpec in range(1, 4):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                            %else:
                                                %if (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td class="napacen_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %else:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %end
                                            %end
                                        %else:
                                            <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                        %end
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                            %else:
                                                %if (vrstica, stolpec) == igra.zadnji_vnos[0]:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="opazovan_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                                %elif (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="napacen_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %else:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %end
                                            %end
                                        %else:
                                            <td> 
                                                <form action="/igra/{{id_igre}}/" method="post">
                                                <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                </form>
                                            </td>
                                        %end
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
                            % for vrstica in range(7,10):
                            <tr>
                                % for stolpec in range(4,7):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                            %else:
                                                %if (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td class="napacen_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %else:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %end
                                            %end
                                        %else:
                                            <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                        %end
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                            %else:
                                                %if (vrstica, stolpec) == igra.zadnji_vnos[0]:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="opazovan_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                                %elif (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="napacen_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %else:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %end
                                            %end
                                        %else:
                                            <td> 
                                                <form action="/igra/{{id_igre}}/" method="post">
                                                <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                </form>
                                            </td>
                                        %end
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
                            % for vrstica in range(7,10):
                            <tr>
                                % for stolpec in range(7,10):
                                    % if igra.zacetni[(vrstica, stolpec)] != 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                            %else:
                                                %if (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td class="napacen_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %else:
                                                <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                                %end
                                            %end
                                        %else:
                                            <td class="poln_kvadratek"> {{igra.zacetni[(vrstica, stolpec)]}} </td>
                                        %end
                                    % elif igra.trenutni [(vrstica, stolpec)] != 0 and igra.zacetni[(vrstica, stolpec)] == 0:
                                        % if stikalo_za_pomoc:
                                            %if len(igra.zadnji_vnos) == 0:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                            %else:
                                                %if (vrstica, stolpec) == igra.zadnji_vnos[0]:
                                                <td> 
                                                    <form action="/igra/{{id_igre}}/" method="post">
                                                    <input type="number" class="opazovan_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                    <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                    </form>
                                                </td>
                                                %elif (vrstica, stolpec) in igra.napake[(igra.zadnji_vnos[0])]:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="napacen_kvadratek" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %else:
                                                    <td> 
                                                        <form action="/igra/{{id_igre}}/" method="post">
                                                        <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                        <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                        </form>
                                                    </td>
                                                %end
                                            %end
                                        %else:
                                            <td> 
                                                <form action="/igra/{{id_igre}}/" method="post">
                                                <input type="number" class="izpolnjen_gumb" id="stevilo" name="stevilo" appearance="none" value="{{igra.trenutni[(vrstica, stolpec)]}}" required>
                                                <input type="hidden" id="celica" name="celica" value="({{vrstica}}, {{stolpec}})">
                                                </form>
                                            </td>
                                        %end
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
                    <p class="navodilo" style="font-weight: bold;">Za vnos števila v polje na levi izberite polje, <br> 
                        vanj vnesite izbrano število in pritisnite enter. <br><br>
                        Ko se polje obarva, je vaš vnos zabeležen. <br>
                        Kasneje ga lahko spremenite. <br><br>
                        Če želite vnešeno število izbrisati, morate v polje <br>
                        vnesti število 0. <br><br>
                    </p>
                    <br>
                    <div class="navodilo" style="padding-bottom: 2px; text-align: left">
                        Preverite, ali ste sudoku rešili pravilno:
                        <p style="font-size:smaller; font-style:italic; padding-bottom:10px; padding-top:2px; text-align: left">
                            Tu najdete tudi rešitev in možnost igranja nove igre.
                        </p>
                        <form action="/preveri_zmaga/{{id_igre}}/" method="post">
                            <button class="gumb" style="padding-top: 7px" type="submit">preveri</button>
                        </form>
                    
                    </div>
                   
                    <br>
                    <p class="navodilo" style="text-align: left"> Počistite polje in začnite od začetka: <br><br>
                     <form action="/pocisti_igro/{{id_igre}}/" method="post">
                        <button class="gumb" style="padding-top: 7px" type="submit">počisti</button>
                    </form>  
                    </p>
            </tr>
            </table>
          </td> 
        </tr>
    </table>


    </body>
</html>