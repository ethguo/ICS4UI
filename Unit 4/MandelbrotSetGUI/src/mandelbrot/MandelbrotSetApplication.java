
package mandelbrot;


import java.awt.Graphics;
import java.awt.Graphics2D;
import java.awt.event.KeyEvent;


public class MandelbrotSetApplication extends javax.swing.JFrame implements Runnable {
    
    MandelbrotSetDrawingCanvas mandelbrotSetCanvas;
    JuliaSetDrawingCanvas juliaSetCanvas;
    
    int threshold = 255;
    double zoomRate = 0.1;
    int numDigitsToDisplay = 3;
    
    public MandelbrotSetApplication() {
        initComponents();
        
        mandelbrotSetCanvas = new MandelbrotSetDrawingCanvas( -1.5,0.5,-1,1, 255,mandelbrotPanel);
        mandelbrotSetCanvas.paintImage();
        
        juliaSetCanvas = new JuliaSetDrawingCanvas( -1, 1, -1, 1, 255, juliaSetPanel);
        juliaSetCanvas.paintImage(0, 0);
    }
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        drawButton = new javax.swing.JButton();
        mandelbrotPanel = new javax.swing.JPanel();
        juliaSetPanel = new javax.swing.JPanel();
        cLabel = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        cDisplay = new javax.swing.JTextField();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);

        drawButton.setBackground(new java.awt.Color(51, 255, 51));
        drawButton.setFont(new java.awt.Font("Optima", 0, 18)); // NOI18N
        drawButton.setForeground(new java.awt.Color(0, 0, 255));
        drawButton.setText("Restart");
        drawButton.setActionCommand("draw");
        drawButton.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                drawButtonActionPerformed(evt);
            }
        });

        mandelbrotPanel.setBackground(new java.awt.Color(0, 0, 0));
        mandelbrotPanel.setBorder(javax.swing.BorderFactory.createMatteBorder(1, 1, 1, 1, new java.awt.Color(255, 0, 255)));
        mandelbrotPanel.addMouseMotionListener(new java.awt.event.MouseMotionAdapter() {
            public void mouseMoved(java.awt.event.MouseEvent evt) {
                mandelbrotPanelMouseMoved(evt);
            }
        });
        mandelbrotPanel.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                mandelbrotPanelMouseClicked(evt);
            }
            public void mouseEntered(java.awt.event.MouseEvent evt) {
                mandelbrotPanelMouseEntered(evt);
            }
        });
        mandelbrotPanel.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyTyped(java.awt.event.KeyEvent evt) {
                mandelbrotPanelKeyTyped(evt);
            }
            public void keyPressed(java.awt.event.KeyEvent evt) {
                mandelbrotPanelKeyPressed(evt);
            }
        });

        javax.swing.GroupLayout mandelbrotPanelLayout = new javax.swing.GroupLayout(mandelbrotPanel);
        mandelbrotPanel.setLayout(mandelbrotPanelLayout);
        mandelbrotPanelLayout.setHorizontalGroup(
            mandelbrotPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );
        mandelbrotPanelLayout.setVerticalGroup(
            mandelbrotPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 400, Short.MAX_VALUE)
        );

        juliaSetPanel.setBackground(new java.awt.Color(0, 0, 0));
        juliaSetPanel.setBorder(javax.swing.BorderFactory.createMatteBorder(1, 1, 1, 1, new java.awt.Color(51, 153, 0)));
        juliaSetPanel.setMaximumSize(new java.awt.Dimension(400, 400));
        juliaSetPanel.setSize(new java.awt.Dimension(400, 400));

        javax.swing.GroupLayout juliaSetPanelLayout = new javax.swing.GroupLayout(juliaSetPanel);
        juliaSetPanel.setLayout(juliaSetPanelLayout);
        juliaSetPanelLayout.setHorizontalGroup(
            juliaSetPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 398, Short.MAX_VALUE)
        );
        juliaSetPanelLayout.setVerticalGroup(
            juliaSetPanelLayout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGap(0, 0, Short.MAX_VALUE)
        );

        cLabel.setBackground(new java.awt.Color(0, 51, 255));
        cLabel.setForeground(new java.awt.Color(0, 51, 255));
        cLabel.setText("c = ");

        jLabel5.setFont(new java.awt.Font("Lucida Handwriting", 1, 18)); // NOI18N
        jLabel5.setText("Mandelbrot set");

        jLabel6.setFont(new java.awt.Font("Lucida Handwriting", 1, 18)); // NOI18N
        jLabel6.setText("Corresponding Julia set");

        jLabel1.setText("Click anywhere in the Mandelbrot window");

        jLabel2.setText("UP ARROW = ZOOM IN");
        jLabel2.setToolTipText("");

        jLabel3.setText("to re-center the window around that point");

        jLabel4.setText("DOWN ARROW = ZOOM OUT");

        cDisplay.setBackground(new java.awt.Color(238, 238, 238));
        cDisplay.setForeground(new java.awt.Color(51, 51, 255));
        cDisplay.setText("0 + 0i");

        jLabel8.setText("RIGHT ARROW = ZOOM IN");

        jLabel9.setText("LEFT ARROW = ZOOM OUT");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(cLabel)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(cDisplay, javax.swing.GroupLayout.PREFERRED_SIZE, 298, javax.swing.GroupLayout.PREFERRED_SIZE))
                    .addComponent(mandelbrotPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addGap(18, 18, 18)
                .addComponent(juliaSetPanel, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(9, Short.MAX_VALUE))
            .addGroup(layout.createSequentialGroup()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(121, 121, 121)
                        .addComponent(jLabel5)
                        .addGap(231, 231, 231)
                        .addComponent(jLabel6))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(50, 50, 50)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel2)
                                    .addComponent(jLabel4))
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                                .addComponent(drawButton)
                                .addGap(107, 107, 107)
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel8)
                                    .addComponent(jLabel9))
                                .addGap(63, 63, 63))
                            .addGroup(layout.createSequentialGroup()
                                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                                    .addComponent(jLabel1)
                                    .addComponent(jLabel3))
                                .addGap(0, 0, Short.MAX_VALUE)))))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(jLabel5)
                    .addComponent(jLabel6))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                    .addComponent(cLabel)
                    .addComponent(cDisplay, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(juliaSetPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addComponent(mandelbrotPanel, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel2)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jLabel4))
                    .addGroup(layout.createSequentialGroup()
                        .addGap(2, 2, 2)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addComponent(drawButton)
                            .addGroup(layout.createSequentialGroup()
                                .addComponent(jLabel8)
                                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                                .addComponent(jLabel9)))))
                .addGap(27, 27, 27)
                .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 16, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(2, 2, 2)
                .addComponent(jLabel3)
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    // Animation
    
    int x1 = 0;
    int y1 = 0;
    double t = 0;
    Thread runner;
    
    public void init() {
        
    }
    
    public void paint(Graphics screen) {
        super.paint(screen);
        Graphics2D screen2D = (Graphics2D) screen;
        
        double ja = (2 * Math.cos(t) - Math.cos(2 * t)) / 3.9;
        double jb = (2 * Math.sin(t) - Math.sin(2 * t)) / 3.9;
        
        juliaSetCanvas.paintImage( ja, jb );
    }
    
    

    public void start() {
        if (runner == null) {
            runner = new Thread(this);
            runner.start();
        }
    }

    public void run() {
        Thread thisThread = Thread.currentThread();
        while (runner == thisThread) {
            repaint();
            t += 0.1;
            if (t >= 2*Math.PI)
                t = 0;
            try {
                Thread.sleep(100);
            } catch (InterruptedException e) { }
        }
    }

    public void stop() {
        if (runner != null) {
            runner = null;
        }
    }
    
    // Original code below
    
    private void drawButtonActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_drawButtonActionPerformed
        numDigitsToDisplay = 3;
        
        mandelbrotSetCanvas.resetRanges();
        mandelbrotSetCanvas.paintImage();

        juliaSetCanvas.resetRanges();
        juliaSetCanvas.paintImage(0, 0);
    }
        
    { 
    }//GEN-LAST:event_drawButtonActionPerformed

    
    private void mandelbrotPanelMouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_mandelbrotPanelMouseClicked
        int xMouse = evt.getX();
        int yMouse = evt.getY();
        
        mandelbrotSetCanvas.centerScreenAboutPoint(xMouse, yMouse);        
    }
    
    {
    }//GEN-LAST:event_mandelbrotPanelMouseClicked

    
    private void mandelbrotPanelMouseMoved(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_mandelbrotPanelMouseMoved
        int xMouse = evt.getX();
        int yMouse = evt.getY();
        
        double cReal = mandelbrotSetCanvas.aMin + xMouse * mandelbrotSetCanvas.unitsPerPixelX;
        double cImag = mandelbrotSetCanvas.bMax - yMouse * mandelbrotSetCanvas.unitsPerPixelY;
        
        cDisplay.setText( formatComplexNumber( cReal, cImag ) );
        
        juliaSetCanvas.paintImage( cReal, cImag );       
    }//GEN-LAST:event_mandelbrotPanelMouseMoved

       
    private void mandelbrotPanelKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_mandelbrotPanelKeyPressed
        if (evt.getKeyCode() == KeyEvent.VK_UP) { 
            mandelbrotSetCanvas.zoom( zoomRate, 1 );  //zoom in
            adjustNumberOfDigitsInDisplayOfC();
        }
        
        else if (evt.getKeyCode() == KeyEvent.VK_DOWN) {
            mandelbrotSetCanvas.zoom( zoomRate, -1 );   //zoom out
            adjustNumberOfDigitsInDisplayOfC();
        }
        
        else if (evt.getKeyCode() == KeyEvent.VK_RIGHT) { 
            juliaSetCanvas.zoom( zoomRate, 1 );  //zoom in
        }
        
        else if (evt.getKeyCode() == KeyEvent.VK_LEFT) {
            juliaSetCanvas.zoom( zoomRate, -1 );   //zoom out
        }
    }//GEN-LAST:event_mandelbrotPanelKeyPressed

        
    //Increase or decrease the number of digits of c to be displayed if the user has zoomed in or out enough.
    public void adjustNumberOfDigitsInDisplayOfC() {  
        if ( Math.pow(1-zoomRate, mandelbrotSetCanvas.zoomCount) <= 0.1) { 
            numDigitsToDisplay++;
            mandelbrotSetCanvas.zoomCount = 0;
        }
        else if ( Math.pow(1+zoomRate, -mandelbrotSetCanvas.zoomCount) >= 10) {
            numDigitsToDisplay--;
            mandelbrotSetCanvas.zoomCount = 0;
        } 
    }
    
    
    private void mandelbrotPanelKeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_mandelbrotPanelKeyTyped
        
    }//GEN-LAST:event_mandelbrotPanelKeyTyped

    private void mandelbrotPanelMouseEntered(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_mandelbrotPanelMouseEntered
        mandelbrotPanel.requestFocusInWindow();
    }//GEN-LAST:event_mandelbrotPanelMouseEntered

    
    public String formatComplexNumber( double cReal, double cImag ) {
        double tensPower = Math.pow(10, numDigitsToDisplay);
        
        double cRealRounded = Math.round(cReal*tensPower)/tensPower;        
        double cImagRounded = Math.round(cImag*tensPower)/tensPower;
        
        String cDisplay;
        if (cImagRounded < 0)
            cDisplay = cRealRounded + " -" + " " + (-cImagRounded) + "i";
        else
            cDisplay = cRealRounded + " +" + " " + cImagRounded + "i";
        return cDisplay;                
    }
    
    
    public static void main(String args[]) {
        
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MandelbrotSetApplication.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MandelbrotSetApplication.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MandelbrotSetApplication.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MandelbrotSetApplication.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                MandelbrotSetApplication m = new MandelbrotSetApplication();
                m.start();
                m.setVisible(true);
            }
        });
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JTextField cDisplay;
    private javax.swing.JLabel cLabel;
    private javax.swing.JButton drawButton;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel juliaSetPanel;
    private javax.swing.JPanel mandelbrotPanel;
    // End of variables declaration//GEN-END:variables
}
