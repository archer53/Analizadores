/*----------------------------------------------------------------------------
--------------------- 1ra. Area: Codigo de Usuario
----------------------------------------------------------------------------*/

//-------> Paquete, importaciones

package Analizadores;

import java_cup.runtime.*;
import java.util.ArrayList;
import java.util.LinkedList;

%%
/*----------------------------------------------------------------------------
--------------------- 2da. Area: Opciones y Declaraciones
----------------------------------------------------------------------------*/

%{
    String cadena="";
    String cad="";
    public static LinkedList<AcepErr> TablaErr=new LinkedList<AcepErr>();
    Archivos archivo = new Archivos();
    
%}

//-------> Directivas
%public
%class ALexico
%cupsym Simbolos
%cup
%char
%column
%full
%ignorecase
%line
%unicode

//-------> Expresiones Regulares
digito = [0-9]
letra = [a-zA-ZñÑ]
numero = {digito}+("."{digito}+)?
id = {letra}+({letra}|{digito}|"_")*
WHITE=[ \t\r\n]


//-------> Estados



%%
/*-------------------------------------------------------------------
--------------------- 3ra. y ultima area: Reglas Lexicas
-------------------------------------------------------------------*/

//-------> Comentarios


//-------> Simbolos

<YYINITIAL> ","         {   System.out.println("Reconocido: <<"+yytext()+">>, coma");
                            cadena = "Reconocido: <<"+yytext()+">>, coma";
                            archivo.escribirAceptados(cadena);
                            return new Symbol(Simbolos.coma, yycolumn, yyline, yytext());}

<YYINITIAL> ";"         {   System.out.println("Reconocido: <<"+yytext()+">>, puntocoma");
                            cadena = "Reconocido: <<"+yytext()+">>, puntocoma";
                            archivo.escribirAceptados(cadena);
                            return new Symbol(Simbolos.puntocoma, yycolumn, yyline, yytext());}

<YYINITIAL> "("         {   System.out.println("Reconocido: <<"+yytext()+">>, apar");
                            cadena = "Reconocido: <<"+yytext()+">>, apar";
                            archivo.escribirAceptados(cadena);
                            return new Symbol(Simbolos.apar, yycolumn, yyline, yytext());}

<YYINITIAL> ")"         {   System.out.println("Reconocido: <<"+yytext()+">>, cpar");
                            cadena = "Reconocido: <<"+yytext()+">>, cpar";
                            archivo.escribirAceptados(cadena);
                            return new Symbol(Simbolos.cpar, yycolumn, yyline, yytext());}


//-------> Operadores Aritmeticos

<YYINITIAL> "+"         {   System.out.println("Reconocido: <<"+yytext()+">>, uno_o_mas");
                            cadena = "Reconocido: <<"+yytext()+">>, uno_o_mas";
                            archivo.escribirAceptados(cadena);
                            return new Symbol(Simbolos.uno_o_mas, yycolumn, yyline, yytext());}



<YYINITIAL> "*"         {   System.out.println("Reconocido: <<"+yytext()+">>, cero_o_mas");
                            cadena = "Reconocido: <<"+yytext()+">>, cero_o_mas";
                            archivo.escribirAceptados(cadena);
                            return new Symbol(Simbolos.cero_o_mas, yycolumn, yyline, yytext());}

<YYINITIAL> "/"         {   System.out.println("Reconocido: <<"+yytext()+">>, or");
                            cadena = "Reconocido: <<"+yytext()+">>, or";
                            archivo.escribirAceptados(cadena);
                            return new Symbol(Simbolos.or, yycolumn, yyline, yytext());}

<YYINITIAL> "."         {   System.out.println("Reconocido: <<"+yytext()+">>, punto");
                            cadena = "Reconocido: <<"+yytext()+">>, punto";
                            archivo.escribirAceptados(cadena);
                            return new Symbol(Simbolos.punto, yycolumn, yyline, yytext());}
<YYINITIAL> "?"         {   System.out.println("Reconocido: <<"+yytext()+">>, cero_o_uno");
                            cadena = "Reconocido: <<"+yytext()+">>, cero_o_uno";
                            archivo.escribirAceptados(cadena);
                            return new Symbol(Simbolos.cero_o_uno, yycolumn, yyline, yytext());}



//-------> Reservadas, tipos de datos y del sistema

<YYINITIAL> "MAIN"             {   System.out.println("Reconocido: <<"+yytext()+">>, MAIN");
                                cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada MAIN";
                                archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.MAIN, yycolumn, yyline, yytext());}
<YYINITIAL> "FIN"             {   System.out.println("Reconocido: <<"+yytext()+">>, FIN");
                                cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada FIN";
                                archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.FIN, yycolumn, yyline, yytext());}

<YYINITIAL> "DEF"             {   System.out.println("Reconocido: <<"+yytext()+">>, DEF");
                                cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada DEF";
                                archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.DEF, yycolumn, yyline, yytext());}

<YYINITIAL> "AF"                  {   System.out.println("Reconocido: <<"+yytext()+">>, AF");
                                      cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada  AF";
                                      archivo.escribirAceptados(cadena);
                                      return new Symbol(Simbolos.AF, yycolumn, yyline, yytext());}

<YYINITIAL> "ER"              {   System.out.println("Reconocido: <<"+yytext()+">>, ER");
                                  cadena = "Reconocido: <<"+yytext()+">>,  Palabra Reservada ER";
                                  archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.ER, yycolumn, yyline, yytext());}

<YYINITIAL> "AFND"                 {   System.out.println("Reconocido: <<"+yytext()+">>, AFND");
                                       cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada AFND";
                                       archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.AFND, yycolumn, yyline, yytext());}

<YYINITIAL> "agregarEstados"                 {   System.out.println("Reconocido: <<"+yytext()+">>, agregarEstados");
                                                 cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada agregarEstados";
                                                 archivo.escribirAceptados(cadena);
                                                 return new Symbol(Simbolos.agregarEstados, yycolumn, yyline, yytext());}

<YYINITIAL> "agregarAlfabeto"            {   System.out.println("Reconocido: <<"+yytext()+">>, agregarAlfabeto");
                                             cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada agregarAlfabeto";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.agregarAlfabeto, yycolumn, yyline, yytext());}

<YYINITIAL> "agregarTransicion"         {   System.out.println("Reconocido: <<"+yytext()+">>, agregarTransicion");
                                           cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada agregarTransicion";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.agregarTransicion, yycolumn, yyline, yytext());}

<YYINITIAL> "complemento"          {   System.out.println("Reconocido: <<"+yytext()+">>, complemento");
                                       cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada complemento";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.complemento, yycolumn, yyline, yytext());}

<YYINITIAL> "union"                    {   System.out.println("Reconocido: <<"+yytext()+">>, union");
                                           cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada union";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.union, yycolumn, yyline, yytext());}

<YYINITIAL> "interseccion"                  {   System.out.println("Reconocido: <<"+yytext()+">>, interseccion");
                                                cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada interseccion";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.interseccion, yycolumn, yyline, yytext());}

<YYINITIAL> "diferencia"                  {   System.out.println("Reconocido: <<"+yytext()+">>, diferencia");
                                             cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada diferencia";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.diferencia, yycolumn, yyline, yytext());}

<YYINITIAL> "ERaAFND"          {   System.out.println("Reconocido: <<"+yytext()+">>, ERaAFND");
                                    cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada ERaAFND";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.ERaAFND, yycolumn, yyline, yytext());}

<YYINITIAL> "ERaAFD"              {   System.out.println("Reconocido: <<"+yytext()+">>, ERaAFD");
                                      cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada ERaAFD";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.ERaAFD, yycolumn, yyline, yytext());}

<YYINITIAL> "reverso"               {   System.out.println("Reconocido: <<"+yytext()+">>, reverso");
                                        cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada reverso";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.reverso, yycolumn, yyline, yytext());}

<YYINITIAL> "graficar"                  {   System.out.println("Reconocido: <<"+yytext()+">>, graficar");
                                            cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada graficar";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.graficar, yycolumn, yyline, yytext());}

<YYINITIAL> "minimizacion"                  {   System.out.println("Reconocido: <<"+yytext()+">>, minimizacion");
                                               cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada minimizacion";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.minimizacion, yycolumn, yyline, yytext());}

<YYINITIAL> "agregarexpresion"                  {   System.out.println("Reconocido: <<"+yytext()+">>, agregarexpresion");
                                                    cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada agregarexpresion";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.agregarexpresion, yycolumn, yyline, yytext());}

<YYINITIAL> "concatenacion"                  {   System.out.println("Reconocido: <<"+yytext()+">>, concatenacion");
                                                 cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada concatenacion";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.concatenacion, yycolumn, yyline, yytext());}

<YYINITIAL> "cerradura"                  {   System.out.println("Reconocido: <<"+yytext()+">>,cerradura");
                                             cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada cerradura";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.cerradura, yycolumn, yyline, yytext());}
<YYINITIAL> "EstadoInicial"            {   System.out.println("Reconocido: <<"+yytext()+">>,EstadoInicial");
                                             cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada EstadoInicial";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.EstadoInicial, yycolumn, yyline, yytext());}

<YYINITIAL> "EstadoFinal"        {   System.out.println("Reconocido: <<"+yytext()+">>,EstadoFinal");
                                             cadena = "Reconocido: <<"+yytext()+">>, Palabra Reservada EstadoFinal";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.EstadoFinal, yycolumn, yyline, yytext());}

<YYINITIAL> {id}                      {   System.out.println("Reconocido: <<"+yytext()+">>, id ");
                                          cadena = "Reconocido: <<"+yytext()+">>, id";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.id, yycolumn, yyline, yytext());}
<YYINITIAL> {numero}                      {   System.out.println("Reconocido: <<"+yytext()+">>, id ");
                                              cadena = "Reconocido: <<"+yytext()+">>, id";
                                             archivo.escribirAceptados(cadena);
                                return new Symbol(Simbolos.id, yycolumn, yyline, yytext());}




<YYINITIAL> {WHITE}               {/* ignore white space. */}
 
.                           {   System.out.println("Error Lexico: <<"+yytext()+">> ["+yyline+" , "+yycolumn+"] Simbolo no existe en el lenguaje");
                                cad = "Error Lexico: <<"+yytext()+">> ["+yyline+" , "+yycolumn+"] Simbolo no existe en el lenguaje";
                                             archivo.escribirErrorLexico(cad);
                                
                                }

