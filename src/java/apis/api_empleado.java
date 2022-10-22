/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package apis;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.EOFException;
import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import javax.swing.table.DefaultTableModel;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 *
 * @author Carlos Alfonso
 */
public class api_empleado extends Persona {
    
    private String idEmpleado,  idPuesto, FechaingresoRegistro;
    
    private String url_api = "https://localhost:5001/api/empleados";
    
    
    public api_empleado() {
    }


    public api_empleado(String idEmpleado,String Nombre, String Apellido, String Direccion, String Telefono, String idPuesto,String DPI, String FechaNacimiento, String FechaingresoRegistro) {
        super(Nombre, Apellido, Direccion, Telefono, DPI, FechaNacimiento);
        this.idEmpleado = idEmpleado;
        this.idPuesto = idPuesto;
        this.FechaingresoRegistro = FechaingresoRegistro;
    }

    public String getIdEmpleado() {
        return idEmpleado;
    }

    public void setIdEmpleado(String idEmpleado) {
        this.idEmpleado = idEmpleado;
    }

    public String getIdPuesto() {
        return idPuesto;
    }

    public void setIdPuesto(String idPuesto) {
        this.idPuesto = idPuesto;
    }

    public String getFechaingresoRegistro() {
        return FechaingresoRegistro;
    }

    public void setFechaingresoRegistro(String FechaingresoRegistro) {
        this.FechaingresoRegistro = FechaingresoRegistro;
    }
    
    
    private String get(){
        String salida="";
        
        try{
          URL url = new URL(url_api);  
          HttpURLConnection c_api = (HttpURLConnection) url.openConnection();
          c_api.setRequestMethod("GET");
          c_api.setRequestProperty("Accept", "application/json");
          if (c_api.getResponseCode()==200){
              InputStreamReader entrada = new InputStreamReader(c_api.getInputStream());
              BufferedReader lectura = new BufferedReader(entrada);
              salida = lectura.readLine();
          }else{
              salida = "";
              System.out.println("No se puede conectar a la api : " + c_api.getResponseCode());
          
          }
          
          c_api.disconnect();
            
        }catch(IOException ex){
            System.out.println("Error api:" + ex.getMessage());
        }
        return salida;
    } 
    
        public DefaultTableModel leer(){
     DefaultTableModel tabla = new DefaultTableModel();
     try{
         String encabezado[] ={"id","nombres","apellidos","dire","tel","idpu","dpi","fecha_nacimiento","fechaRegistro"};
         tabla.setColumnIdentifiers(encabezado);
         String datos[] = new String[9];
         JSONArray arreglo = new JSONArray(get());
         for (int indice = 0;indice < arreglo.length();indice++){
             JSONObject atributo = arreglo.getJSONObject(indice);
            datos[0] = String.valueOf(atributo.getInt("idEmpleado")) ;
            datos[1] = atributo.getString("nombre");
            datos[2] = atributo.getString("apellido");
            datos[3] = atributo.getString("direccion");
            datos[4] = atributo.getString("telefono");
            datos[5] = atributo.getString("idPuesto");
            datos[6] = atributo.getString("dpi");
            datos[7] = atributo.getString("fechaNacimiento");
            datos[8] = atributo.getString("fechaingresoRegistro");
            tabla.addRow(datos);
         }
     }catch(JSONException ex){
     System.out.println("Error tabla:" + ex.getMessage());
     }
     return tabla;
     }
    
    public int  post(){
         int salida = 0;
         try{
          URL url = new URL(url_api);  
          HttpURLConnection c_api = (HttpURLConnection) url.openConnection();
          c_api.setRequestMethod("POST");
          c_api.setRequestProperty("Content-Type", "application/json; utf-8");
         // c_api.setRequestProperty("Accept", "application/json");
          c_api.setDoOutput(true);
          String jsonS = "{"
                  + "datos[1] = atributo.getString(\"nombre\");"
                  + "datos[2] = atributo.getString(\"apellido\");"
                  + "datos[3] = atributo.getString(\"direccion\");"
                  + " datos[4] = atributo.getString(\"telefono\");"
                  + "datos[5] = atributo.getString(\"idPuesto\");"
                  + "datos[6] = atributo.getString(\"dpi\");"
                  + "atos[6] = atributo.getString(\"dpi\");"
                  + "datos[7] = atributo.getString(\"fechaNacimiento\");"
                  + "datos[8] = atributo.getString(\"fechaingresoRegistro\");"
                  + "}";      
          OutputStream os = c_api.getOutputStream();
        os.write(jsonS.getBytes());
        os.flush();
          
          if (c_api.getResponseCode()==200){
             
 
                salida = 1;
        
        
              
          }else{
            
              System.out.println("No se puede conectar a la api : " + c_api.getResponseCode());
          
          }
          
          c_api.disconnect();
            
        }catch(IOException ex){
     
            System.out.println("Error api:" + ex.getMessage());
        }
         return salida;
    
    }
    
     public int  put(){
         int salida = 0;
         try{
          URL url = new URL(url_api);  
          HttpURLConnection c_api = (HttpURLConnection) url.openConnection();
          c_api.setRequestMethod("POST");
          c_api.setRequestProperty("Content-Type", "application/json; utf-8");
         // c_api.setRequestProperty("Accept", "application/json");
          c_api.setDoOutput(true);
          String jsonS = "{"
                  + "datos[0] = String.valueOf(atributo.getInt(\"idEmpleado\")) ;"
                  + "datos[1] = atributo.getString(\"nombre\");"
                  + "datos[2] = atributo.getString(\"apellido\");"
                  + "datos[3] = atributo.getString(\"direccion\");"
                  + " datos[4] = atributo.getString(\"telefono\");"
                  + "datos[5] = atributo.getString(\"idPuesto\");"
                  + "datos[6] = atributo.getString(\"dpi\");"
                  + "atos[6] = atributo.getString(\"dpi\");"
                  + "datos[7] = atributo.getString(\"fechaNacimiento\");"
                  + "datos[8] = atributo.getString(\"fechaingresoRegistro\");"
                  + "}";      
          OutputStream os = c_api.getOutputStream();
        os.write(jsonS.getBytes());
        os.flush();
          
          if (c_api.getResponseCode()==200){
             
 
                salida = 1;
        
        
              
          }else{
            
              System.out.println("No se puede conectar a la api : " + c_api.getResponseCode());
          
          }
          
          c_api.disconnect();
            
        }catch(IOException ex){
     
            System.out.println("Error api:" + ex.getMessage());
        }
         return salida;
    
    }
    
     
   public int  delete(){
         int salida = 0;
         try{
          URL url = new URL(url_api   );  
          HttpURLConnection c_api = (HttpURLConnection) url.openConnection();
          c_api.setRequestMethod("POST");
          c_api.setRequestProperty("Content-Type", "application/json; utf-8");
         // c_api.setRequestProperty("Accept", "application/json");
          c_api.setDoOutput(true);
          String jsonS = "{"  + "}";      
          OutputStream os = c_api.getOutputStream();
        os.write(jsonS.getBytes());
        os.flush();
          
          if (c_api.getResponseCode()==200){
             
 
                salida = 1;
        
        
              
          }else{
            
              System.out.println("No se puede conectar a la api : " + c_api.getResponseCode());
          
          }
          
          c_api.disconnect();
            
        }catch(IOException ex){
     
            System.out.println("Error api:" + ex.getMessage());
        }
         return salida;
    
    }
    
}
