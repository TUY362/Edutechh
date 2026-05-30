package org.kevintuy.view;

import java.util.Scanner;

public class Vista {
    public Scanner teclado = new Scanner(System.in);

    public int menu() {
        System.out.println("\n--- MENU PRINCIPAL ---");
        System.out.println("1. Guardar Estudiante");
        System.out.println("2. Mostrar Estudiantes");
        System.out.println("3. Salir");
        System.out.print("Seleccione una opcion: ");
        return teclado.nextInt();
    }

    public void imprimir(String texto) {
        System.out.println(texto);
    }
}