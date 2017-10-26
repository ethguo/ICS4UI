
package mandelbrot;

import java.awt.*;
import java.awt.image.BufferedImage;
import javax.swing.JPanel;


public class JuliaSetDrawingCanvas extends QuadraticSequenceDrawingCanvas {
    
    double cReal, cImag;
    
    public JuliaSetDrawingCanvas(double aMinInit, double aMaxInit, double bMinInit, double bMaxInit, int threshold, JPanel jp) {
        super( aMinInit,  aMaxInit,  bMinInit,  bMaxInit, threshold, jp);
        cReal = 0;
        cImag = 0;
    }
    
    public void paintImage(double cr, double ci) {
        this.cReal = cr;
        this.cImag = ci;
        super.paintImage();
    }
    
    public Image getImage() {
        BufferedImage bi = new BufferedImage(canvasWidth, canvasHeight, BufferedImage.TYPE_INT_RGB);
        Graphics2D g = (Graphics2D) bi.getGraphics();
        
        updateScreenScale();
        
        double a = aMin;
        double b = bMax;
        double zReal, zImag, temp;
        int count, colorValue1, colorValue2;
       
        double brightnessBoost = 255/threshold;

        for (int x = 0; x < canvasWidth; x++) {
            a += unitsPerPixelX;
            b = bMax;
            for (int y = 0; y < canvasHeight; y++) {
                
                b -= unitsPerPixelY;                
                
                zReal = a;
                zImag = b;
                                
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
        return bi;
        
    }

}
