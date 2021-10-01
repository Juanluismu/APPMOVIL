#Autor: Juan Muñoz
#Idioma: Español
@MVP-AppMovil @Android @Iphone
Feature: Login
  Como Cliente
  Quiero ingresar al AppMovil con credenciales de Usuario & Password
  Para asi poder utilizar el AppMovil

  Rule: El cliente debe ser mayor de edad o igual a 18 años
  #Uso de background
  Background:
    Given Yo estoy en la pagina Login del AppMovil
  #El primer escenario (+) positivo
  @SRT-2021-OptimizacionAppMovil
  Scenario: Cuando realizo el Login con credenciales de Usuario & Password Validos
    #Given Yo estoy en la pagina Login del AppMovil
    When Yo registro la cuenta de email textbox con el valor "lmunozrd@gmail.com"
    And Yo registro el Password textbox con el valor "123456"
    And Yo doy click en el boton Login
    Then Yo deberia estar en la pagina principal de nombre Home Page del AppMovil
    And El titulo de la pagina de Home Page es "Bienvenida"
    But El boton Login no deberia estar presente en la pagina Home Page del AppMovil
      """
      nombre: Juan
      MontoDisponibleCuenta: 1000
      LineDisponible: 1000
      """
 #El segundo escenario (-) negativo
 Scenario: Cuando realizo el Login con credenciales no Validos
    #Given Yo estoy en la pagina Login del AppMovil
    When Yo registro la cuenta de email textbox con el valor "emailNoValido@gmail.com"
    And Yo registro el Password textbox con el valor "ClaveErrada"
    And Yo doy click en el boton Login
    Then Yo no puedo acceder a la pagina Home Page del AppMovil
    And El mensaje deberia mostrar: Usuario y Password no validos
 #Escenario outline
 Scenario Outline: Cuando realizo el login con credenciales de Usuario & Password Validos
   When Yo registro la cuenta de email textbox con el valor <email>
   And Yo registro el Password textbox con el valor <password>
   And Yo doy click en el boton Login
   Then Yo deberia estar en la pagina principal de nombre Home Page del AppMovil
   And El titulo de la pagina del Home Page es "Bienvenida"
   But El boton login no deberia estar presente en la pagina Home Page del AppMovil
   Examples:
   |email               |Password   |
   |lmunozrd@gmail.Como |123456     |
