SET JAVA_HOME="C:\Program Files\Java\jdk1.8.0_131\bin"
SET PATH=%JAVA_HOME%;%PATH%
SET CLASSPATH=%JAVA_HOME%;
SET JFLEX_HOME= D:\Ucaldas\Lenguajes\jflex-1.6.1\lib
cd D:\Ucaldas\Lenguajes\PRUEBAS\CompilarFC2\src\Analizadores
java -jar D:\Ucaldas\Lenguajes\jflex-1.6.1\lib\jflex-1.6.1.jar A_Lexico.jflex
pause