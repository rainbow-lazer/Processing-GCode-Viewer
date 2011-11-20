// unlekker.modelbuilder example
// Marius Watz, 2011
// http://workshop.evolutionzone.com

// Construct 3D ribbon as a QUAD_STRIP

import unlekker.util.*;
import unlekker.modelbuilder.*;

MouseNav3D nav;

UVertexList model;

String[] gCode;
float x = 0, y = 0, z = 0;
float px = 0, py = 0, pz = 0;
int lineNum = 0;

void setup() {
      size(600, 600, P3D);
      noFill();
      stroke( color( 0, 100 ) );
      // add MouseNav3D navigation
      nav=new MouseNav3D(this);
      nav.trans.set(width/2, height/2, 0);

      buildModel();
}

void draw() {
      background(255);

      lights();

      // call MouseNav3D transforms
      nav.doTransforms();
      
      drawMe( model, this);
}

public void mouseDragged() {
      nav.mouseDragged();
}

