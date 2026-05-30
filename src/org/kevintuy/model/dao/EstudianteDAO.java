package org.kevintuy.model.dao;

import org.kevintuy.model.Estudiante;
import org.kevintuy.model.conexion.Conexion;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Connection;

public class EstudianteDAO {

    public boolean guardar(Estudiante est) {
        try {
            Connection cn = Conexion.conectar();
            CallableStatement st = cn.prepareCall("{call sp_crear_estudiante(?, ?, ?)}");
            st.setInt(1, est.id);
            st.setString(2, est.nombre);
            st.setString(3, est.correo);
            st.execute();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public ResultSet mostrar() {
        try {
            Connection cn = Conexion.conectar();
            CallableStatement st = cn.prepareCall("{call sp_listar_estudiantes()}");
            return st.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}