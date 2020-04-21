# Cinema
## Choose useful attributes and relations


The STAR-MOVIES company operates a cinema chain with several cinemas (Name,
Address... ). Each cinema can have several halls where the films are shown. The seating plan of each hall should be recorded; a row and a seat must be indicated for each seat. A box should be managed like a row.
It must be possible to create a seating plan. Of course, several films can be shown per room on one day. In order to be able to determine which seats are available for a performance, each ticket purchase must be noted. Each ticket should show: cinema, hall, film title, date, starting time, serial number within the screening, row, seat, price.
Provision must be made for pricing: Each row of a hall has a standard price, but for certain performances the row prices can be set individually. For information purposes, the actors should be recorded with their personal data (surname, first name, nationality, date of birth, date of death, comments, ... ) and it should be possible to tell which actors have acted in which films.
The analogous statements should also be possible for directors, whereby it can be assumed that there is only one director for a film. However, it is possible that the director also plays a part in a film.
The other data of a film include: Title, type (thriller, western, youth film, ... ), year of production, country, language, duration, distribution, etc.

Create a ERD and a Relation Model for this example

## ERM:

![ER-Model](ermodel.jpeg)

* version 2

![Cinema 2](cinema2.jpeg)

## textual presentation (updated to version 2):

* Cinema (**cinema_ID:int**, *schedule_ID:int*, cinema_name:varchar(20), street:varchar(32), zip:varchar(5), city:varchar(15), number_of_halls:int)
* Hall (**hall_ID:int**, *plan_ID:int*, *schedule_ID:int*, number_of_rows:int, number_of_seats:int, feature:varchar(20))
* Row (**row_nr:int**, *plan_ID:int*, is_box:boolean, standard_price:double, special_price:double, number_of_seats:int)
* Seating Plan (**plan_ID:int**, hall_ID:int, row_nr:int, seat_nr:int)
* Schedule (**schedule_ID:int**, hall_ID:int, cinema_ID:int, film_ID:int, screening_date:date, starting_time:time, tickets_reserved:int, tickets_purchased:int)
* Ticket (**ticket_ID:varchar(20)**, *schedule_ID:int*, cinema:varchar(20), hall_ID:int, title:varchar(32), screening_date:date, starting_time:time, row:int, seat:int, price:double)
* Actor (**actor_ID:int**, *cast_ID:int*, first_name:varchar(20), last_name:varchar(20), nationality:varchar(20), birthday:date, date_of_death:date, further_comment:text(200))
* Director (**director_ID:int**, *cast_ID:int*, first_name:varchar(20), last_name:varchar(20), nationality:varchar(20), birthday:date, date_of_death:date, further_comment:text(200), is_acting:boolean)
* Castlist (**cast_ID:int**, film_ID:int, actor_ID:int, director_ID:int, role:varchar(32))
* Film (**film_ID:int**, *schedule_ID:int*, *cast_ID:int*, title:varchar(32), genre:varchar(20), year_of_production:year, country:varchar(20), language:varchar(20), duration:int, distribution:varchar(32))

(serial number of screening = schedule_ID)

## Cinema Schema

![Cinema](cinema_schema.jpg)