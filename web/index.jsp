<%-- 
    Document   : index
    Created on : 18 oct 2022, 9:43:36
    Author     : Carlos Alfonso
--%>

<%@page import="java.util.HashMap"%>
<%@page import="javax.swing.table.DefaultTableModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import ="apis.api_empleado"%>
<%@page import="model.Puesto" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">    
         <link rel="stylesheet" href="recursos/css/estilos.css">
    </head>
    <body>
         <header>

            <a href="#inicio" class="logo"> 
                <span>Formulario</span> empleados
            </a>

            <input type="checkbox" id="menu-bar">
            <label for="menu-bar" class="fa fa-bars"></label>

            <nav class="navbar">
                <a href="#Estudiante">Empleados</a>
                <a href="#Sangre">Puestos</a>
            </nav>

        </header>

        <section class="inicio" id="inicio">
            
              <div class="image">
                <img src="recursos/img/principal.svg" alt="">
            </div>
            
            <div class="content">
                <h3>EMPLEADOS <span>registro</span></h3>
                <p>Formulario control de los estudiantes activos a la institución. Objetivo: brindar el mejor control a los estudiantes y monitorear flexiblemente los atributos de los agentes activos.</p>
                <a href="#Estudiante" class="boton">COMENZAR</a>
            </div>

       

        </section>


        <section class="Estudiante" id="Estudiante">

            <div class="image">
                <img src="recursos/img/segundo.svg" alt="">
                
      
            </div>
            
           
            <div class="contendor">

                <h1 class="heading">ESTUDIANTES</h1>
                <button type="button" name="btn_nuevo" id="btn_nuevo" class="boton" data-toggle="modal" data-target="#modal_empleado" onclick="limpiar()">AGREGAR EMPLEADO</button>
                

            
            
    <div class="container">
         
    <div class="modal fade" id="modal_empleado" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-body">
            
            <form action="sr_empleado" method= "get" class="form-group">
                
                <label for="lbl_id_estudiante" ><b>ID</b></label>
                <input type="text" name="txt_id_empleado" id="txt_id_empleado" class="form-control" value="0"  readonly> 
                
                <label for="lbl_nombre" ><b>Nombre</b></label>
                <input type="text" name="txt_nombre" id="txt_nombre" class="form-control" placeholder="Juan Perez" required>
                
                
                <label for="lbl_apellidos" ><b>Apellidos</b></label>
                <input type="text" name="txt_apellidos" id="txt_apellidos" class="form-control" placeholder=" Apellido1 Apellido2" required>
                
                <label for="lbl_direccion" ><b>Direccion</b></label>
                <input type="text"  name="txt_direccion" id="txt_direccion" class="form-control" placeholder="Ejemplo: #Casa calle zona ciudad" required>
               
                <label for="lbl_telefono" ><b>Telefono</b></label>
                <input type="number" name="txt_telefono" id="txt_telefono" class="form-control" placeholder="Ejemplo: 5555555" required>

                <label for="lbl_id_puesto" ><b>Puesto</b></label>
                <select name="drop_id_puesto" id="drop_id_puesto" class="form-control">
                    <% 
                        Puesto puesto = new Puesto();
                        HashMap<String,String> drop = puesto.drop_puesto();
                         for (String i:drop.keySet()){
                             out.println("<option value='" + i + "'>" + drop.get(i) + "</option>");
                         }
                       

                    %>
                </select>

                <label for="lbl_dpi" ><b>DPI</b></label>
                <input type="number" name="txt_dpi" id="txt_dpi" class="form-control" placeholder="1245886" required>
                

                <label for="lbl_fn" ><b>Nacimiento</b></label>
                <input type="datetime"  name="txt_fn" id="txt_fn" class="form-control" required>

                <label for="lbl_ingreo" ><b>Fecha Registro</b></label>
                <input type="datetime"  name="txt_fingreso" id="txt_fingreso" class="form-control" required>

                
                <br>
                <button name="btn_agregar" id="btn_agregar"  value="agregar" class="btn btn-dark">Agregar</button>
                <button name="btn_modificar" id="btn_modificar"  value="modificar" class="btn btn-dark">Modificar</button>
                <button name="btn_eliminar" id="btn_modificar"  value="eliminar" class="btn btn-dark" onclick="javascript:if(!confirm('¿Desea Eliminar?'))return false" >Eliminar</button>
                <button type="button" class="btn btn-dark" data-dismiss="modal">Cerrar</button>
               
                
            </form>
       </div>
      </div>
    </div>
  </div>

<br>
<br>
                    
    <table class="table table-striped">
    <thead>
      <tr>
        <th>Nombres</th>
        <th>Apellidos</th>
        <th>Direccion</th>
        <th>Telefono</th>
        <th>idPuesto</th>
        <th>DPI</th>
        <th>Fecha de Nacimiento</th>
        <th>Fecha de Registro</th>
      </tr>
    </thead>
    <tbody id="tbl_Empleado">
          <% 
        api_empleado api_c =  new api_empleado();
        DefaultTableModel tabla = new DefaultTableModel();
        tabla = api_c.leer();
        for (int t=0;t<tabla.getRowCount();t++){
            out.println("<tr data-id="+ tabla.getValueAt(t, 0) + ">");
            out.println("<td>"+ tabla.getValueAt(t, 1) +"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 2) +"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 3) +"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 4) +"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 5) +"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 6) +"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 7) +"</td>");
            out.println("<td>"+ tabla.getValueAt(t, 8) +"</td>");
            out.println("</tr>");
        
        }
        %>

    </tbody>
  </table>          
               
    </div>
   </div>              
                    
       
                    
 </section>
        
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>

        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
        
           <script type="text/javascript">
    function limpiar(){
       $("#txt_id_empleado").val(0);
       $("#txt_nombre").val('');
       $("#txt_apellidos").val('');
       $("#txt_direccion").val('');
       $("#txt_telefono").val('');
       $("#drop_id_puesto").val(1);
       $("#txt_dpi").val('');
       $("#drop_fn").val(1);
       $("#txt_fingreso").val('');
        
       

    }
   
    $('#tbl_Empleado').on('click','tr td',function(evt){
       var target,id,nombre,apellido,direccion,telefono,id_p,dpi,FechaNacimiento,fecha_ingreso; 
       target = $(event.target);
       id = target.parent().data('id');
       nombre= target.parent("tr").find("td").eq(0).html();
       apellido = target.parent("tr").find("td").eq(1).html();
       direccion = target.parent("tr").find("td").eq(2).html();
       telefono = target.parent("tr").find("td").eq(3).html();
       id_p = target.parent("tr").find("td").eq(4).html();
       dpi = target.parent("tr").find("td").eq(5).html();
       
       FechaNacimiento = target.parent("tr").find("td").eq(6).html();
       fecha_ingreso = target.parent("tr").find("td").eq(7).html();
       
       
       $("#txt_id_empleado").val(id);
       $("#txt_nombre").val(nombre);
       $("#txt_apellidos").val(apellido);
       $("#txt_direccion").val(direccion);
       $("#txt_telefono").val(telefono);
       $("#drop_id_puesto").val(id_p);
       $("#txt_dpi").val(dpi);

       $("#txt_fn").val(FechaNacimiento);
       $("#txt_fingreso").val(fecha_ingreso);
       
       
       $("#modal_empleado").modal('show');
    });
    
</script>
        
        
    
    </body>
</html>
