# Practice2-LYPDLP
# Sistema de gestión de ventas de vehículos - Prolog

## Vista de la práctica 

Este proyecto es un **sistema de manejo de inventario vehicular** desarrollado en Prolog, creado como parte de la práctica 2 del curso de Lenguajes y Paradigmas de la Programación de la Universidad EAFIT. 

El sistema le permite al usuario:
- Registrar y manejar un catalogo de vehículos.
- Filtrar vehiculos por marca, tipo y presupuesto.
- Generar reporte de inventario según presupuesto.
- Presentar consultas avanzadas utilizando 'findall/3' y 'bagof/3'.
  
---

## Funcionalidades 

### Catálogo vehicular 
Definido usando: 
''' prolog
vehicle(Brand, Reference, Type, Price, Year).
Al menos 10 vehiculos estan declarados a través de multiples tipos y marcas. 

### Consultas y filtros 
meet_budget(Reference, BudgetMax): Revisa si el precio de un vehículo está dentro del presupuesto.
list_by_brand(Brand, List): Obtiene una lista de referencias por marca. 

### Generar reporte 
generate_report(Type, Budget, FinalVehicles, TotalValue):
- Filtra los vehículos de un tipo específico (Type) cuyo precio no supere al Budget (presupuesto).
- Ordenar por precio de manera ascendente.
- Asegura que el valor total de vehiculos no supere a $1,000,000.
- Retorna la lista final y el valor total del inventario.

### Test Cases 
- Caso 1:
test_case1(Result).
% Retorna los Toyota SUVs debajo de $30,000.

- Caso 2:
test_case2(Grouped).
% Agrupa los Ford por tipo y año usando bagof/3.

- Caso 3:
test_case3(Result, Total).
% Filtra los Sedan por debajo de $500.000 por unidad,
% luego se ajusta para que el total no supere $1,000,000.

## Correr el código 

- Instalar SWI-Prolog (https://www.swi-prolog.org/Download.html)
- Cargar el archivo swipl vehicle_inventory.pl
- Correr los casos te testeo:
?- test_case1(R).
?- test_case2(G).
?- test_case3(V, T).

## Equipo 
- Estudiante 1: Emmanuel Castaño Sepúlveda.
- Estudiante 2: Jerónimo Contreras. 

## Video

  
