/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mandelbrot;

import java.awt.*;

import javax.swing.JPanel;
import java.awt.image.BufferedImage;


public class MandelbrotSetDrawingCanvas extends QuadraticSequenceDrawingCanvas {
    
    public MandelbrotSetDrawingCanvas(double aMinInit, double aMaxInit, double bMinInit, double bMaxInit, int threshold, JPanel jp) {
        super( aMinInit,  aMaxInit,  bMinInit,  bMaxInit, threshold, jp);
        paintImage();
    }

    
    
    public Image getImage() {
        BufferedImage bi = new BufferedImage(canvasWidth, canvasHeight, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = (Graphics2D) bi.getGraphics();
        
        updateScreenScale();
        
        double a = aMin;
        double b = bMax;
        double zReal, zImag, cReal, cImag, temp;
        int count, colorValue1, colorValue2;
       
        double brightnessBoost = 255/threshold;

        for (int x = 0; x < canvasWidth; x++) {
            a += unitsPerPixelX;
            b = bMax;
            for (int y = 0; y < canvasHeight; y++) {
                
                b -= unitsPerPixelY;                
                
                zReal = 0;
                zImag = 0;
                cReal = a;
                cImag = b;
                                
                count = 0;
                
                while (zReal*zReal + zImag*zImag < 4 && count < threshold) {
                    temp = zReal;
                    zReal = zReal*zReal - zImag*zImag + cReal;
                    zImag = 2*temp*zImag + cImag;
                    count++;
                }
                
                colorValue1 = (int)(count*brightnessBoost);
                
                colorValue2 = (int)(127.5 + 127.5*Math.sin(3.14159265*(colorValue1-62.5)/255));
                                
                g.setColor( new Color(colorValue1, colorValue2, colorValue2));
                g.drawLine(x, y, x, y);                
            }
        } 
        
        g.setColor(Color.WHITE);
        
        int x1 = 0;
        int y1 = 0;
        for (double t = 0; t < 2*Math.PI; t+=0.05) {
            double ja = (2 * Math.cos(t) - Math.cos(2*t)) / 3.9;
            double jb = (2 * Math.sin(t) - Math.sin(2*t)) / 3.9;
            
            System.out.print(ja);
            System.out.print(",");
            System.out.println(jb);
            
            int x2 = (int) ((ja - aMin) / unitsPerPixelX);
            int y2 = (int) ((bMax - jb) / unitsPerPixelY);
            
            System.out.print(x2);
            System.out.print(",");
            System.out.println(y2);
            
            g.drawLine(x1, y1, x2, y2);
            
            x1 = x2;
            y1 = y2;
        }
        
        return bi;
        
    }
}
