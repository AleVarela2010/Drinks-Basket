# Drinks-Basket
## Descripción del Proyecto
El proyecto apunta a una compañia distribuidora de licores ubicada en el Reino Unido. Actualmente nos encontramos con un dataset bastante desordenado, con un control incorrecto de inventario y sin objetivos claros de negocio.

![Logo de la empresa](https://github.com/AleVarela2010/Drinks-Basket/blob/main/images/Portada.jpg)

## Descripción del Problema
La empresa enfrenta desafíos en la gestión de inventario de licores, que incluyen problemas de exceso de stock y stockouts (falta de stock) de ciertas bebidas alcohólicas. Estos desafíos son críticos porque afectan directamente la capacidad de la empresa para satisfacer la demanda del mercado de manera eficiente y económica. 
El Reino Unido tiene un mercado competitivo para las bebidas alcohólicas, y una gestión ineficaz del inventario puede llevar a pérdidas significativas de oportunidades de ventas y un aumento en los costos de almacenamiento y obsolescencia de productos. Se busca resolver este problema ya que impacta directamente en la rentabilidad (el exceso de stock genera mayores costos de almacenamiento y riesgo de pérdida de productos), en la capacidad de respuesta del mercado (los stockouts son ventas pérdidas y dañan la reputación de la empresa) y en las decisiones estratégicas (no se puede tomar decisiones estratégicas sobre compras y estrategias de expansión, no se tiene control sobre los best seller y aquellos productos que no rinden). 
La solución es principalmente mejorar la gestión de inventario pero buscando responder preguntas de demanda, mejorando la estrategia de compra y venta de productos para lograr la expansión de la empresa. 

## Objetivos principales del proyecto
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
Se comenzo con la recoleccion de los datos, [DataBase](https://www.kaggle.com/datasets/bhanupratapbiswas/inventory-analysis-case-study/data) esta base cuenta con las siguientes tablas todas relacionada al inventario de una licoreria:

- 2017PurchasePricesDec.csv (Tabla de precios de mercaderia)
- BegInvFINAL12312016.csv (Inventario al comienzo del ano)
- EndInvFINAL12312016.csv (Inventario al finalizar el ano)
- InvoicePurchases12312016.csv (Facturas de compras)
- PurchasesFINAL12312016.csv (Tabla de compras, es decir reposicion de mercaderia)
- SalesFINAL12312016.csv (Tabla con informacion de las ventas)

Se revisaron las tablas para familiarizarse con los datos y asi dar paso a la creacion del DER. Una vez hecha las relaciones y vimos que datos iban a ser necesarios se paso a la limpieza de las tablas.
Para realizar los procesos de ETL se utilizó Python con librerías de Numpy, Pandas, Matplotlib y Seaborn, entre otras.
Se hizo la limpieza de la base de datos y asi tambien la creacion de nuevas tablas utiles para el analisis posterior:

- Suppliers
- Sales
- SalesDetails
- Inventory
- Purchases
- InvoicePurchases
- SaleInventory

Se llego al siguiente diagrama de Entidad/Relacion:

![Diagrama Entidad/Relacion](https://github.com/AleVarela2010/Drinks-Basket/blob/main/images/Diagrama%20entidad%20relacion.png)

![Diagrama Relacional](https://github.com/AleVarela2010/Drinks-Basket/raw/main/images/DiagramaRelacional.jpeg)

Toda la limpieza fue realizada en VSC con Python (pandas, numpy, SQL Alchemy) antes de cargar los datos en la nueva Base de datosen SQL.

## Primeros insights / Analisis Exploratorio de Datos (EDA)

 
![Producto mas vendido](https://github.com/AleVarela2010/Drinks-Basket/blob/main/images/Producto%20mas%20vendido.jpg)

Observamos que tenemos un producto muy popular seguido de otros dos. En este punto es importante analizar que el inventario este en proporcion a la demanda
de estos productos

![DIstribucion inventario](https://github.com/AleVarela2010/Drinks-Basket/blob/main/images/StorageTop10.jpg)

Con un inventario significativamente mas alto, tenemos una ciudad que podemos sugerir cumpla un rol como un centro de distribucion principal o una
ubicacion en una region con alta demanda. Las variaciones que vemos entre las ciudades en terminos de inventario puede sugerir diferencia en el mercado.



## Conexion SQLServer 

Una vez realizada la limpieza con python se crearon las tablas y objetos para su importacion en SQL y asi crear el flujo que importe los datos a la nueva base de datos.

![SQL Ejemplo](https://github.com/AleVarela2010/Drinks-Basket/blob/main/images/Tabla%20SQL.jpg)




