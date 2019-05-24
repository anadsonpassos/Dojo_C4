*** Settings ***
Library     SeleniumLibrary
Library     BuiltIn
Library     AutoItLibrary

*** Variables ***
${ProdutoNotebook}      Notebook Dell
${MeuUsuario}       O seu carrinho ainda está vazio.
${MsgProdutoCarrinho}       Importante: Ao adicionar um produto no carrinho, você não garante a reserva dele
${MsgNavegacao}        Tem muito o que ver por aqui é só escolher por onde começar.
${MsgProdutoNaoCarrinho}        O seu carrinho ainda está vazio.vg

*** Keywords ***
###CENARIO 1: Colocar no carrinho de compras um notebook da marca DELL, que tenha a opção do Click e retire. (Confira!)
Dado que estou logado no site do Carrefour na tela de Carrinho que esteja vazio
    Click Element       //*[@class="js-mini-cart-link miniCart"]
    Sleep       5s
    Set Focus To Element        //*[@id="cartContent"]
    Element Text Should Be    //*[@id="cartContent"]/strong     ${MsgNavegacao}
    Set Suite Variable      ${MsgNavegacao}
    Sleep       5s
    Set Focus To Element    //*[@id="cartContent"]/p
    Element Should Contain      //*[@id="cartContent"]/p       ${MeuUsuario}
    Sleep       4s

Quando eu pesquisar pelo produto Notebook da marca Dell 
    Input Text      //*[@id="js-site-search-input"]     ${ProdutoNotebook}
    Sleep       4s
    Click Button        //*[@id="searchForm"]/button
    Sleep       7s

E inserir no meu carrinho de compras o produto que tenha a opcao do Click e retire
    Click Image       //form[@class="addToCartForm5490286 srp-dad-buy"]//*[@class="img-responsive center-block"]
    Sleep   5s
    Page Should Contain Image       //div[@class="block-list-stamp-product"]//*[@class="lazyOwl img-responsive"]
    Capture Element Screenshot      //div[@class="block-list-stamp-product"]//*[@class="lazyOwl img-responsive"]
    Click Button        //*[@id="buyProductButtonBottom"]
    Sleep       6s
    Click Button        //*[@id="js-services"]/div[4]/button[2]
    Sleep       7s

Entao o sistema devera exibir o produto escolhido no meu carrinho de compras
    Element Should Contain      //*[@id="cartContent"]/div[3]/div/div      ${MsgProdutoCarrinho}

###CENARIO 2: Excluir do carrinho o produto informado. (Confira!)
Dado que eu tenha um produto no meu carrinho
    Page Should Contain Element     //*[@id="cartContent"]/div[5]/div[1]/ul/li/div[1]/div/div[2]
    Sleep       3s

Quando eu clicar no link para excluir o produto do meu carrinho
    Click Link      //*[@id="cartContent"]/div[5]/div[1]/ul/li/div[1]/div/div[2]/div[6]/a[1]
    Sleep       8s

E realizar a confirmacao da exclusao
    Set Focus To Element        //div[@class="modal fade in"]//*[@id="removeEntry_0"]
    Click Element        //div[@class="modal fade in"]//*[@id="removeEntry_0"]
    Sleep       4s

Entao o sistema devera excluir o produto do meu carrinho 
    Element Should Contain      //*[@id="cartContent"]/p        ${MsgProdutoNaoCarrinho}
    Sleep       4s

E exibir a tela Carrinho com a mensagem intuitiva a compra
    Set Focus To Element        //*[@id="cartContent"]
    Element Text Should Be    //*[@id="cartContent"]/strong     ${MsgNavegacao}
    