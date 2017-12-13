/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package mandelbrot;

import javax.swing.*;
import java.awt.*;

public class QuadraticSequenceDrawingCanvas {
    
    JPanel drawingPanel;
    double aMin, aMax, bMin, bMax;
    double aMinInit, aMaxInit, bMinInit, bMaxInit;    
    double aRange, bRange;   
    double unitsPerPixelX, unitsPerPixelY;       
    double aMid, bMid;  
    int threshold;
    int canvasWidth, canvasHeight;
    int zoomCount;
    
    QuadraticSequenceDrawingCanvas(double aMinInit, double aMaxInit, double bMinInit, double bMaxInit, int threshold, JPanel jp) {
        
        this.drawingPanel = jp;
        this.aMinInit = aMinInit;
        this.aMaxInit = aMaxInit;
        this.bMinInit = bMinInit;
        this.bMaxInit = bMaxInit;
        this.threshold = threshold;
        this.canvasWidth = drawingPanel.getWidth();
        this.canvasHeight = drawingPanel.getHeight();
        resetRanges();
    }
    
    public void resetRanges() {
        this.aMin = aMinInit;
        this.aMax = aMaxInit;
        this.bMin = bMinInit;
        this.bMax = bMaxInit;
        zoomCount = 0;
        updateScreenScale();
    }
    
    public void updateScreenScale() { 
        aRange = aMax - aMin;
        bRange = bMax - bMin;
        unitsPerPixelX = aRange/canvasWidth;
        unitsPerPixelY = bRange/canvasHeight; 
        
    }
    
    public void centerScreenAboutPoint(int xCentre, int yCentre) {            
        updateScreenScale();
        double aCentre = aMin + xCentre*unitsPerPixelX;
        double bCentre = bMax - yCentre*unitsPerPixelY;
        
        aMin = aCentre - aRange/2;
        aMax = aMin + aRange;
        
        bMin = bCentre - bRange/2;
        bMax = bMin + bRange;
        
        paintImage();
    }  
    
    
    public void zoom( double zoomRate, int zoomDirection ) {
        updateScreenScale();
        
        double deltaA = aRange*zoomRate/2;
        double deltaB = bRange*zoomRate/2;
    
        aMin += deltaA * zoomDirection;
        aMax -= deltaA * zoomDirection;
        
        bMin += deltaB * zoomDirection;
        bMax -= deltaB * zoomDirection;
        
        zoomCount += zoomDirection;

        paintImage();           
    }
    
    public void paintImage() {
        Graphics g = drawingPanel.getGraphics();
        Image img = getImage();
        g.drawImage(img, 0, 0, drawingPanel);
    }
    
    public Image getImage() {
        return null;
    }
}
