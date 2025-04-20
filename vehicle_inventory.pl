
% 1. Definición del predicado vehiculo/5: marca, referencia, tipo, precio (COP), año
vehicle(toyota, rav4, suv, 28000, 2022).
vehicle(toyota, corolla, sedan, 22000, 2023).
vehicle(toyota, tacoma, pickup, 35000, 2021).
vehicle(ford, mustang, sport, 45000, 2023).
vehicle(ford, explorer, suv, 32000, 2022).
vehicle(ford, f150, pickup, 40000, 2023).
vehicle(bmw, x5, suv, 60000, 2021).
vehicle(bmw, serie3, sedan, 42000, 2022).
vehicle(bmw, z4, sport, 52000, 2023).
vehicle(chevrolet, camaro, sport, 38000, 2022).
vehicle(chevrolet, silverado, pickup, 42000, 2023).
vehicle(honda, civic, sedan, 24000, 2022).

% 2. Predicado para verificar si un vehículo cumple con un presupuesto máximo
meet_budget(Reference, BudgetMax) :-  
    vehicle(_, Reference, _, Price, _),  
    Price =< BudgetMax.

% Listar vehículos por marca usando findall/3
list_by_brand(Brand, References) :-
    findall(Ref, vehicle(Brand, Ref, _, _, _), References).

% 3. Generar reporte 
generate_report(Type, Budget, FinalVehicles, TotalValue) :-
    % Paso 1: Filtrar vehículos por tipo y presupuesto por unidad
    findall((Ref, Price),
        (vehicle(_, Ref, Type, Price, _), Price =< Budget),
        Vehicles),
    % Paso 2: Ordenar por precio ascendente
    sort(2, @=<, Vehicles, Sorted),
    % Paso 3: Ajustar para no superar $1,000,000
    adjust_inventory_recursive(Sorted, 0, FinalVehicles),
    % Paso 4: Calcular el valor total de los vehículos seleccionados
    sum_prices(FinalVehicles, TotalValue).


%funciones auxiliares 
sum_prices([], 0).
sum_prices([(_, Price)|T], Total) :-
    sum_prices(T, SubTotal),
    Total is SubTotal + Price.

adjust_inventory_recursive([], _, []).
adjust_inventory_recursive([(Ref, Price)|T], Acc, [(Ref, Price)|Result]) :-
    NewAcc is Acc + Price,
    NewAcc =< 1000000,
    adjust_inventory_recursive(T, NewAcc, Result).
adjust_inventory_recursive(_, Acc, []) :-
    Acc >= 1000000.

% 4. Casos de prueba 

% Caso 1: Listar SUV Toyota por debajo de $30,000
test_case1(Result) :-
    findall(Ref, (vehicle(toyota, Ref, suv, Price, _), Price < 30000), Result).

% Caso 2: Mostrar vehículos Ford agrupados por tipo y año usando bagof/3
test_case2(Grouped) :-
    bagof((Type, Year, Ref), vehicle(ford, Ref, Type, _, Year), Grouped).

% Caso 3: Valor total de inventario tipo Sedan sin exceder $500,000
test_case3(Result, Total) :-
    findall((Ref, Price),
        (vehicle(_, Ref, sedan, Price, _), Price =< 500000),
        Vehicles),
    sort(2, @=<, Vehicles, Sorted),
    adjust_inventory_recursive(Sorted, 0, Result),
    sum_prices(Result, Total).
    
    
    
    
    
    
    