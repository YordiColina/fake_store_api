A sample command-line application with an entrypoint in `bin/`, library code
in `lib/`, and example unit test in `test/`.

# fake_store_api



## Descripción
Esta es una aplicación dart destinada al consumo de la api fake store  y a la demostración de manejo de errores
.

## Estructura del Proyecto
- **models**: Contiene  sus respectivos modelos.
- **Api**: Contiene nuestras clases que implementan la api (fakeStore), con su respectiva carpeta de errors.

## Funcionalidades Principales
- Visualizar en consola información relacionada a los productos de la api.
- Visualizar en consola las categorias existentes.
  -visualizaren consola el carrito de compras.


## Consideraciones
- la aplicación usa Either para el manejo de datos (right) y errores(left).
- la aplicación contiene un api error handler que controla las respuestas de la api
  los errores los maneja en una función handle que identifica el error y responde con un mensaje acorde al error
  y la data obtenida la retorna correctamente
- los modelos de la aplicación son diseñados a partir de los campos esperados por cada endpoint y manejan la inmutabilidad
  es decir que sus propiedades son de tipo final, el constructor es una constante, no permite funciones de tipo
  copyWith,se uso json serialization también
- para el consumo de la APi se uso la libreria chopper y se establecio el tipo de retorno de tipo either y el objeto que se desee (product,categories,cart)
- la aplicación usa la librería 'Logger' para hacer logs mas destacados en la consola y evitar el uso de prints.

