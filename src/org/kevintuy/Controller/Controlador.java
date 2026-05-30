package org.kevintuy.controller;

import org.kevintuy.model.Estudiante;
import org.kevintuy.model.dao.EstudianteDAO;
import org.kevintuy.view.Vista;
import java.sql.ResultSet;

public class Controlador {
    private Vista vista;
    private EstudianteDAO dao;

    public Controlador(Vista vista, EstudianteDAO dao) {
        this.vista = vista;
        this.dao = dao;
    }

    public void iniciar() {
        int opcion = 0;
        while (opcion != 3) {
            opcion = vista.menu();

            if (opcion == 1) {
                Estudiante est = new Estudiante();
                System.out.print("Ingrese ID: ");
                est.id = vista.teclado.nextInt();
                vista.teclado.nextLine();
                
                System.out.print("Ingrese Nombre: ");
                est.nombre = vista.teclado.nextLine();
                
                System.out.print("Ingrese Correo: ");
                est.correo = vista.teclado.nextLine();

                if (dao.guardar(est)) {
                    vista.imprimir("¡Guardado con éxito!");
                } else {
                    vista.imprimir("Error al guardar el estudiante.");
                }
            }

            if (opcion == 2) {
                vista.imprimir("\n+++ LISTA DE ESTUDIANTES +++");
                ResultSet datos = dao.mostrar();
                try {
                    if (datos != null) {
                        while (datos.next()) {
                            int id = datos.getInt("id_estudiante");
                            String nombre = datos.getString("nombre");
                            String correo = datos.getString("correo");
                            vista.imprimir(id + " " + nombre + " (" + correo + ")");
                        }
                    } else {
                        vista.imprimir("No se pudieron recuperar los datos.");
                    }
                } catch (Exception e) {
                    vista.imprimir("Error al leer datos de la BD.");
                    e.printStackTrace();
                }
            }
        }
        vista.imprimir("Programa cerrado de manera exitosa.");
    }
}