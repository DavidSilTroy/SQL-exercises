
#1.	Find, per year, the amount of players that have joined our club. 
select member_since, count(*) as 'Amount of players' from tennis.player group by member_since order by member_since;
select member_since, count(player_id) as 'Amount of players' from tennis.player group by 1 order by 1;


#2.	Find for each player that at least paid one fine, the player id, the average fine amount and a count of the amount of fines. 
select player_id, avg(amount_fine) as Average, count(*)  as 'Amount of fines'  from tennis.fine group by player_id;
select player_id, round(avg(amount_fine),2) as Average, count(amount_fine)  as 'Amount of fines'  from tennis.fine group by player_id;

#3.	Find for each team that plays in first division, the team number, the amount of competitions/games they’ve played and the amount of sets won. 
select team_id as 'Team number', count(competition_id) as 'Amount of games', sum(winner_sets) as 'Amount of sets won' 
from tennis.competition 
where team_id = (select team_id from tennis.team  where division = 'first') 
group by 1;

select t.team_id as 'Team number', count(*) as 'Amount of games', sum(winner_sets) from team where team;

#4.	Find the player id and the name of each player for whom at least one fine has been paid. The player may not be a team captain of a team in the first division.
#option 1:
select distinct tf.player_id, tp.name 
from tennis.fine tf  
join tennis.player tp 
on tp.player_id = tf.player_id 
where tf.player_id != 
		(
		select captain_id 
        from tennis.team 
        where division = 'first'
        );
#option 2:
select player_id, name from tennis.player where player_id in 
	(
	select distinct player_id from tennis.fine where player_id not in
			(
			select captain_id 
			from tennis.team 
			where division = 'first'
			)
	);

#5.	Find for each player living in Kasterlee, the name, initials and the amount of fines he or she received. 
#option 1:
select tp.name, tp.initials, count(tf.amount_fine) as 'Amount of fines' 
from tennis.player tp 
join tennis.fine tf 
on tp.player_id = tf.player_id 
where city = 'Kasterlee' 
group by tf.player_id;
#option 2:
select tp.name, tp.initials, count(*) as 'Amount of fines' 
from tennis.player tp 
join tennis.fine tf 
on tp.player_id = tf.player_id 
where city = 'Kasterlee' 
group by 1,2;

#6.	Find for each team, the team number, the division the team plays in and the amount of sets won. 
select tc.team_id, tt.division, sum(tc.winner_sets) as 'Amount of sets won' 
from tennis.competition tc 
join tennis.team tt 
on tc.team_id = tt.team_id 
group by tc.team_id;

select tc.team_id, tt.division, sum(tc.winner_sets) as 'Amount of sets won' 
from tennis.competition tc 
join tennis.team tt 
on tc.team_id = tt.team_id 
group by 1,2
order by 1;


#7.	Find the player id and the name of each player that has the same age as mr P. Henderickx (i.e. born in the same year). Mr. Henderickx is not included in the list! 
select player_id, name from tennis.player where year(birthdate) = 
	(
	select year(birthdate) 
    from tennis.player 
    where initials = 'P' 
    and name = 'Henderickx'
    ) and name != 'Henderickx';
select team_id from tennis.team;

#8.	What city has more than 4 residing players?
select city, count(*) as 'Total Players' from tennis.player group by 1;



select * from tennis.player;
select * from tennis.team;
select * from tennis.fine;
select * from tennis.competition;
select * from tennis.board_member;