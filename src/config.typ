#let contents = yaml("config.yaml")

#let university() = contents.university;
#let faculty() = contents.faculty;
#let specialization() = contents.specialization;

#let author() = contents.author;
#let thesis() = contents.thesis;


#let year() = datetime.today().year();
#let today() = (
  datetime
    .today()
    .display(
      "[day padding:none].[month padding:none].[year]",
    )
)
