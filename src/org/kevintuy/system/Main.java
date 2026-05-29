package org.kevintuy.system;

import org.kevintuy.controller.Controlador;
import org.kevintuy.model.dao.EstudianteDAO;
import org.kevintuy.view.Vista;

public class Main {
    public static void main(String[] args) {
        Vista v = new Vista();
        EstudianteDAO d = new EstudianteDAO();
        Controlador c = new Controlador(v, d);
        c.iniciar();
    }
}