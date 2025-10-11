#import "src/config.typ" as config

#show: config.defaults

#include "src/cover.typ"

#include "src/title.typ"

#include "src/assignment.typ"

#[
  #show: config.main

  #[
    #show: config.introduction

    #include "src/declarations.typ"

    #include "src/outlines.typ"
  ]

  #set page(numbering: "1")

  #[
    #show: config.body

    #include "src/introduction.typ"

    #include "src/01_Identifikace_IS.typ"

    #include "src/02_Specifikace_pozadavku_IS.typ"

    #include "src/03_Navrh_implementace_IS.typ"

    #include "src/04_Bezpecnost_IS.typ"

    #include "src/05_Zhodnoceni.typ"
  ]

  #[
    #show: config.conclusion

    #include "src/conclusion.typ"
  ]
]
