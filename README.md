# Trabalho Prático: Conversão RGB ↔ HSL (Padrão Windows)

Este projeto foi desenvolvido como parte da disciplina de **Processamento Digital de Imagens**. O objetivo principal é implementar a conversão matemática entre os modelos de cores **RGB** (Hardware-centric) e **HSL** (Human-centric), replicando o comportamento do seletor de cores do **Microsoft Paint**.

---

##  Estrutura do Trabalho
O código fonte e os arquivos de interface estão localizados na pasta:
* `uprincipal.pas`: Contém os algoritmos de conversão e lógica dos botões.
* `uprincipal.lfm`: Definição visual do formulário.

##  Funcionalidades Implementadas

### 1. Conversão RGB para HSL
Transforma os valores de **Red, Green e Blue** (0-255) nos componentes:
* **Hue (Matiz):** Escala de 0 a 239.
* **Sat (Saturação):** Escala de 0 a 240.
* **Lum (Luminosidade):** Escala de 0 a 240.

### 2. Conversão HSL para RGB
Realiza o processo inverso, permitindo que o usuário informe parâmetros de percepção (Matiz, Saturação e Brilho) e obtenha os valores correspondentes para os subpixels do monitor.

### 3. Feedback Visual
O programa utiliza um componente `TShape` que atualiza a cor em tempo real assim que as conversões são processadas, permitindo a comparação visual imediata.

---

##  Validação dos Resultados
O algoritmo foi testado e validado comparando os outputs diretamente com o utilitário **Editar Cores** do Windows Paint. 
* **Exemplo de Teste:**
    * **Entrada RGB:** (73, 148, 143)
    * **Saída HSL esperada:** (123, 81, 104)
    * *Resultado: Valores idênticos obtidos com sucesso.*

---

##  Como Executar
1. Abra o Lazarus IDE.
2. Carregue o projeto através do arquivo `ConversorCores.lpi`.
3. Pressione `F9` para compilar e executar.
4. Insira os valores em um dos lados e clique no botão de conversão correspondente.
