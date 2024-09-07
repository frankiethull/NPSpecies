
<!-- README.md is generated from README.Rmd. Please edit that file -->

# NPSpecies

<!-- badges: start -->
<!-- badges: end -->

NPSpecies contains “Information on Species in National Parks”. The
dataset was collected across all park listed here:
<https://irma.nps.gov/NPSpecies/Search/SpeciesList>

## Installation

You can install the development version of NPSpecies like so:

``` r
devtools::install_github("frankiethull/NPSpecies")
```

## Example

This showcases the data format of what is typically downloaded through
the NPSpecies GUI. The GUI only allows one park to be downloaded at a
time. Here, we have all data for all parks. Allowing for quite a bit of
exploratory data analysis across NPS.

filtering for the most observed reptiles at Great Sand Dunes National
Park and Preserve:

``` r
library(NPSpecies)
library(tinytable)

NPSpecies::species |>
    dplyr::filter(ParkCode == "GRSA") |>
    dplyr::filter(CategoryName == "Reptile") |>
    dplyr::select(ParkName, CategoryName, Family, SciName, CommonNames, Observations) |>
    dplyr::arrange(
      dplyr::desc(Observations)
      ) |>
    head(3) |>
    tt()
```

| ParkName                                    | CategoryName | Family     | SciName              | CommonNames                                          | Observations |
|---------------------------------------------|--------------|------------|----------------------|------------------------------------------------------|--------------|
| Great Sand Dunes National Park and Preserve | Reptile      | Colubridae | Thamnophis elegans   | Western Terrestrial Garter Snake                     | 11           |
| Great Sand Dunes National Park and Preserve | Reptile      | Iguanidae  | Sceloporus undulatus | eastern fence lizard, plateau lizard, prairie lizard | 2            |
| Great Sand Dunes National Park and Preserve | Reptile      | Colubridae | Pituophis catenifer  | bull snake                                           | 1            |

filtering for top 5 most observed non-native species at Everglades
National Park:

``` r
library(NPSpecies)

NPSpecies::species |>
    dplyr::filter(ParkCode == "EVER") |> 
    dplyr::filter(Nativeness == "Non-native") |>
    dplyr::select(ParkName, CategoryName, Family, SciName, CommonNames, Observations) |>
    dplyr::arrange(desc(Observations)) |>
    head(5) |>
    tt()
```

| ParkName                 | CategoryName | Family              | SciName                        | CommonNames                                                                               | Observations |
|--------------------------|--------------|---------------------|--------------------------------|-------------------------------------------------------------------------------------------|--------------|
| Everglades National Park | Reptile      | Dactyloidae         | Anolis sagrei                  | Brown Anole, Cuban Brown Anole                                                            | 99           |
| Everglades National Park | Amphibian    | Hylidae             | Osteopilus septentrionalis     | Cuban Treefrog                                                                            | 45           |
| Everglades National Park | Amphibian    | Eleutherodactylidae | Eleutherodactylus planirostris | Greenhouse Frog                                                                           | 11           |
| Everglades National Park | Reptile      | Gekkonidae          | Hemidactylus mabouia           | Afroamerican house gecko, Afro-American House Gecko, Cosmopolitan House Gecko, Wood Slave | 6            |
| Everglades National Park | Reptile      | Gekkonidae          | Hemidactylus garnotii          | Fox Gecko, Indopacific Gecko, Indo-Pacific Gecko, Indo-Pacific House Gecko                | 1            |

most observed bird species by park:

``` r
NPSpecies::species |>
  dplyr::filter(CategoryName == "Bird") |> 
  dplyr::group_by(ParkName) |>
  dplyr::select(ParkName, CommonNames, Observations) |>
  dplyr::arrange(desc(Observations)) |>
  dplyr::slice(1) |>
  dplyr::ungroup() |>
  dplyr::arrange(desc(Observations)) |> 
  head(10) |> # only display 10
  tt()
```

| ParkName                                                                            | CommonNames                          | Observations |
|-------------------------------------------------------------------------------------|--------------------------------------|--------------|
| Great Smoky Mountains National Park                                                 | Ovenbird                             | 8063         |
| Saguaro National Park                                                               | cactus wren                          | 2780         |
| Sequoia and Kings Canyon National Parks                                             | Dark-eyed Junco                      | 2543         |
| Casa Grande Ruins National Monument                                                 | Mourning Dove, WESTERN MOURNING DOVE | 1555         |
| Yosemite National Park                                                              | Oregon junco                         | 1422         |
| Valley Forge National Historical Park                                               | American robin                       | 1308         |
| Mesa Verde National Park                                                            | Red-tailed Hawk                      | 1091         |
| Mount Rainier National Park                                                         | Marbled Murrelet                     | 1046         |
| Kenai Fjords National Park                                                          | Hermit thrush                        | 890          |
| Fredericksburg and Spotsylvania County Battlefields Memorial National Military Park | tufted titmouse                      | 827          |

##### citation:

- *this package is static data, as of Labor Day 2024, for EDA
  purposes*  
  NPSpecies - The National Park Service biodiversity database.  
  <https://irma.nps.gov/npspecies/>  
  Accessed September 2nd, 2024
