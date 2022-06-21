#FROM tennis_MySQL_EN

############### WHERE FUNCTIONS ###############
#1.	Show the numbers of the players who joined the club in the period 2005-2010. 
#Sort the result by player number. (12 results)
select player_id from tennis.player where member_since between 2005 and 2010 order by player_id;

#2.	Show the payment number of each fine between €50 and €100. (5 results)
select fine_id from tennis.fine where amount_fine between 50 and 100;


#3.	Show the payment number of each fine that is not between €50 and €100. (3 results)
#select fine_id from tennis.fine where amount_fine not between 50 and 100;
select fine_id from tennis.fine where not(amount_fine between 50 and 100);

#4.	Show the numbers and dates of birth of the players born in 1997, 1998 or 2000. (10 results)
#select player_id, birthdate from tennis.player where birthdate REGEXP '1997|1998|2000';
select player_id, birthdate from tennis.player where date_format(birthdate, '%Y') in (1997,1998,200);

#5.	Show the numbers of the players who do not live in Geel or Kasterlee. (5 results)
select player_id from tennis.player where city not in ('Geel','Kasterlee');

#6.	Show the number and name of each player whose name contains the letter  
#combination ‘en’.  (5 results)
select player_id, name from tennis.player where name like '%en%';

#7.	Show the name and number of each player where the letter ‘a’ 
#is the second last letter of the name. Sort the result by name. (2 results)
select name, player_id from tennis.player where name like '%a_' order by name;

#8.	Show the number, name and initials of each player whose 
#name contains the letter ‘a’ at the second and second last position. (1 result)
select player_id,name,initials from tennis.player where name like '_a%a_';

#9.	Show the number and date of birth of each 
#player who does not have a bondnumber. (4 results)
select player_id, birthdate from tennis.player where bond_number is null;


############### SCALAR FUNCTIONS AND DISTINCT ###############

#1.	Show the last name of all players in capital letters. 
#Sort the result alphabetically by last name. (14 results)
select upper(name) from tennis.player order by name;

#2.	Show from all players the name and number of characters of that name. (14 results)
select name, length(name) as characters from tennis.player;

#3.	For each player living in Geel, show the initials, last name and 
#bondnumber. The initials must appear in lower case, the last name in 
#capitals. Initials and last name are shown in one column, separated by 
#a dot. Furthermore, it should not make any difference whether Geel is 
#listed in the database in lower case or in upper case, or in 
#combination of both. (7 results)
select concat(lower(initials),
		'.',
		upper(name)) as name ,
		bond_number 
        from tennis.player 
        where city = 'Geel';
        
#4.	For each player whose last name begins with a capital B, show the 
#number and the first letter of the initials of the player's name 
#followed by a dot and the player's last name. (3 results)        
select player_id, concat(initials, ". ",name) as name from tennis.player where name like "B%";

#5.	Show the numbers of the fines paid in 2019. (3 results)
select fine_id from tennis.fine where date_format( date_fine, '%Y') = 2019 ;

#6.	Show the payment number and the year of each fine paid after 2017. (6 results)
select fine_id from tennis.fine where date_format(date_fine, '%Y') > 2017;

#7.	Show the full name and bond number of each player living in Geel. If the bond number is not known, give the value 'no number'. (7 results)
select concat(initials, '. ',name) as name, ifnull(bond_number, 'no number') as boundnumber from tennis.player where city = 'Geel';

#8.	For each player with a player number less than 10, show the player number, date of birth and name of the day and month he or she was born. (4 results).
select player_id, birthdate, date_format(birthdate,'%W') as weekday , date_format(birthdate,'%M') as month from tennis.player where player_id<10;        

#9.	Show an overview of all match players in the following way: "Player 'Engelen' was born on 01/09/1997, lives in GEEL and has bondnumber 2411". (10 results)
select concat("Player '", name, "' was born on ", date_format(birthdate,'%d/%m/%Y'), ', lives in ', upper(city), ' and has bondnumber ', bond_number) as matchplayer from tennis.player where bond_number is not null;

#10.	Show the details of players' fines in the following form: Player 6 has had the following fine: 100. No decimals after the comma. (8 results)
select concat("Player ", player_id, "has had the following fine: ", round(amount_fine,0)) as "players'fine" from tennis.fine;

#11.	Show each player his name and count the number of months between today and the player's date of birth. Sort the result by the number of months. (14 results)
select name, timestampdiff(MONTH, birthdate,curdate()) as months_lived from tennis.player;
#select name, timestampdiff(DAY, birthdate,curdate()) as months_lived from tennis.player;
#select name, timestampdiff(YEAR, birthdate,curdate()) as months_lived from tennis.player;

#12.	For each fine, show the player number, the fine and the fine increased by 15% as a whole number. (8 results)
select player_id,amount_fine as fine, round(amount_fine+(amount_fine*15/100), 0) as "new fine" from tennis.fine;

#13.	Of all fines, show the payment number, the player number that has had the fine and the date the fine comes before the board, which is 3 months after the player has had the fine. (8 results)
select fine_id, player_id, date_add(date_fine, interval 3 month) as "day of board" from tennis.fine;

#14.	Show the numbers of the players who have been fined. Sort the result by player number. Each player number may only be shown once. (5 results)
select distinct player_id from tennis.fine order by player_id;

#15.	Show all years since 2000 in which players have joined the club. Sort the result by year. Each year may only be shown once. (7 results)
select distinct member_since from tennis.player where member_since >= 2000 order by member_since;

#16.	Show all player numbers that were once treasurer on the board. Sort the result by player number. Each player number may only be shown once. (4 results)
select player_id from tennis.board_member where position= "treasurer";






select * from tennis.fine;
select * from tennis.player;

