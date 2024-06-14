# widgets_components

Es una app que te muestra 3 widgets personalizables.

1. Una Barra de Progreso Circular
2. Una Tarjeta de Presentación
3. Serie de Preguntas o Quiz

# Explicación de uso de los Widgets


## Widget de la barra de Progreso

Es una barra de progreso circular que se va a rellando,
tiene una animación de desplazamiento la barra cuando se va 
rellenando. Adicionalmente tiene el porcentaje del progreso y 
un texto descriptivo.
Se va rellando automaticamente.

~~~
const InteractiveProgress(
   progress: 0,
   backgroundColorProgress: Color.fromARGB(255, 176, 183, 194),
   valueColor: Color(0xFF295597),
   boxColor: Color.fromARGB(255, 10, 139, 179),
   textBoxColor: Color.fromARGB(214, 255, 255, 255),
   title: 'Cargando...',
   sizeInteractiveProgress: 200,
)
~~~
Descripción de los parámetros del Widget **InteractiveProgress**

| Nombre del Parámetro | Tipo de Dato | Descripción |
|--- |--- |--- |
| progress | double  | Es el valor que determina el progreso que lleva la barra circular |
| backgroundColorProgress| Color | Es el color de la barra de progreso sin rellenar |
| valueColor| Color | Es el color del relleno del progreso de la barra |
| boxColor| Color | Es el color del Contenedor de la barra |
| textBoxColor| Color | Es el color del texto que indica el porcentaje del progreso de la barra |
| title| String  | Es el texto descriptivo que se le indica para que el usuario sepa de se esta realizando una carga |
| sizeInteractiveProgress | double   | Es el tamaño que se le define a la barra de progreso, al texto descriptivo y al contenedor, tanto su alto y ancho estan incluidos. **Se recomienda usar valores entre 150  a 300** |

## Widget de la Tarjeta

Es una tarjeta de presentación que contiene:

1. Una Imagen la cual puedes tocar para verla a casi 
pantalla completa con una animación de traslación.
2. El titulo de la tarjeta.
3. Una descripción.
4. Un boton para ver la imagen a pantalla completa

~~~
EducationalCard(
   urlImage: "https://picsum.photos/200/300",
   title: 'Titulo de la tarjeta',
   description: 'Un texto descriptivo',
   tag: 'tag-1',
   colorCard: Color(0xFF2C5EB9),
   colorText: Colors.white,
   colorButton: Colors.white,
   colorTextButton: Colors.black,
   widthCard: 250,
)
~~~

Descripción de los parámetros del Widget **EducationalCard**


| Nombre del Parámetro | Tipo de Dato | Descripción |
|--- |--- |--- |
| urlImage | String   | Se debe pasar la url de una imagen que este en la web. |
| title | String  | Es el titulo de la tarjeta |
| description | String  | Es la descripción de la tarjeta |
| tag | String  | Es un id que sirve para realizar la animación con la imagen de la tarjeta. **Cada Tarjeta debe de tener un id UNICO, si hay dos tarjetas con el mismo id entonces NO funcionara la animación de esas tarjetas**|
| colorCard | Color  | Es el color de fondo de la tarjeta |
| colorText | Color  | Es el color de texto del titulo y de la descripción de la tarjeta |
| colorButton | Color  | Es el color de fondo del boton que contiene la tarjeta |
| colorTextButton | Color  | Es el color de texto del boton que contiene la tarjeta |
| widthCard | double   | Es el ancho de la tarjeta. |

## Widget de la Serie de Preguntas o Quiz

Te llevara a una nueva pantalla que contiene una serie de preguntas.

- Hay Preguntas de **Multiples opciones** o de **Verdadero o falso**.
- La opcion se podran marcar, se vera con un color diferente la opcion marcada.
- Se debe validar a traves de un boton la opcion marcada
- Si la respuesta es correcta se te indicara con un mensaje y luego se pasara a la siguiente pregunta
- Si la respuesta es incorrecta se te indicara con un mensaje y no pasaras a la siguiente pregunta, hasta que respondas correctamente
- Se te indicara cuando hayas culminado el Quiz con un mensaje


~~~
CustomQuiz(
   backgroundColor: Colors.black,
   textColor: Colors.white,
   borderColor: Colors.deepPurpleAccent,
   selectedColor: Colors.green,
   listCustomQuestions:  <CustomQuestion>[
      CustomQuestion(
         name: '¿Cuanto es 2 + 2?', 
         options: [
         Options(value: '2', isCorrect: false, isCheked: false),
         Options(value: '1', isCorrect: false, isCheked: false),
         Options(value: '4', isCorrect: true, isCheked: false),
         Options(value: '0', isCorrect: false, isCheked: false),
         ]
      ),
      CustomQuestion(
         name: '¿De que color es el cielo?', 
         options: [
         Options(value: 'Negro', isCorrect: false, isCheked: false),
         Options(value: 'Verde', isCorrect: false, isCheked: false),
         Options(value: 'Rojo', isCorrect: false, isCheked: false),
         Options(value: 'Azul', isCorrect: true, isCheked: false),
         ]
      ),
      CustomQuestion(
         name: '¿En la Antartida hay nieve?', 
         options: [
         Options(value: 'Verdadero', isCorrect: true, isCheked: false),                 
         Options(value: 'Falso', isCorrect: false, isCheked: false),
         ]
      ),
      CustomQuestion(
         name: '¿Cuantos estomagos tiene una vaca?', 
         options: [
         Options(value: '4', isCorrect: true, isCheked: false),
         Options(value: '1', isCorrect: false, isCheked: false),
         Options(value: '3', isCorrect: false, isCheked: false),
         Options(value: '2', isCorrect: false, isCheked: false),
         ]
      ),
   ],
)
~~~

Descripción de los parámetros del Widget **CustomQuiz**


| Nombre del Parámetro | Tipo de Dato | Descripción |
|--- |--- |--- |
| backgroundColor | Color   | Es el color de fondo de las pantallas de cada pregunta, tambien el color de fondo de las opciones de la pregunta, botones y el texto que cotiene la pregunta. |
| textColor | Color | Es el color del texto de las opciones de la pregunta, botones y el color del texto que cotiene la pregunta. |
| borderColor | Color | Es el color de los bordes de las opciones de la pregunta, botones y el color de los bordes de la pregunta. |
| selectedColor | Color | Es el color de fondo de la opcion de la pregunta cuando este marcada. |
| listCustomQuestions | ```List<CustomQuestion>``` | Es la lista de preguntas que se le pasa al Widget |


### Detallando la propiedad **listCustomQuestions**

Es una lista del tipo de dato ```CustomQuestion``` el
cual tiene las siguientes propiedades que se
detallaran a continuación

```
CustomQuestion(
   name: '¿Cuantos estomagos tiene una vaca?', 
   options: [
   Options(value: '4', isCorrect: true, isCheked: false),
   Options(value: '1', isCorrect: false, isCheked: false),
   Options(value: '3', isCorrect: false, isCheked: false),
   Options(value: '2', isCorrect: false, isCheked: false),
   ]
)
```

Descripción de los parámetros del Tipo de Dato **InteractiveProgress**


| Nombre del Parámetro | Tipo de Dato | Descripción |
|--- |--- |--- |
| name | String | Es el nombre de la pregunta o la pregunta como tal. |
| options | ```List<Options>``` | Es la lista de Opciones que se definen para responder la pregunta |

### Detallando la propiedad **options**

Es una lista del tipo de dato ```Options```
el cual tiene las siguientes propiedades que se detallaran a continuación

```
Options(
   value: '2', 
   isCorrect: false, 
   isCheked: false
),
```
Descripción de los parámetros del Tipo de Dato **Options**


| Nombre del Parámetro | Tipo de Dato | Descripción |
|--- |--- |--- |
| value | String | Es la respuesta a la pregunta la cual puede ser correcta o no. |
| isCorrect | bool | Puedes indicar si esta opcion es la correcta. **Solo debe haber una Opcion con este valor en true** |
| isCheked | bool | Es para saber si esta opcion esta marcada. **Todas las Opciones deben tener este valor en false** |