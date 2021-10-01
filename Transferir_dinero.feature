#Autor: Juan Muñoz
#Idioma: Español
@MVP-AppMovil @Android @Iphone
Feature: Transferir Dinero
  Como CLiente del Banco IBK
  Quiero Transferir Dinero entre mis cuentas
  Para Financiar mi tarjeta de credito
  #Uso de Background
  Background:
    Given El cliente esta en la pagina Transferir
  #primer escenario (+) positivo
  @SRT-2021-OptimizacionAppMovil
  Scenario: Cuando el Cliente tiene disponible Dinero
    #Given El cliente esta en la pagina Transferir
    And El Cliente tiene cuenta bancaria con tipo de moneda en soles
    And El cliente tiene Dinero disponible en cuenta bancaria
    When Cuando el cliente solicita transferir dinero entre sus cuentas
    Then El dinero es transferido a la segunda cuenta bancaria
  #El segundo escenario (-) negativo
  Scenario: Cuando el cliente no tiene dinero disponible
    #Given El cliente esta en la pagina Transferir
    And El Cliente tiene cuenta bancaria con tipo de moneda en soles
    And El cliente no tiene Dinero disponible en cuenta bancaria
    When El cliente solicita transferir dinero entre sus cuentas
    Then El cliente no puede transferir a la segunda cuenta bancaria
    And El mensaje deberia mostrar: No cuenta con monto disponible para realizar dicha operacion
  #Escenario outline
  Scenario Outline: Transferir dinero
    Given EL cliente realiza una tranferencia <dineroDispopniblePrimeraCuenta>
    And El cliente tiene cuenta bancaria con tipo <moneda>
    When EL cliente solicita transferir dinero <dineroTransferido>
    Then El dinero es transferido a la segunda cuenta bancaria <mensaje>
    Examples:
    |dineroDispopniblePrimeraCuenta    |moneda    |dineroTransferido |mensaje                           |
    |1000.00                           |soles     |100.00            |Trnsferencia realizada con exito  |
