import java.util.*;

class LevelLoader {

  public float tileSize = 32;
  String levelTypes[];
  PImage levelImage;
  HashMap<Integer, Class> colorTypeMap = new HashMap<Integer, Class>();

  private void generateColorTypeMap(){
    for (int iX = 0; iX<levelImage.width; iX++){
      color pixelColor = levelImage.get(iX, 0);

      if (pixelColor != color(0, 0, 0, 0)){
        try
        {
          if (iX < levelTypes.length){
            colorTypeMap.put(pixelColor, Class.forName("tijmen$" + levelTypes[iX]));
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
            level.add(go);
          }
        }
      }
    }
  }
}
