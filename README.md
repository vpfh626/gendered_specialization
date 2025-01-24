# gendered_specialization

The data is merged by utilizing various publicly accessible repositories.
Data collection process is explained here:
1) University names were collected from the US News report, retrievable from https://www.usnews.com/best-colleges/rankings/national-universities?study=Social+Sciences&_sort=rank&_sortDirection=asc.
2) Author names in U.S. universities and their associated publication information were obtained from Scopus API (See the link: https://dev.elsevier.com/documentation/SCOPUSSearchAPI.wadl)
3) I then merged with journal prestige information, which was gathered from https://www.scimagojr.com/journalrank.php.
4) Gender estimations based on first and middle names were derived from the US Census 1990 dataset, available at https://www.census.gov/topics/population/genealogy/data/1990_census/1990_census_namefiles.html.
