## code to prepare `DATASET` dataset goes here

library('drake')

dataset_plan <- drake::drake_plan(
  dataset = mtcars,
  output = usethis::use_data(dataset, overwrite = TRUE)
)

drake::make(dataset_plan)
