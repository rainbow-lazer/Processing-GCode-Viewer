void buildModel() {

      //load the ggcode file
      gCode = loadStrings( dataPath("gCode-tight.nc") );    

      model = new UVertexList();

        
      for ( int i = 0; i < gCode.length; i++ ) {
            //parse each line. if there's a new x, y, or z value, update it
            //otherwise carry over the previously set value
            parseLine( lineNum, gCode );
            lineNum++;
            
            model.add(px, py, pz);
            model.add(x, y, z);
            
            px = x;
            py = y;
            pz = z; 
      }
      model.calcBounds();
      println( model.bb );
      
      model.center();

}

void parseLine( int lineNum, String[] lines ) { 
      //grab the current line
      String codeLine = lines[ lineNum ];

      //parse for X, Y, Z
      //assume there's a space between coordinates, eg "G0 X3.25 Y0.12 Z4.125"
      String[] coords = trim( split( codeLine, " " ) );
      
      //look at each part of the line that was divided at the space
      for ( int s = 0; s < coords.length; s++ ) {
            
            String word = trim( coords[s] );
            println( word );
            char first = word.charAt(0);

            switch( first ) {

            case 88: //X
                  x = float( word.substring( 1, coords[s].length() ) );
                  break;

            case 89: //Y
                  y = float( word.substring( 1, coords[s].length() ) );
                  break; 

            case 90: //Z
                  z = float( word.substring( 1, coords[s].length() ) );
                  break;
            }
      }
}

void drawMe( UVertexList ptList, PApplet _this ){
      
      beginShape(LINES);
            model.drawVertices( _this );
      endShape();      
      
}

