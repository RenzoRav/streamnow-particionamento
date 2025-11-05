  id_usuario     BIGINT GENERATED ALWAYS AS IDENTITY,
  nome           VARCHAR(100) NOT NULL,
  pais           VARCHAR(50)  NOT NULL,
  data_cadastro  DATE         NOT NULL,
  plano          VARCHAR(20)  NOT NULL,
  CONSTRAINT usuarios_pk PRIMARY KEY (id_usuario, data_cadastro)
) PARTITION BY RANGE (data_cadastro);

CREATE TABLE reproducoes (
  id_reproducao     BIGINT GENERATED ALWAYS AS IDENTITY,
  id_usuario        BIGINT      NOT NULL, 
  data_reproducao   DATE        NOT NULL,
  duracao_segundos  INT         NOT NULL,
  categoria         VARCHAR(50) NOT NULL,
  CONSTRAINT reproducoes_pk PRIMARY KEY (id_reproducao, data_reproducao)
) PARTITION BY RANGE (data_reproducao);