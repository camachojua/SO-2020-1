
# POST

El proceso POST (**power-on self-test**) es una rutina ejecutada inmediatamente al inicio del sistema operativo cuando se enciende el dispositivo. Sus funciones son:

Verificar registros de la CPU
Verificar la integridad del código BIOS
Verificar algunos componentes básicos como DMA, temporizador, controlador de interrupción
encontrar, dimensionar y verificar la memoria principal del sistema
Inicializar el BIOS
Identificar, organizar y seleccionar qué dispositivos están disponibles para el arranque

Esta rutina consiste en los siguientes pasos:

Test general del es estado del  **microprocesador**  y del reloj del sistema
Test al controlador del  **teclado**  para verificar que esta disponible
Arranca la actividad del  **chipset** para llevar a cabo los test de los dispositivos del equipo.
Se comprueba y activa el controlador de la  **tarjeta gráfica**  para mostrar posteriormente la información por la pantalla.
Test de estado del **chip**  **CMOS (BIOS).**
Test de la  **memoria DMA** ( de acceso directo).
Test a la  **parte baja**  de la memoria **RAM**  ( los primeros 64 KB).  
Test a la  **memoria** de la  **tarjeta gráfica .**
test a la  **pila** de la placa base.
Test de  **capacidad de memoria**  del sistema.
Test del estado de la  **memoria RAM**.
Test de la  **memoria extendida**.
Se  **analiza las unidades de disco externas** ( si existe).
Se  **detecta los puertos serie y paralelo.**
Se  **inicializan los discos duros**  (si existen).
