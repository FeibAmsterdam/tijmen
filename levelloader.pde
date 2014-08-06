class LevelLoader {

  public float tileSize = 32;

  public void loadLevel(String levelImageName, ArrayList<GameObject> levelList) {
    PImage levelImage = loadImage(levelImageName);

    for (int iX = 0; iX<levelImage.width; iX++)
      for (int iY = 1; iY<levelImage.height; iY++) {
        float spawnX = iX * tileSize, spawnY = iY * tileSize;

        if (levelImage.get(iX, iY) == color(0, 0, 0)) levelList.add(new WallTile(new PVector(spawnX, spawnY)));
        if (levelImage.get(iX, iY) == color(4, 50, 255)) levelList.add(new WaterTile(new PVector(spawnX, spawnY)));
        if (levelImage.get(iX, iY) == color(0, 249, 0)) levelList.add(new Player());
        //if (levelImage.get(iX, iY) == color(255, 0, 0)) levelList.add(new WallTile(new PVector(spawnX, spawnY)));
      }
  }
}
