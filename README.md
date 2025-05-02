# Tecnorise - Analista de QA

## Desafio:
- A ideia desse desafio é simples, queremos que você crie uma automação que testes todos os pontos do CRUD do projeto (Listar, Criar, Editar e Deletar). Você pode utilizar quaisquer libs/frameworks que deseja. No fim, gostariamos que você escreva um relatório apontando o fluxo, o que deu certo, errado e melhorias potenciais.
- Ao finalizar, o candidato deve criar um repositório publico no github e disponibilizar o link no e-mail (guilherme.veiga@tecnorise.com.br e cc para isabella.gonsalves@tecnorise.com) com o assunto "TECNORISE - ANALISTA DE QA (seu nome aqui)". No repositório, o relatório deve estar no arquivo "README.md" (informação do relatório nele, ou um link com o relatório). Necessário também ter instruções de como rodar o teste automatizado.
- Prazo de entrega: 05/05/2025 (Segunda-feira)

# Teste Automatizado com Robot Framework

## Análise dos Testes Realizados

Os testes automatizados foram realizados utilizando o Robot Framework com a biblioteca SeleniumLibrary para interagir com a interface do usuário. A seguir, apresentamos uma análise dos resultados obtidos:

### Testes Realizados
1. **Abrir Página Inicial**
   - Verifica se a página inicial é carregada corretamente.
   - **Resultado:** Passou com sucesso.

2. **Adicionar Produto**
   - Testa a funcionalidade de adicionar um novo produto com nome, preço e descrição.
   - **Resultado:** Passou com sucesso.

3. **Editar Produto**
   - Verifica se é possível editar as informações de um produto existente.
   - **Resultado:** Passou com sucesso.

4. **Excluir Produto**
   - Testa a funcionalidade de exclusão de um produto.
   - **Resultado:** Passou com sucesso.

5. **Testar Campo de Preço com Número Negativo**
   - Verifica se o sistema impede o salvamento de um produto com preço negativo.
   - **Resultado:** Passou com sucesso.

6. **Testar Campo de Preço com Valor Muito Alto**
   - Testa se o sistema aceita valores altos no campo de preço e documenta o comportamento inadequado.
   - **Resultado:** O sistema aceitou valores muito altos, o que não é recomendado.

7. **Testar Descrição Muito Longa**
   - Verifica se uma descrição muito longa é exibida corretamente no card do produto e documenta o comportamento inadequado.
   - **Resultado:** O texto da descrição ultrapassa o background do card, o que não é visualmente adequado.

8. **Testar Descrição Muito Longa com Palavras Separadas**
   - Verifica se uma descrição muito longa com palavras separadas é exibida corretamente no card do produto.
   - **Resultado:** Passou com sucesso.

9. **Testar Exclusão sem Confirmação**
   - Verifica se ações destrutivas, como exclusão, são realizadas sem confirmação e documenta o comportamento inadequado.
   - **Resultado:** O sistema permitiu a exclusão sem confirmação, o que não é recomendado.

### Observações
- Todos os testes passaram com sucesso, exceto os cenários que documentam comportamentos inadequados.
- O sistema apresenta validações adequadas para campos como preço, garantindo que valores inválidos não sejam aceitos.
- A interface do usuário foi testada para cenários comuns, como adicionar, editar e excluir produtos, além de validações específicas.

### Melhorias Sugeridas
1. **Confirmação para Ações Destrutivas**
   - Implementar um modal de confirmação para ações como exclusão de produtos, aumentando a segurança.

2. **Limite para Campo de Preço**
   - Adicionar um limite máximo para o campo de preço para evitar valores excessivamente altos.

3. **Ajuste de Layout para Descrições Longas**
   - Garantir que descrições longas sejam truncadas ou exibidas de forma adequada no card do produto.

### Conclusão
Os testes automatizados demonstraram que o sistema está funcional e atende aos requisitos básicos. As melhorias sugeridas podem ser implementadas para aumentar a robustez e a usabilidade do sistema.
