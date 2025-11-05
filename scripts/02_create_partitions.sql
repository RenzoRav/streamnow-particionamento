CREATE TABLE usuarios (
  id_usuario     BIGINT,
  nome           VARCHAR(100) NOT NULL,
  pais           VARCHAR(50)  NOT NULL,
  data_cadastro  DATE         NOT NULL,
  plano          VARCHAR(20)  NOT NULL
) PARTITION BY RANGE (data_cadastro);


CREATE TABLE reproducoes (
  id_reproducao     BIGINT,
  id_usuario        BIGINT      NOT NULL, 
  data_reproducao   DATE        NOT NULL,
  duracao_segundos  INT         NOT NULL,
  categoria         VARCHAR(50) NOT NULL
) PARTITION BY RANGE (data_reproducao);
