select pl.name, fi.amount_fine, fi.date_fine from tennis.player pl join tennis.fine fi on pl.player_id = fi.player_id;


#1.	Find for every team, the number of the team and the name and initials of every captain. (2 results).
select tt.team_id, tp.name, tp.initials from tennis.team tt join tennis.player tp on tt.captain_id = tp.player_id;

#2.	Find for every competition, the competion id, the name and the initials of the player and the team number. Order the result on competition id (13 results)
select tc.competition_id, tp.name, tp.initials, tc.team_id from tennis.competition tc join tennis.player tp on tc.player_id = tp.player_id;

#3.	Find for every competition, the competion id, the name and the initials of the player and the division in which the team plays. Order the result by competition id. (13 results). 
select tc.competition_id, tp.name, tp.initials, tt.division  from tennis.competition tc join tennis.player tp on tc.player_id = tp.player_id join tennis.team tt on tt.team_id = tc.team_id order by tc.competition_id;

#4.	Find for every fine which is payed by a team captain, the fine number and the name of the captain. (3 results).
select tf.fine_id, tp.name from tennis.fine tf join tennis.player tp on tf.player_id = tp.player_id join tennis.team tt on tp.player_id = tt.captain_id;

#5.	Find the names of the captains whom already received a fine. Each name may only occur onece! Order alphabetically. (2 results).
select distinct tp.name from tennis.fine tf join tennis.player tp on tp.player_id = tf.player_id join tennis.team tt on tp.player_id = tt.captain_id order by tp.name;

#6.	Find all the names and initials of the players that have played at least one competition. Each name may only occur once in the list. Sort alphabetically based on the name column. (9 results).
select distinct tp.name, tp.initials from tennis.competition tc join tennis.player tp on tc.player_id = tp.player_id order by tp.name;

#7.	Find the fine number, the name and the date of each fine payed in 2019. (3 results)
select tf.fine_id, tp.name, tf.date_fine from tennis.fine tf join tennis.player tp on tf.player_id = tp.player_id where date_format(tf.date_fine, '%Y') like 2019;

#8.	Find the player id, name and position of the board members that hold an active postition. Order by position. (5 results).
select tp.player_id, tp.name, tb.position from tennis.board_member tb join tennis.player tp on tb.player_id = tp.player_id where tb.end_date is null order by tb.position;

#9.	Find for all players the player id and a list with all payed fines for each player.  Watch the screenshot below carefully to see how you need to format the result! Order first by player id and next by date. (17 results)
select tp.player_id as "Player ID", tp.name as "Name", ifnull( tf.date_fine, "-") as "Date", ifnull(tf.amount_fine, "0.00") as "Amount" from tennis.fine tf right join tennis.player tp on tf.player_id = tp.player_id;

#10. Find for all the competitive players the player id, the name and the team numbers for which they played. No doubles are allowed in the list. Order by player id. (11 results).
select distinct tp.player_id, tp.name, tc.team_id from tennis.competition tc right join tennis.player tp on tc.player_id = tp.player_id order by tp.player_id;


select * from tennis.competition;
select * from tennis.player;
