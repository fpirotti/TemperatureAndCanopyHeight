library(rgee)
ee_Initialize()

canopy_height = ee$Image("users/nlang/ETH_GlobalCanopyHeight_2020_10m_v1");
print( canopy_height$getInfo() )
 
studyArea = ee$FeatureCollection("projects/spatial-logic-417507/assets/studyAreas")

canopy_height_clipped = canopy_height$clip(studyArea)

task_img <- ee_image_to_drive(
  image = canopy_height_clipped,
  fileFormat = "GEO_TIFF",
  region = studyArea,
  fileNamePrefix = "my_image_demo",
  scale = 1000
)
task_img$start()
ee_monitoring(task_img)
