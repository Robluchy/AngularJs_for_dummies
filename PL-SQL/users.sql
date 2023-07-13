CREATE TABLE usuarios (
    id      NUMBER,
    nombre  VARCHAR2(50),
    correo  VARCHAR2(50),
    clave   VARCHAR2(20)
);

/

CREATE SEQUENCE users_seq START WITH 1 INCREMENT BY 1;

/

CREATE TRIGGER users_trigger
BEFORE INSERT ON users
FOR EACH row
BEGIN
  :new.id := users_seq.nextval;
END;

/

CREATE OR REPLACE PACKAGE pkg_usuarios AS
  PROCEDURE insertar (id_in IN usuarios.id%TYPE, nombre_in IN usuarios.nombre%TYPE, correo_in IN usuarios.correo%TYPE, clave_in IN usuarios.clave%TYPE);
  PROCEDURE modificar (id_in IN usuarios.id%TYPE, nombre_in IN usuarios.nombre%TYPE, correo_in IN usuarios.correo%TYPE, clave_in IN usuarios.clave%TYPE);
  PROCEDURE borrar (id_in IN usuarios.id%TYPE);
  FUNCTION leer (id_in IN usuarios.id%TYPE) RETURN usuarios%ROWTYPE;
END pkg_usuarios;

/

CREATE OR REPLACE PACKAGE BODY pkg_usuarios AS
  PROCEDURE insertar (id_in IN usuarios.id%TYPE, nombre_in IN usuarios.nombre%TYPE, correo_in IN usuarios.correo%TYPE, clave_in IN usuarios.clave%TYPE) IS
  BEGIN
    INSERT INTO usuarios (id, nombre, correo, clave) VALUES (id_in, nombre_in, correo_in, clave_in);
  END insertar;
  
  PROCEDURE modificar (id_in IN usuarios.id%TYPE, nombre_in IN usuarios.nombre%TYPE, correo_in IN usuarios.correo%TYPE, clave_in IN usuarios.clave%TYPE) IS
  BEGIN
    UPDATE usuarios SET nombre = nombre_in, correo = correo_in, clave = clave_in WHERE id = id_in;
  END modificar;

  PROCEDURE borrar (id_in IN usuarios.id%TYPE) IS
  BEGIN
    DELETE FROM usuarios WHERE id = id_in;
  END borrar;

  FUNCTION leer (id_in IN usuarios.id%TYPE) RETURN usuarios%ROWTYPE IS
    v_usuario   usuarios%ROWTYPE;
  BEGIN
    SELECT * INTO v_usuario FROM usuarios WHERE id = id_in;
    RETURN v_usuario;
  END leer;
END pkg_usuarios;

/
-- COMO HACER BUCLES 

-- 4. Mostrar los numeros del 1 al 100 con un while.

declare
  i number(8) := 1;
begin
  
  while (i<=10)
  loop
    DBMS_OUTPUT.PUT_LINE(i);
    i := i+1;
  end loop;

end;
/

-- 5. Mostrar los numeros del 1 al 100 con un for.


begin
  
  for i in 1..10
  loop
    DBMS_OUTPUT.PUT_LINE(i);
  end loop;

end;
/

-- De 10 a 1
begin
  
  for i in reverse 1..10
  loop
    DBMS_OUTPUT.PUT_LINE(i);
  end loop;

end;
/

-- 6. Mostrar los numeros del 1 al 100 con un loop.

declare
  i number(8) := 1;
begin
  
  loop
    DBMS_OUTPUT.PUT_LINE(i);
    exit when i=10;
    i := i+1;
  end loop;

end;
/
