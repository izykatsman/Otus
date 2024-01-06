select sum(points), year_game FROM statistic
group by year_game
order by year_game;


WITH year_points AS (
    select sum(points), year_game from statistic
group by year_game
)

select sum(points), year_game FROM year_points
order by year_game;

WITH year_points AS (
    select sum(points) amount, year_game from statistic
group by year_game
order by year_game
)

select *, LAG(amount,1) OVER (
    ORDER BY year_game
  ) previous_year_points
  FROM year_points