# Drinks-Basket
## Descripción del Proyecto
El proyecto apunta a una compañia distribuidora de licores ubicada en el Reino Unido. Actualmente nos encontramos con un dataset bastante desordenado, con un control incorrecto de inventario y sin objetivos claros de negocio.

![Logo de la empresa](https://github.com/AleVarela2010/Drinks-Basket/blob/main/images/Portada.jpg)

## Descripción del Problema
La empresa enfrenta desafíos en la gestión de inventario de licores, que incluyen problemas de exceso de stock y stockouts (falta de stock) de ciertas bebidas alcohólicas. Estos desafíos son críticos porque afectan directamente la capacidad de la empresa para satisfacer la demanda del mercado de manera eficiente y económica. 
El Reino Unido tiene un mercado competitivo para las bebidas alcohólicas, y una gestión ineficaz del inventario puede llevar a pérdidas significativas de oportunidades de ventas y un aumento en los costos de almacenamiento y obsolescencia de productos. Se busca resolver este problema ya que impacta directamente en la rentabilidad (el exceso de stock genera mayores costos de almacenamiento y riesgo de pérdida de productos), en la capacidad de respuesta del mercado (los stockouts son ventas pérdidas y dañan la reputación de la empresa) y en las decisiones estratégicas (no se puede tomar decisiones estratégicas sobre compras y estrategias de expansión, no se tiene control sobre los best seller y aquellos productos que no rinden). 
La solución es principalmente mejorar la gestión de inventario pero buscando responder preguntas de demanda, mejorando la estrategia de compra y venta de productos para lograr la expansión de la empresa. 

## Objetivos principal del proyecto
### Optimización de la Gestión de Inventario: 
Utilizar técnicas avanzadas de análisis para profundizar en los datos históricos de compra y venta. El objetivo es identificar patrones de demanda y áreas de ineficiencia que pueden ser mejoradas, optimizando así la gestión del inventario en Drinks Basket.

### Preparación para la Expansión Internacional: 
El proyecto irá más allá de la mejora operativa interna, proporcionando análisis cruciales para explorar y preparar la expansión del negocio fuera del Reino Unido. Esto incluye:
Evaluar mercados potenciales.
Analizar la viabilidad de entrar en nuevos territorios.
Entender las preferencias y tendencias de consumo en diferentes regiones.

### Soporte para Decisiones Estratégicas: 
El análisis de datos será fundamental para apoyar decisiones estratégicas, asegurando que la expansión se base en una comprensión sólida de las oportunidades de mercado y los riesgos asociados.

### Valor Agregado del Proyecto
Enfoque Integral y Específico: 
El proyecto está diseñado específicamente para la industria de las bebidas alcohólicas, combinando la optimización de la gestión de inventario con una estrategia de expansión claramente definida.

Decisiones Basadas en Datos: 
diferencia de otras iniciativas, este proyecto utiliza un análisis profundo de datos para informar cada decisión. Cada paso hacia la expansión está medido y basado en evidencia real de demanda y rendimiento.

Adaptación y Competitividad: 
Este enfoque permitirá a Drinks Basket no solo mantener su competitividad en el Reino Unido, sino también adaptarse de manera eficiente a nuevos mercados. Esto optimiza las oportunidades de crecimiento y minimiza los riesgos financieros y operativos.

## Implementación del origen de datos
Para realizar los procesos de ETL se utilizó Python con librerías de Numpy, Pandas, Matplotlib y Seaborn, entre otras.
Se realizo la limpieza de la base de datos y la creacion de nuevas tablas. Se logro identificar cuales eran las relaciones de las mismas para crear el diagrama Entidad/Relacion y posteriorme el esquema relacional.

![Diagrama Entidad/Relacion](https://github.com/AleVarela2010/Drinks-Basket/blob/main/images/Diagrama%20entidad%20relacion.png)

![Diagrama Relacional](https://github.com/AleVarela2010/Drinks-Basket/raw/main/images/DiagramaRelacional.jpeg)


## Conexion SQLServer 

Una vez ya realizada la limpieza en python procedimos se creoaron las tablas y objetos para la importacion en SQL y asi poder crear el flujo que importe los datos a la base de datos




