SET JAVA_HOME="C:\Program Files\Java\jdk1.8.0_131\bin"
SET PATH=%JAVA_HOME%;%PATH%
SET CLASSPATH=%JAVA_HOME%;
SET JFLEX_HOME= D:\Ucaldas\Lenguajes\PRUEBAS\CompilarFC2
cd D:\Ucaldas\Lenguajes\PRUEBAS\CompilarFC2\src\Analizadores
java -jar D:\Ucaldas\Lenguajes\CompilarFC\java-cup-11b.jar -parser analisis_sintactico -symbols Simbolos A_Sintactico.cup
pause
