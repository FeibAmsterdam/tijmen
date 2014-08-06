import java.util.*;

class LevelLoader {

  public float tileSize = 32;
  String levelTypes[];
  PImage levelImage;
  HashMap<Integer, Class> colorTypeMap = new HashMap<Integer, Class>();
  HashMap<Integer, String> colorArgsMap = new HashMap<Integer, String>();

  private void generateColorTypeMap(){
    for (int iX = 0; iX<levelImage.width; iX++){
      color pixelColor = levelImage.get(iX, 0);

      if (pixelColor != color(0, 0, 0, 0)){
        try
        {
          if (iX < levelTypes.length){
            String type = levelTypes[iX], args = null;
            if(type.indexOf('(') > 0) {
              args = type.substring(type.indexOf('(')+1, type.length()-1);
              type = type.substring(0, type.indexOf('('));
            }
            colorTypeMap.put(pixelColor, Class.forName("tijmen$" + type));
            colorArgsMap.put(pixelColor, args);
          }
        }
        catch (ClassNotFoundException e)
        {
          println("Unknown class: " + levelTypes[iX]);
        }
      }
    }
  }

  GameObject getGameObjectFromColor(color pixelColor){
    Class cl = null;

    if (colorTypeMap.containsKey(pixelColor))
      cl = colorTypeMap.get(pixelColor);
    else
      return null;

    GameObject go = null;

    try
    {
      // Get the constructor(s)
      java.lang.reflect.Constructor[] ctors = cl.getDeclaredConstructors();
      // Create an instance with the parent object as parameter (needed for inner classes)
      go = (GameObject)ctors[0].newInstance(new Object[] { tijmen.this });
      go.parseArgs( colorArgsMap.get(pixelColor) );
    }
    catch (InstantiationException e)
    {
      println("Cannot create an instance of " + cl.getName());
    }
    catch (IllegalAccessException e)
    {
      println("Cannot access " + cl.getName() + ": " + e.getMessage());
    }
    catch (Exception e) // Lot of stuff can go wrong...
    {
      e.printStackTrace();
    }

    return go;
  }

  public void loadLevel(String levelName, Level level) {

    String levelImageName = levelName + ".png",
    typeFileName = levelName + ".txt";

    levelTypes = loadStrings(typeFileName);
    levelImage = loadImage(levelImageName);


    generateColorTypeMap();

    for (int iX = 0; iX<levelImage.width; iX++){
      for (int iY = 1; iY<levelImage.height; iY++) {
        float spawnX = iX * tileSize, spawnY = iY * tileSize;
        color pixelColor = levelImage.get(iX, iY);
        if (pixelColor != 0){
         GameObject go = getGameObjectFromColor(pixelColor);
          if (go != null){
            go.position = new PVector(iX*tileSize, iY*tileSize);
            if(go instanceof Player) {
              player = (Player)go;
              level.cam.position = player.position;
            }
            level.add(go);
          }
        }
      }
    }
  }
}
