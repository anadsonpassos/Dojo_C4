Documentation       Dojo Automação Web com "Robot Framework"

*** Settings ***
Resource        ../Resources/ResourceCommonCarrefour.robot
Resource        ../Resources/FuncDojoC4.robot
Suite Setup     Open Browser To Login valid
#Suite Teardown      Close Browser 

*** Test Cases ***
CENARIO 1: Colocar no carrinho de compras um notebook da marca DELL, que tenha a opção do Click e retire. (Confira!) 
    Dado que estou logado no site do Carrefour na tela de Carrinho que esteja vazio
    Quando eu pesquisar pelo produto Notebook da marca Dell
    E inserir no meu carrinho de compras o produto que tenha a opcao do Click e retire
    Entao o sistema devera exibir o produto escolhido no meu carrinho de compras

CENARIO 2: Excluir do carrinho o produto informado. (Confira!)
    Dado que eu tenha um produto no meu carrinho
    Quando eu clicar no link para excluir o produto do meu carrinho
    E realizar a confirmacao da exclusao
    Entao o sistema devera excluir o produto do meu carrinho 
    E exibir a tela Carrinho com a mensagem intuitiva a compra