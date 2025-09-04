
clear
import delimited "author_variance.csv"

rename v13 pc10
rename v14 pc20
rename v15 pc50
rename v16 pc80
rename v17 pc90


encode gender_add, gen(gender_n)
gen counts_log = log(counts)
xtile female_p2 = female, n(2)

sum pc10 pc20 pc50 pc80 pc90

// Table 3

quiet reg variance ib2.gender_n first_pub_year counts_log career_length avg_authors first_authorship hindex pc90 pc80 i.main_field
eststo m0_n

quiet reg variance ib2.gender_n##c.female first_pub_year counts_log career_length avg_authors first_authorship hindex pc90 pc80 i.main_field
eststo m0_t

quiet reg variance ib2.gender_n first_pub_year counts_log career_length avg_authors first_authorship hindex pc90 pc80 i.main_field if female_p2 == 1
eststo m0_m

quiet reg variance ib2.gender_n first_pub_year counts_log career_length avg_authors first_authorship hindex pc90 pc80 i.main_field if female_p2 == 2
eststo m0_f

esttab m0_n m0_t m0_m m0_f, compress drop(*.main_field) stat(N r2) se(%8.3f)


// Figure 1

quiet reg variance ib2.gender_n##c.female first_pub_year counts_log career_length avg_authors first_authorship hindex pc90 pc80 i.main_field

margins i.gender_n, at(female_p=(0.1(0.1)0.7))

marginsplot

// Table 4 and Figure 2

quiet reg hindex c.variance c.variance#i.female_p2 ib2.gender_n#i.female_p2 c.variance#ib2.gender_n#ib1.female_p2 first_pub_year career_length avg_authors first_authorship counts_log i.main_field
eststo m1

margins i.gender_n if female_p2 == 1, at(variance=(0(1)5))
marginsplot

margins i.gender_n if female_p2 == 2, at(variance=(0(1)5))
marginsplot

quiet reg pc90 c.variance c.variance#i.female_p2 ib2.gender_n#i.female_p2 c.variance#ib2.gender_n#ib1.female_p2 first_pub_year career_length avg_authors first_authorship counts_log i.main_field
eststo m2

margins i.gender_n if female_p2 == 1, at(variance=(0(1)5))
marginsplot

margins i.gender_n if female_p2 == 2, at(variance=(0(1)5))
marginsplot

quiet reg pc80 c.variance c.variance#i.female_p2 ib2.gender_n#i.female_p2 c.variance#ib2.gender_n#ib1.female_p2 first_pub_year career_length avg_authors first_authorship counts_log i.main_field
eststo m3

quiet reg counts_log c.variance c.variance#i.female_p2 ib2.gender_n#i.female_p2 c.variance#ib2.gender_n#ib1.female_p2 first_pub_year career_length avg_authors first_authorship i.main_field hindex pc90 i.main_field
eststo m4

margins i.gender_n if female_p2 == 1, at(variance=(0(1)5))
marginsplot

margins i.gender_n if female_p2 == 2, at(variance=(0(1)5))
marginsplot

esttab m1 m2 m3 m4, compress drop(*.main_field) stat(N r2_a) se(%8.3f) label
