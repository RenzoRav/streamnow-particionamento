# StreamNow – Particionamento de Dados no PostgreSQL

## Descrição
Implementação de particionamento nas tabelas de usuários e reproduções para melhorar desempenho de consultas e facilitar manutenção/backup. O projeto inclui scripts SQL para criação de tabelas, criação de partições, inserção de dados de exemplo e consultas básicas.

## Cenário
A StreamNow é uma plataforma de streaming com milhões de usuários e bilhões de reproduções. As consultas mais frequentes:
- Marketing: crescimento de cadastros ao longo do tempo e comparação por país.
- BI: total de horas assistidas por mês, total de reproduções por categoria e histórico por período.
Há necessidade de escalar leituras e simplificar arquivamento e manutenção mensal.

## Justificativa da Estratégia de Particionamento
### Tabela `usuarios`
- Tipo: `PARTITION BY RANGE (data_cadastro)`.
- Motivo: as análises são temporais (crescimento ao longo do tempo). O particionamento por data permite partition pruning nos filtros por mês/período e simplifica manutenção (backup/arquivamento por faixa de datas). LIST por país não é ideal devido ao número de países e por não atender às consultas temporais.

### Tabela `reproducoes`
- Tipo: `PARTITION BY RANGE (data_reproducao)` (granularidade mensal).
- Motivo: maior volume e consultas por período. O particionamento por mês melhora agregações por tempo e permite arquivar facilmente meses antigos. LIST por categoria não atende à necessidade principal, que é tempo.