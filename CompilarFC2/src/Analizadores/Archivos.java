/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Analizadores;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.LinkedList;

/**
 *
 * @author andres
 */
public class Archivos {
    
      File archivo = null;
      FileReader fa = null;
      FileReader fs = null;
      FileReader fl = null;
      BufferedReader ba = null;
      BufferedReader bl = null;
      BufferedReader bs = null;
      FileWriter fichero = null;
      PrintWriter pw = null;
      String linea;
      String lineal;
      String lineas;
      String cadena = "";
      String cadenalex = "";
      String cadenasin= "";
      
      String ruta;
      
      
      public String leerAceptados() throws IOException{         
         
             
          
 
try {
         // Apertura del fichero y creacion de BufferedReader para poder
         // hacer una lectura comoda (disponer del metodo readLine()).
         archivo = new File ("D:/Ucaldas/Lenguajes/PRUEBAS/CompilarFC2/aceptados.txt");
         fa = new FileReader(archivo);
         ba = new BufferedReader(fa);

while((linea= ba.readLine())!=null){
    
    cadena = cadena + linea + "\n";
    
    }

}
      catch(IOException e){
          
          return "No se han reconocido elementos";
          
      }finally{
         // En el finally cerramos el fichero, para asegurarnos
         // que se cierra tanto si todo va bien como si salta 
         // una excepcion.
         try{                    
            if( null != fa ){   
               fa.close();
               ba.close();
            }                  
         }catch (Exception e2){ 
             
            e2.printStackTrace();
            return "error";
         }       


        
        
    }

return cadena;


    }
      public String leerErrorLexico() throws IOException{         
         
          
 
try {
         // Apertura del fichero y creacion de BufferedReader para poder
         // hacer una lectura comoda (disponer del metodo readLine()).
         archivo = new File ("D:/Ucaldas/Lenguajes/PRUEBAS/CompilarFC2/erroresLexicos.txt");
         fl = new FileReader(archivo);
         bl = new BufferedReader(fl);

while((lineal= bl.readLine())!=null){
    
    cadenalex = cadenalex + lineal + "\n";
    
    }

}
      catch(IOException e){
          return "No hay errores lexicos";
          
      }finally{
         // En el finally cerramos el fichero, para asegurarnos
         // que se cierra tanto si todo va bien como si salta 
         // una excepcion.
         try{                    
            if( null != fl ){   
               fl.close();
               bl.close();
            }                  
         }catch (Exception e2){ 
             
            e2.printStackTrace();
            
         }       


        
        
    }

return cadenalex;


    }
      
 public String leerErrorSintactico() throws IOException{         
         
          
 
try {
         // Apertura del fichero y creacion de BufferedReader para poder
         // hacer una lectura comoda (disponer del metodo readLine()).
         archivo = new File ("D:/Ucaldas/Lenguajes/PRUEBAS/CompilarFC2/erroresSintacticos.txt");
         fs = new FileReader(archivo);
         bs = new BufferedReader(fs);

while((lineas= bs.readLine())!=null){
    
    cadenasin = cadenasin + lineas + "\n";
    
    }

}
      catch(IOException e){
          return "No hay errores Sintacticos";
          
      }finally{
         // En el finally cerramos el fichero, para asegurarnos
         // que se cierra tanto si todo va bien como si salta 
         // una excepcion.
         try{                    
            if( null != fs ){   
               fs.close();
               bs.close();
            }                  
         }catch (Exception e2){ 
             
            e2.printStackTrace();
            
         }       


        
        
    }

return cadenasin;


    }
public void escribirAceptados(String dato) throws IOException{     
          
try
        {
            fichero = new FileWriter("D:/Ucaldas/Lenguajes/PRUEBAS/CompilarFC2/aceptados.txt",true);
            pw = new PrintWriter(fichero);
            pw.println(dato);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
           try {
           // Nuevamente aprovechamos el finally para 
           // asegurarnos que se cierra el fichero.
           if (null != fichero)
              fichero.close();
              pw.close();
           } catch (Exception e2) {
              e2.printStackTrace();
           }
        }
 
      
   }
public void escribirErrorLexico(String dato) throws IOException{     
 
          
      
try
        {
            fichero = new FileWriter("D:/Ucaldas/Lenguajes/PRUEBAS/CompilarFC2/erroresLexicos.txt",true);
            pw = new PrintWriter(fichero);
            pw.println(dato);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
           try {
           // Nuevamente aprovechamos el finally para 
           // asegurarnos que se cierra el fichero.
           if (null != fichero)
              fichero.close();
              pw.close();
           } catch (Exception e2) {
              e2.printStackTrace();
           }
        }
 
      
   }
public void escribirErrorSintactico(String dato) throws IOException{     
 
try
        {
            fichero = new FileWriter("D:/Ucaldas/Lenguajes/PRUEBAS/CompilarFC2/erroresSintacticos.txt",true);
            pw = new PrintWriter(fichero);
            pw.println(dato);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
           try {
           // Nuevamente aprovechamos el finally para 
           // asegurarnos que se cierra el fichero.
           if (null != fichero)
              fichero.close();
              pw.close();
           } catch (Exception e2) {
              e2.printStackTrace();
           }
        }
 
      
   }

public void eliminar(String tipo){
    cadena = "";
    cadenasin="";
    cadenalex="";
    ruta="";
    String a;
    
    if(tipo.equals("l")){
              ruta = "D:/Ucaldas/Lenguajes/PRUEBAS/CompilarFC2/erroresLexicos.txt";
              a="erroresLexicos.txt";
          }
          else if (tipo.equals("s")) {
              
              ruta = "D:/Ucaldas/Lenguajes/PRUEBAS/CompilarFC2/erroresSintacticos.txt";
              a="erroresSintacticos.txt";
              
          }
          else  {
              ruta = "D:/Ucaldas/Lenguajes/PRUEBAS/CompilarFC2/aceptados.txt";
              a="aceptados.txt";
          }
    
    archivo = new File (ruta);
    if (!archivo.exists()) {
        System.out.println("El archivo "+a+" no existe.");
    } else {
        archivo.delete();
        System.out.println("El archivo "+a+" fue eliminado.");
    }
    
}
      
      
    
}
