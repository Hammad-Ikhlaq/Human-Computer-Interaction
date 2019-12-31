use master
drop database ATDB
create database ATDbN
use ATDBf
select * from watchlist
select * from shows
create table [User]
(
	u_id int primary key,
	username varchar(15) unique,
	[name] varchar(30) not null,
	[password] char(15) not null, --a password of max 15 letters is being allowed so it will take a specific size.
	email_add varchar(40) unique not null,--no user can use name email id for 2 accounts
	age int not null, 
	gender char not null,
	country varchar(30),
	CHECK (age>=13),
	CHECK (gender = 'M' Or gender = 'F')
)

insert into [User](u_id,username,[name],email_add,[password],age,gender,country)
values
(1,'Abdullah98','Abdullah','l164085@lhr.nu.edu.pk','password',19,'M','PAKISTAN'),
(2,'Badar07','Badar','l164304@lhr.nu.edu.pk','password12',20,'M','INDIA'),
(3,'Amna87','amna','email@gmail.pk','password',13,'F','USA')
Go
select * from [User]
select * from [Login]
                CREATE PROCEDURE logout @uname varchar(15)
				as begin
				 Delete from [Login] where username = @uname;
				 end
create table [Login]	--used for login
(
	u_id int primary key,
	email_add varchar(40) not null unique, --no user can use name email id for 2 accounts
	username varchar(15) unique,
	[password] char(15) not null, --a password of max 15 letters is being allowed so it will take a specific size.
	Foreign key(u_id) references [USER](u_id) on Delete cascade on update cascade,
	Foreign key(email_Add) references [USER](email_add) on Delete no action on update no action
	-- no action due to error since email id is not primary but a unique key in user table
	--many people can have the same password hence it wont be a primary or uniqye key, nor will it be foreign key here.
)
insert into [Login](u_id,email_add,[password])
values
(1,'l164085@lhr.nu.edu.pk','password'),
(3,'email@gmail.pk','password')
Go
delete from [Login]
select * from [Login] 
create table Actors
(
	a_id int primary key,
	[name] varchar(35) not null,
	b_city varchar(20), 
	d_city varchar(20),
	--b_city in which the actor was born in and d_city is the city in which he/she died.
	b_day date,
	d_day date,
	-- d_day is date of death and b_day is date of birth
	 --for which awards where they nominated for
	gender char not null,
	[description] varchar(200),
	CHECK(gender = 'M' OR gender  = 'F')
)

insert into Actors(a_id,[name],b_city,b_day,gender,[description])
values
(1,'Robert Downey Jr.','Manhattan','4-4-1965','M','Robert Downey Jr. has evolved into one of the most respected actors in Hollywood. ')
create table Directors
(
	d_id int primary key,
	[name] varchar(35) not null,
	b_city varchar(20), 
	d_city varchar(20),
	--b_city in which the actor was born in and d_city is the city in which he/she died.
	b_day date,
	d_day date,
	-- d_day is date of death and b_day is date of birth
	 --for which awards where they nominated for
	gender char not null,
	[description] varchar(200),
	CHECK(gender = 'M' OR gender  = 'F')
)

insert into Directors(d_id,[name],b_city,b_day,gender,[description])
values
(1,'Jon Favreau','NY','1966/10/19','M','Initially an indie film favorite')


create table Production_house
(
	p_id int primary key,
	[name] varchar(35) not null,
	[description] varchar(200),
)
insert into Production_house(p_id,[name],[description])
values
(1,'Marvel','Comics')

create table writers
(
	w_id int primary key,
	[name] varchar(35) not null,
	b_city varchar(20), 
	d_city varchar(20),
	--b_city in which the actor was born in and d_city is the city in which he/she died.
	b_day date,
	d_day date,
	-- d_day is date of death and b_day is date of birth
	 --for which awards where they nominated for
	gender char not null,
	[description] varchar(200),
	CHECK(gender = 'M' OR gender  = 'F')
)

insert into writers(w_id,[name],gender,[description])
values
(1,'Mark Fergus','M','Mark Fergus is a writer and producer, known for Children of Men (2006), Iron Man (2008) and The Expanse (2015).')

create table movies
(	m_id int primary key,
	m_name varchar(30) not null,
	release_date date not null, 
	rating int not null,
	[description] varchar(200),	
	g_id int	--genre id
	Foreign key (g_id) references [genre](g_id) on Delete cascade on update cascade,
)

Insert into genre
values
(1,'Comedy'),
(2,'Sci-Fi'),
(3,'Horror'),
(4,'Romance'),
(5,'Action'),
(6,'Thriller'),
(7,'Drama'),
(8,'Mystery'),
(9,'Crime'),
(10,'Animation'),
(11,'Adventure'),
(12,'Fantasy'),
(13,'Comedy-Romance'),
(14,'Action-Comedy'),
(15,'SuperHero')

Insert into movies(m_id,m_name,release_date,rating,[description],g_id)
values
(2,'Avengers: Infinity War','2018/04/27',9,'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.', 5)

create table movie_p
(
	m_id int,
	p_id int not null,
	primary key(m_id,p_id),
	Foreign key (p_id) references [Production_house](p_id) on Delete cascade on update cascade,
	Foreign key (m_id) references [movies](m_id) on Delete cascade on update cascade		
)
create table movie_d
(
	m_id int,
	d_id int not null,
	primary key(m_id,d_id),
	Foreign key (d_id) references [directors](d_id) on Delete cascade on update cascade,
	Foreign key (m_id) references [movies](m_id) on Delete cascade on update cascade		
)
create table movie_w
(
	m_id int,
	w_id int not null,
	primary key(m_id,w_id),
	Foreign key (w_id) references [Writers](w_id) on Delete cascade on update cascade,
	Foreign key (m_id) references [movies](m_id) on Delete cascade on update cascade		
)
create table movies_cast
(
	m_id int,
	cast_id int,
	primary key(m_id,cast_id),
	Foreign key (cast_id) references [Actors](a_id) on Delete cascade on update cascade,
	Foreign key (m_id) references [movies](m_id) on Delete cascade on update cascade		
)
create table shows
(
	s_id int Primary key,
	s_name varchar(30) not null,
	total_episodes int,
	total_seasons int, 
	release_date date not null, --airing date of pilot(first ep),
	rating int not null,
	g_id int,	--genre id
	[description] varchar(200),
	Foreign key (g_id) references [genre](g_id) on Delete cascade on update cascade,
)
create table shows_cast
(
	s_id int,
	cast_id int,
	primary key(s_id,cast_id),
	Foreign key (s_id) references [Shows](s_id) on Delete cascade on update cascade,
	Foreign key (cast_id) references [Actors](a_id) on Delete cascade on update cascade,
)
create table shows_d
(
	s_id int, 
	d_id int not null,
	primary key(s_id,d_id),
	Foreign key (s_id) references [Shows](s_id) on Delete cascade on update cascade,
	Foreign key (d_id) references [Directors](d_id) on Delete cascade on update cascade,
)	
create table shows_p
(
	s_id int, 
	p_id int not null,
	primary key(s_id,p_id),
	Foreign key (s_id) references [Shows](s_id) on Delete cascade on update cascade,
	Foreign key (p_id) references [Production_house](p_id) on Delete cascade on update cascade,
)	
create table shows_w
(
	s_id int, 
	w_id int not null,
	primary key(s_id,w_id),
	Foreign key (s_id) references [Shows](s_id) on Delete cascade on update cascade,
	Foreign key (w_id) references [Writers](w_id) on Delete cascade on update cascade,
)	

create table shows_eps
(
	s_id int , --of which show is this an episode of
	ep_num int, 
	ep_name varchar(50) not null,
	release_date date not null, 
	ep_rating int not null, --individual episode rating
	[description] varchar(200),
	primary key(s_id,ep_num),
	Foreign key (s_id) references [Shows](s_id) on Delete NO ACTION on update NO ACTION
	
)
create table shows_eps_p
(
	s_id int , --of which show is this an episode of
	ep_num int, 
	p_id int,
	primary key(ep_num,p_id,s_id),
	Foreign key (p_id) references [Production_house](p_id) on Delete cascade on update cascade,
	Foreign key (s_id,ep_num) references [Shows_eps](s_id,ep_num) on Delete cascade on update cascade	
)
create table shows_eps_d
(
	s_id int , --of which show is this an episode of
	ep_num int, 
	d_id int,
	primary key(ep_num,d_id,s_id),
	Foreign key (d_id) references [Directors](d_id) on Delete cascade on update cascade,
	Foreign key (s_id,ep_num) references [Shows_eps](s_id,ep_num) on Delete cascade on update cascade	
)
create table shows_eps_w
(
	s_id int , --of which show is this an episode of
	ep_num int, 
	w_id int,
	primary key(ep_num,w_id,s_id),
	Foreign key (w_id) references [Writers](w_id) on Delete cascade on update cascade,
	Foreign key (s_id,ep_num) references [Shows_eps](s_id,ep_num) on Delete cascade on update cascade	

)

create table shows_eps_cast
(
	s_id int , --of which show is this an episode of
	ep_num int,
	ep_cast_id int,
	primary key(ep_num,ep_cast_id,s_id),
	Foreign key (ep_cast_id) references [Actors](a_id) on Delete cascade on update cascade,
	Foreign key (s_id,ep_num) references [Shows_eps](s_id,ep_num) on Delete cascade on update cascade	
)
create procedure d_list @username varchar(15),@list_name varchar(50)
as begin
declare @u_id int
exec get_userID @username,@u_id output
delete from watchlist_info where list_name = @list_name AND u_id = @u_id
end

exec d_list 'badar07','list 1'
select * from watchlist
select * from watchlist_info
create trigger del_list on watchlist_info
instead of delete 
as begin
declare @ln int,@u_id int,@ln2 int
select @ln = l_num from deleted
select @u_id = u_id from deleted
print @u_id 
select @ln2 = l_num from watchlist_info where l_num  = @ln AND u_id = @u_id
if(@ln2 is null)
begin
print ' list does not exist' 
end
else
begin
print @ln
select @u_id = u_id from deleted
delete from watchlist_info where l_num  = @ln AND u_id = @u_id
delete from watchlist_info where l_num  = @ln AND u_id = @u_id
end
end
use ATDB
select * from watchlist_info
create procedure create_watchlist @username varchar(15),@list_name varchar(50),@list_d varchar(500)--procedure since it doesn't effect any other table
as begin
declare @ln int,@u_id int
select @u_id = u_id from [user] where username = @username
select @ln = l_num from watchlist_info where exists(select l_num from watchlist_info where u_id = @u_id)
if(@ln is null)
begin
set @ln = 1
end
else 
begin
select @ln = max(l_num) from watchlist_info where u_id = @u_id
set @ln = @ln+1
end
declare @l_name varchar(50)
select @l_name = list_name from watchlist_info where list_name = @list_name AND u_id = @u_id
if(@l_name = @list_name)
begin
print 'A list wih the same same already exists'
end
else
begin
insert into watchlist_info(u_id,l_num,list_name,list_description)
values(@u_id,@ln,@list_name,@list_d)
end
end
select * from [User]

exec create_watchlist 'badar07','list 1','list 1'
select * from watchlist
use ATDbf






create table watchlist_info
(
	u_id int,
	l_num int,	--list num
	list_name varchar(50),
	primary key(u_id,l_num), -- s_id,m_id and ep_id can be null, thus whenever a user adds a show/movie/ep to his
	-- watchlist, he will get a list id  
	Foreign key (u_id) references [USER](u_id) on Delete no action on update no action,

)

create table watchlist
(
	u_id int,
	l_num int,	--list num
	s_id int,
	m_id int ,
	ep_num int,
--	primary key(u_id,l_num), -- s_id,m_id and ep_id can be null, thus whenever a user adds a show/movie/ep to his
	-- watchlist, he will get a list id  
	Foreign key (u_id,l_num) references [watchlist_info](u_id,l_num) on Delete no action on update no action,
	Foreign key (m_id) references [Movies](m_id) on Delete no action on update no action,
	Foreign key (s_id,ep_num) references [Shows_eps](s_id,ep_num) on Delete no action on update no action	
)

exec add_to_list 'a','L1','Ready Player One'
select * from watchlist
select * from movies
alter procedure add_to_list @username varchar(15),@list_name varchar(50), @name varchar(50)
as begin
declare @u_id int,@ln int,@m_id int,@s_id int,@ep_num int,@ln2 int
declare @cu_id int,@cln int,@cm_id int,@cs_id int,@cep_num int
select @ln = l_num from watchlist_info where list_name = @list_name
if(@ln is null)
begin
print ' list does not exist' 
end
else
begin

select @m_id = m_id from movies where m_name = @name
select @s_id = s_id from shows where s_name = @name
select @ep_num = ep_num from shows_eps where ep_name = @name

exec get_userID @username,@u_id output

select @cu_id = u_id from watchlist where u_id = @u_id

select @cln = l_num from watchlist where l_num = @ln

select @cm_id = m_id from watchlist where m_id = @m_id
select @cs_id = s_id from watchlist where s_id = @s_id
select @cep_num = ep_num from watchlist where ep_num = @ep_num
if(@u_id = @cu_id AND @ln =  @cln AND (@m_id = @cm_id OR @m_id is null)AND (@s_id = @cs_id OR @s_id is null))
begin
print 'item already exist'
end

else
begin
insert into watchlist (u_id,l_num,s_id ,m_id, ep_num) 
values (@u_id,@ln,@s_id,@m_id,@ep_num) 
end
end
end
select * from watchlist
delete from watchlist
exec add_to_list 'badar07' , 'list 1', 'Avengers: Infinity War'
select * from watchlist

create trigger add_to_watchlist on watchlist
instead of insert
as begin
declare @ln int,@u_id int,@ln2 int
select @ln = l_num from inserted
select @u_id = u_id from inserted
declare @m_id int,@s_id int,@ep_num int
select @m_id = m_id from inserted
select @s_id = s_id from inserted 
select @ep_num = ep_num from inserted
insert into watchlist (u_id,l_num,s_id ,m_id, ep_num) 
values (@u_id,@ln,@s_id,@m_id,@ep_num)
end

exec d_from_list 'badar07' , 'list 1', 'Avengers: Infinity War'
select  * from watchlist
alter procedure d_from_list @username varchar(15),@list_name varchar(50), @name varchar(50)
as begin
declare @u_id int,@ln int,@m_id int,@s_id int,@ep_num int
declare @cu_id int,@cln int,@cm_id int,@cs_id int,@cep_num int
select @ln = l_num from watchlist_info where list_name = @list_name
if(@ln is null)
begin
print ' list does not exist' 
end
else
begin

select @m_id = m_id from movies where m_name = @name
select @s_id = s_id from shows where s_name = @name
select @ep_num = ep_num from shows_eps where ep_name = @name

exec get_userID @username,@u_id output

select @cu_id = u_id from watchlist where u_id = @u_id

select @cln = l_num from watchlist where l_num = @ln

select @cm_id = m_id from watchlist where m_id = @m_id
select @cs_id = s_id from watchlist where s_id = @s_id
select @cep_num = ep_num from watchlist where ep_num = @ep_num
if(@u_id = @cu_id AND @ln =  @cln AND (@m_id = @cm_id OR @m_id is NuLL)AND (@s_id = @cs_id OR @s_id is NuLL )AND (@ep_num = @cep_num OR @ep_num is null))
begin
if(@s_id is null and @ep_num is null)
begin
delete from watchlist where u_id = @u_id ANd l_num =  @ln AND m_id = @m_id
end
if(@m_id is null and @ep_num is null)
begin
delete from watchlist where u_id = @u_id ANd l_num =  @ln AND s_id = @s_id
end
if(@s_id is null and @m_id is null)
begin
delete from watchlist where u_id = @u_id ANd l_num =  @ln AND ep_num = @ep_num
end
end
else
begin
print 'item does not exist'
end
end
end


alter trigger del_from_watchlist on watchlist
instead of delete
as begin
declare @ln int,@u_id int,@ln2 int
select @ln = l_num from deleted
select @u_id = u_id from deleted
declare @m_id int,@s_id int,@ep_num int
select @m_id = m_id from deleted
select @s_id = s_id from deleted 
select @ep_num = ep_num from deleted
if(@s_id is null and @ep_num is null)
begin
if(@s_id is null and @ep_num is null)
begin
delete from watchlist where u_id = @u_id ANd l_num =  @ln AND m_id = @m_id
end
if(@m_id is null and @ep_num is null)
begin
delete from watchlist where u_id = @u_id ANd l_num =  @ln AND s_id = @s_id
end
if(@s_id is null and @m_id is null)
begin
delete from watchlist where u_id = @u_id ANd l_num =  @ln AND ep_num = @ep_num
end
end
end

create table CS --coming soon
(
	id int,
	s_id int,
	m_id int ,
	release date, --release date
	ep_num int,
	primary key(id) ,
	Foreign key (m_id) references [Movies](m_id) on Delete cascade on update cascade,
	Foreign key (s_id,ep_num) references [Shows_Eps](s_id,ep_num) on Delete cascade on update cascade
	--NO ACTION DUE TO UNIQUE DUE TO COMPOSITE PRIMARY KEY
	
)

create table OTW --opening this week
( --made table for ease of search. 
	id int,
	s_id int,
	ep_num int,
	m_id int ,
	release date, --release date
	primary key(id) ,
	Foreign key (s_id,ep_num) references [Shows_Eps](s_id,ep_num) on Delete cascade on update cascade,
	Foreign key (m_id) references [Movies](m_id) on Delete cascade on update cascade,
)
use ATDbN
create table news --opening this week
( --made table for ease of search. 
	n_id int, --news id
	a_id int,
	w_id int,
	p_id int,
	d_id int,
	s_id int,
	ep_num int,
	m_id int ,
	n_date date, --release date
	n_description varchar(500)
	primary key(n_id) ,
	Foreign key (s_id,ep_num) references [Shows_Eps](s_id,ep_num) on Delete cascade on update cascade,
	Foreign key (m_id) references [Movies](m_id) on Delete cascade on update cascade,
	Foreign key (a_id) references [Actors](a_id) on Delete cascade on update cascade,
	Foreign key (w_id) references [Writers](w_id) on Delete cascade on update cascade,
	Foreign key (p_id) references [Production_house](p_id) on Delete cascade on update cascade,
	Foreign key (d_id) references [Directors](d_id) on Delete cascade on update cascade,
)
create table genre
(
	g_id int primary key, 
	[type] varchar(20)
)

--this table is for users that want regular updates via email
drop table updates
create table updates
(
	email_add varchar(40),
	last_sent datetime
)
insert into polls(p_id,p_name,t_votes,s_date,c_id)
values (1,'best actor',5,getdate(),1)
insert into polls(p_id,p_name,t_votes,s_date,c_id)
values (2,'best actress',5,'2012-04-04',1)
insert into polls(p_id,p_name,t_votes,s_date,c_id)
values (3,'best dir',5,'2012-01-02',1)select * from polls
insert into polls(p_id,p_name,t_votes,s_date,c_id)
values (3,'best dir',5,'2012-01-02',1)select * from polls
insert into polls(p_id,p_name,t_votes,s_date,c_id)
values (4,'best pro',5,'2-01-2015',1)select * from polls
select * from polls

create table polls

(
	p_id int primary key,
	p_name varchar(50),
	--[type] varchar(20),--show,movie,actor,producer
	t_votes int, --total number of votes in poll
	s_date datetime, -- starting date
		--SELECT DATEDIFF(hour, '2017/02/01 07:00', '2017/03/03 6:40') AS DateDiff;
	t_op int,--  total options
--30*24 = 720, hours in 30 days
	c_id int, --voter id --who creatd the poll
	Foreign key(c_id) references [USER](u_id) on delete no action on update no action
)

create procedure add_poll2 @p_name varchar(50),	@username varchar(15)
as begin
if(@username is null)	--no signed up, box will be null.
begin
print 'sign up to create poll'
end
else
begin
declare @c_id int
select @c_id = u_id from [User] where username = @username
declare @p_id int 
select @p_id = p_id from polls where exists(select p_id from polls)
if(@p_id != 0)
begin
Select @p_id = max(p_id) from polls
set @p_id = @p_id +1
end
else 
begin
set @p_id = 1 
end
print @p_id
insert into polls(p_id,p_name,t_votes,s_date,c_id)
values (@p_id,@p_name,0,getdate(),@c_id)select * from polls

end
end
create trigger add_p on polls
instead of insert
as begin
declare @p_name varchar(50)
declare @cp_name varchar(50)
waitfor delay '00:00:15'
select @p_name = p_name from inserted  
select @cp_name = p_name from polls where p_name  = @p_name 
if(@cp_name  = @p_name)
begin
print 'Poll already exists'
end
else 
begin
declare @p_id int, @c_id int 
select @p_id = p_id from inserted --where p_name  = @p_name
select @c_id = c_id from inserted where p_name  = @p_name
insert into polls(p_id,p_name,t_votes,s_date,c_id)
values (@p_id,@p_name,0,getdate(),@c_id)
end
end

exec add_poll2 'me' ,null
exec add_poll2'mme2' , 'abdullah98'
exec add_poll2'meme' , 'abdullah98'
delete from polls where p_id  = 1 or p_id = 2
select * from polls

create procedure add_poll @p_name varchar(50),	@username varchar(15)
as begin
if(@username is null)	--no signed up, box will be null.
begin
print 'sign up to create poll'
end
else 
begin
declare @cp_name varchar(50)

select @cp_name = p_name from polls where p_name  = @p_name 
declare @p_id int 
if(@cp_name  = @p_name)
begin
print 'Poll already exists'
end
else
begin
if(@p_name is null)
begin
print ' name of poll can not be empty'
end
else
begin

select @p_id = p_id from polls where exists(select p_id from polls)
if(@p_id != 0)
begin
Select @p_id = max(p_id) from polls
set @p_id = @p_id +1
end
else 
begin
set @p_id = 1 
end
declare @c_id int
select @c_id = u_id from [User] where username = @username
insert into polls(p_id,p_name,t_votes,s_date,c_id,t_op)
values (@p_id,@p_name,0,getdate(),@c_id,0)
end
end
end
end	--end procedure here
select * from [User]
exec add_poll 'best pro' , 'abdullah98'
exec add_poll 'best prog' , 'abdullah98'
exec add_poll 'meme' ,'abdullah98'
exec add_poll null , null
delete from polls where p_id = 6 
delete from polls where p_id = 7
select * from polls

create procedure get_userID @username varchar(15), @id int output
as begin
select @id = u_id from [User] where username = @username
end

create procedure get_o_id @p_id int, @ln int output		--will be used to insert in po
as begin 
select @ln = o_id from po where exists(select o_id from po where p_id = @p_id)
if(@ln is null)
begin
set @ln = 1
end
else 
begin
select @ln = max(o_id) from po where p_id = @p_id
set @ln = @ln+1
end
end
declare @ln int
exec get_o_id 2,@ln output
print @ln
select * from polls
update polls set s_date = 2017-04-05 where p_id = 1

create procedure give_ID_and_add_option @username varchar(15),@pname varchar(50),@option varchar(50)
as begin
declare @o_id int ,@u_id int , @p_id int 
select @p_id = p_id from polls where p_name = @pname
exec get_o_id @p_id, @o_id output
exec get_userID @username , @u_id output
print @u_id
insert into po(p_id,v_num,[option],u_id,o_id)
values(@p_id,0,@option,@u_id,@o_id)

end

select * from [User]
select * from polls

exec give_ID_and_add_option 'abdullah98','best pro','mw'
select * from po
alter trigger add_option_to_poll2 on po
instead of insert
as begin
declare @option varchar(50),@p_id int,	@u_id int,@o_id int
select @option = [option] from inserted 
--select @p_name = pname  from polls where p_id = (select  p_id from inserted)
select  @p_id  = p_id from inserted
select @u_id = u_id from inserted
select  @o_id = o_id from inserted
print @u_id
if(@u_id is null)	--no signed up, box will be null.
begin
print 'sign up to add option'
end
else 
begin
declare @cp_name varchar(50)
select @cp_name = p_name from polls where p_id  = @p_id
if(@cp_name is null)
begin
print 'poll does not exist' --check for assurity only
end
else
begin
declare @cdate int
declare @s_date datetime
select @s_date = s_Date from polls where p_id = @p_id
SELECT @cdate  = DATEDIFF(MINUTE, @s_date, getdate()) 
if(@cdate >= 43200)	--poll closes after 30 days; no voting after 30 days
begin
print 'Sorry but you cannot add options after the poll has closed'
end
else
begin
declare @co_name varchar(50)
--declare @p_id int 
declare @cp_id int
--select @p_id = p_id from polls where p_name = @p_name
select @co_name = [option] from PO where p_id = @p_id AND @option = [option]
select @cp_id= p_id from po where p_id = @p_id
if(@co_name is not null AND @co_name  = @option AND @cp_id = @p_id)
begin
print 'option already exists'
end
else
begin
if(@option is null)
begin
print ' entry can not be empty'
end
else
begin
insert into po(p_id,v_num,[option],u_id,o_id)
values (@p_id,0,@option,@u_id,@o_id)
update polls
set t_op = t_op + 1
where p_id = @p_id 
end
end
end
end
end
end	--end trigger here
select *  from [user]
insert into po(p_id,v_num,[option],u_id,o_id)
values(1,0,'m',1,)
exec add_option_to_poll 'meme', 'meme', 'abdullah98'
select * from po


create table PO --poll options table
(
	
	p_id int,
	v_num int,--no. of votes
	[option] varchar(50),	--name of actor,movie,show etc
	o_id int , --option id
	u_id int,	--insertion of option by whom?
	
	primary key(p_id,o_id), -- one person/show/movie can be nominated in several polls but 
	--none can be nominated twice in one
	--IF OPTION IS ID OF ANY ACTOR/SHOW ETC, THEN IT CAN'T BE USED IN PRIMARY KEY WHICH WILL CAUSE OTHER ERRORS,hence name
	Foreign key (u_id) references [User](u_id) on Delete no action on update no action,
	Foreign key (p_id) references [Polls](p_id) on Delete cascade on update cascade,
)

create trigger vote_in_poll on pu_v
instead of insert
as begin
declare @option varchar(50),@p_id int,	@u_id int,@o_id int
--select @p_name = pname  from polls where p_id = (select  p_id from inserted)
select  @p_id  = p_id from inserted
select @u_id =  u_id from inserted 
 select @o_id = o_id from inserted
if(@u_id is null)	--no signed up, box will be null.
begin
print 'sign up to add option'
end
else 
begin
declare @cdate int
declare @s_date datetime
select @s_date = s_Date from polls where p_id = @p_id
SELECT @cdate  = DATEDIFF(MINUTE, @s_date, getdate()) 
if(@cdate >= 43200)--poll closes after 30 days; no voting after 30 days
begin
print 'Sorry but you cannot vote after the poll has closed'
end

else
begin
declare @cu_id int, @cp_id int
select @cu_id =  u_id from pu_V where p_id = @p_id AND u_id = @u_id
select @cp_id = p_id from pu_V where p_id = @p_id AND u_id = @u_id
if(@u_id = @cu_id AND @cp_id = @p_id) --one user can votes only once in a poll
begin
print 'you have already voted in this poll'
end
else
begin
if(@p_id is null)
begin
print 'poll does not exist' --check for assurity only
end
else
begin
if(@o_id is null)
begin
print ' Option does not exist'
end
else
begin

insert into pu_v(p_id,u_id,o_id)
values (@p_id,@u_id,@o_id)
update po
set v_num = v_num + 1
where p_id = @p_id AND o_id = @o_id 
end 
end
end
end
end
end	--end procedure here

select * from po
insert into pu_v(p_id,u_id,o_id)
values(1,2,1)
create table PU_v --connecting voters(users to pools to vote)
(
	p_id int, 
	u_id int,
	o_id int ,
	primary key(p_id,u_id),--one user can vote once on a poll
--	Foreign key (p_id) references [Polls](p_id) on Delete cascade on update cascade,
	Foreign key (u_id) references [User](u_id) on Delete no action on update no action,
	Foreign key (p_id,o_id) references po(p_id,o_id) on Delete cascade on update cascade,
	--first come and delete vote and then delete the user
)
use atdb
select * from polls
create procedure get_pollID @p_name varchar(50),@p_id int output
as begin
select @p_id = p_id from polls where p_name = @p_name
end
declare @p_id int
exec get_pollID 'best pro' , @p_id output
print @p_id
create trigger delete_poll on polls
instead of delete 
as begin
declare @p_id int
select @p_id = p_id from deleted
delete from pu_v where p_id = @p_id
delete from po where p_id = @p_id
delete from polls where p_id = @p_id
end
delete from polls where p_id = 1
select * from polls
select * from po
select * from pu_v
--create delet poll
Select * 
from [User]
Select * 
from [Login]
Select * 
from [writers]
Select * 
from Actors
select *
from [Directors]
Select * 
from [Production_house]
Select * 
from [shows]
Select * 
from [shows_eps]
Select * 
from [movies]
Select * 
from [watchlist]
Select * 
from [pu]
Select * 
from [PO]
Select * 
from [polls]
Select * 
from [updates]
Select * 
from [news]
Select * 
from genre
Select * 
from OTW
Select * 
from [CS]
use ATDB
create procedure check_d
as begin
declare @od varchar(50)
select @od = [p_name]  from polls where (datepart(YEAR,s_date) = 2018)
select @od as od
end  
exec check_d
alter procedure check_dm
as begin
declare @dat varchar(4)
declare @m varchar(2) 
DECLARE @tags VARCHAR(400) = '01-1020'
SELECT @dat = value FROM STRING_SPLIT(@tags, '-') WHERE RTRIM(value) <> '';  
SELECT @dat =   (datepart(day,getdate())) 

SELECT @m = SUBSTRING(@tags, 1, 100)
declare @fd date
select @fd =  CONVERT(date, '2-01-2015');
select P_name from polls where s_date = @fd
print @m;
print @dat;
end
exec check_dm
use ATDbf
select * from polls
select  [p_name] as yy from polls where (datepart(MONTH,s_date) = 4) and (datepart(year,s_date) = '2018');

--adding option shall be called in a procedure because option no will be max

select s_id,s_name as [Show Name], total_episodes as [Total Episodes],rating ,release_date as [Release Date], [description],g.type from shows s inner join genre g on g.g_id = s.g_id
select m_i,m_name as[Movie Name],rating,release_date as [Release Date],[description],g.type from movies m inner join genre g on g.g_id = m.g_id


create procedure create_watchlist @username varchar(15),@list_name varchar(50),@list_d varchar(500) --procedure since it doesn't effect any other table
as begin
declare @ln int,@u_id int
select @u_id = u_id from [user] where username = @username
select @ln = l_num from watchlist_info where exists(select l_num from watchlist_info where u_id = @u_id)
if(@ln is null)
begin
set @ln = 1
end
else 
begin
select @ln = max(l_num) from watchlist_info where u_id = @u_id
set @ln = @ln+1
end
declare @l_name varchar(50)
select @l_name = list_name from watchlist_info where list_name = @list_name AND u_id = @u_id
if(@l_name = @list_name)
begin
print 'A list wih the same same already exists'
end
else
begin
insert into watchlist_info(u_id,l_num,list_name,list_description)
values(@u_id,@ln,@list_name,@list_d)
end
end

select * from watchlist
create procedure add_to_list @username varchar(15),@list_name varchar(50), @name varchar(50)
as begin
declare @u_id int,@ln int,@m_id int,@s_id int,@ep_num int,@ln2 int
declare @cu_id int,@cln int,@cm_id int,@cs_id int,@cep_num int
select @ln = l_num from watchlist_info where list_name = @list_name
if(@ln is null)
begin
print ' list does not exist' 
end
else
begin

select @m_id = m_id from movies where m_name = @name
select @s_id = s_id from shows where s_name = @name
select @ep_num = ep_num from shows_eps where ep_name = @name

exec get_userID @username,@u_id output

select @cu_id = u_id from watchlist where u_id = @u_id

select @cln = l_num from watchlist where l_num = @ln

select @cm_id = m_id from watchlist where m_id = @m_id
select @cs_id = s_id from watchlist where s_id = @s_id
select @cep_num = ep_num from watchlist where ep_num = @ep_num
if(@u_id = @cu_id AND @ln =  @cln AND (@m_id = @cm_id OR @m_id is NuLL)AND (@s_id = @cs_id OR @s_id is NuLL )AND (@ep_num = @cep_num OR @ep_num is null))
begin
print 'item already exist'
end

else
begin
insert into watchlist (u_id,l_num,s_id ,m_id, ep_num) 
values (@u_id,@ln,@s_id,@m_id,@ep_num) 
end
end
end


create trigger add_to_watchlist on watchlist		
instead of insert
as begin
declare @ln int,@u_id int,@ln2 int
select @ln = l_num from inserted
select @u_id = u_id from inserted
declare @m_id int,@s_id int,@ep_num int
select @m_id = m_id from inserted
select @s_id = s_id from inserted 
select @ep_num = ep_num from inserted
insert into watchlist (u_id,l_num,s_id ,m_id, ep_num) 
values (@u_id,@ln,@s_id,@m_id,@ep_num)
end

use ATDbf
create procedure getC @p_id int, @c_id int output
as begin
select @c_id = c_id from polls where p_id = @p_id
end

use ATDbf
select * from [user]

select * from login
delete from login
alter procedure search @searchbar varchar(100),@status int
as begin

declare @rownumber int
set @rownumber=1;
declare @count int;
--Simple Search--
if(@status=1)
begin

select @searchbar='%' + @searchbar + '%'
declare @searchmovie varchar(40);
select @searchmovie=m_name from movies where m_name like @searchbar;
print @searchmovie
--Search is About Movie--
if(@searchmovie is Not NULL)
begin
declare @mid int
select @count=Count(*) from movies m where m.m_name like @searchbar;
while(@rownumber<=@count)
begin
select @mid=m_id from(select m_id, ROW_NUMBER() over (order by m_id) as Rownum from movies where m_name like @searchbar)sub where Rownum=@rownumber
--Information About Movie--
select m.m_id as [Movie ID],m.m_name as [Movie Name],m.release_date,m.rating,m.[description],g.[type] as Genre from movies m  
inner join genre g on g.g_id=m.g_id
where m.m_id=@mid
--Director of Movie
select m.m_id as [Movie ID],d.[name] as Director from Directors d
inner join movie_d md on d.d_id=md.d_id
inner join movies m on m.m_id=md.m_id
where m.m_id=@mid
--Producer of Movie--
select m.m_id as [Movie ID],p.[name] as Producer from Production_house p
inner join movie_p md on p.p_id=md.p_id
inner join movies m on m.m_id=md.m_id 
where m.m_id=2
--Writer of Movie--
select m.m_id as [Movie ID],w.[name] as Writer from writers w
inner join movie_w md on w.w_id=md.w_id
inner join movies m on m.m_id=md.m_id
where m.m_id=@mid
--Cast Of Movie--
select m.m_id as [Movie ID],a.[name] as [Cast] from Actors a 
inner join movies_cast mc on mc.cast_id=a.a_id
inner join movies m on m.m_id=mc.m_id 
where m.m_id=@mid
set @rownumber=@rownumber+1;
end
end
--End Of Search For Movie--


declare @searchshow varchar(50)
select @searchshow=s_name from shows where s_name like @searchbar
--Search is About Show--
if(@searchshow is Not NULL )
begin
declare @sid int
select @count=Count(*) from shows s where s.s_name like @searchbar
while(@rownumber<=@count)
begin
select @sid=s_id from(select s_id, ROW_NUMBER() over (order by s_id) as Rownum from shows where s_name like @searchbar)sub where Rownum=@rownumber
--Information About Show--
select s.s_id as [Show ID],s.s_name as [Show Name],s.release_date,s.rating,s.[Description],g.[type] as Genre,s.total_episodes from shows s 
inner join genre g on g.g_id=s.g_id
where s.s_id=@sid
--Director of Show--
select s.s_id as [Show ID],d.[name] as Director from Directors d
inner join shows_d sd on d.d_id=sd.d_id 
inner join shows s on s.s_id=sd.s_id
where s.s_id=@sid
--Producer of Show--
select s.s_id as [Show ID],p.[name] as Producer from Production_house p
inner join shows_p sp on sp.p_id=p.p_id
inner join shows s on s.s_id=sp.s_id 
where s.s_id=@sid
--Writer of Show--
select s.s_id as [Show ID],w.[name] as Writer from writers w
inner join shows_w sw on w.w_id=sw.w_id
inner join shows s on s.s_id=sw.s_id
where s.s_id=@sid
--Cast of Show--
select s.s_id as [Show ID],a.[name] as [Cast] from Actors a 
inner join shows_cast sc on sc.cast_id=a.a_id 
inner join shows s on s.s_id=sc.s_id
where s.s_id=@sid
--Information About Each Episode Of Show--
select s.s_id as [Show ID],se.ep_name,se.ep_num,se.[description],se.ep_rating,se.release_date from shows s
inner join shows_eps se on se.s_id=s.s_id
where s.s_id=@sid
--Director of Each Episode of Show--
select s.s_id as [Show ID],se.ep_name as [Episode Name],se.ep_num as [Episode Number],d.[name] as directors from shows s
inner join shows_eps se on se.s_id=s.s_id 
inner join shows_eps_d sed on sed.ep_num=se.ep_num and sed.s_id=s.s_id
inner join Directors d on sed.d_id=d.d_id
where s.s_id=@sid
--Producer of Each Episode of Show--
select s.s_id as [Show ID],se.ep_name as [Episode Name],se.ep_num as [Episode Number],p.[name] as producers from shows s
inner join shows_eps se on se.s_id=s.s_id 
inner join shows_eps_p sed on sed.ep_num=se.ep_num and sed.s_id=s.s_id
inner join Production_house p on sed.p_id=p.p_id
where s.s_id=@sid
--Writer of Each Episode Of Show--
select s.s_id as [Show ID],se.ep_name as [Episode Name],se.ep_num as [Episode Number],w.[name] as writers from shows s
inner join shows_eps se on se.s_id=s.s_id 
inner join shows_eps_w sed on sed.ep_num=se.ep_num and sed.s_id=s.s_id
inner join writers w on sed.w_id=w.w_id
where s.s_id=@sid
--Cast Of Each Episode of Show--
select s.s_id as [Show ID],sep.ep_name as [Episode Name],sep.ep_num as [Episode Number],a.[name] as [cast] from Actors a
inner join shows_eps_cast sec on sec.ep_cast_id=a.a_id
inner join shows_eps sep on sep.ep_num=sec.ep_num and sep.s_id=sec.s_id
inner join shows s on s.s_id=sep.s_id
where s.s_id=@sid
set @rownumber=@rownumber+1;
end
--End Of Search For Show--
end


declare @searchactor varchar(50)
select @searchactor=a.[name] from Actors a where a.[name] like @searchbar
--Search is About Actor--
if(@searchactor is NOT NULL)
begin
declare @aid int
select @count=Count(*) from actors a where a.[name] like @searchbar
while(@rownumber<=@count)
begin
select @aid=a_id from(select a_id, ROW_NUMBER() over (order by a_id) as Rownum from actors where [name] like @searchbar)sub where Rownum=@rownumber
--Information About Actor like name,age,gender etc--
declare @deathdate date
select @deathdate=d_city from Actors where a_id=@aid
if(@deathdate is Not NULL)
begin
select a_id as [Actor Id],[name] as [Actor Name],gender,[description],b_city as [Birth City],b_day as Birthday,d_city as [Death City],d_day as Deathday from Actors where a_id=@aid
end
else
begin
select a_id as [Actor Id],[name] as [Actor Name],gender,[description],b_city as [Birth City],b_day as Birthday from Actors where a_id=@aid
end

--Movies Actor Work In--
select a.a_id as [Actor Id],m.m_name as [Movie Name],m.[description],m.rating,m.release_date,g.[type] as Genre from movies m
inner join movies_cast mc on mc.m_id=m.m_id
inner join actors a on mc.cast_id=a.a_id
inner join genre g on g.g_id=m.g_id
where a.a_id=@aid

--Shows Actor Work In--
select a.a_id as [Actor Id],s.s_name as [Show Name],s.[description],s.rating,s.release_date,g.[type] as Genre from shows s
inner join shows_cast sc on sc.s_id=s.s_id
inner join Actors a on sc.cast_id=a.a_id
inner join genre g on g.g_id=s.g_id
where a.a_id=@aid

--Each Episode Of Show Actor Work In--
select a.a_id as [Actor Id],s.s_name [ Show Name],se.ep_name as [ Episode Name],se.ep_num as [ Episode Number],se.[description],se.ep_rating,se.release_date from shows s
inner join shows_eps se on se.s_id=s.s_id 
inner join shows_eps_cast sec on sec.ep_num=se.ep_num and sec.s_id=se.s_id
inner join Actors a on a.a_id=sec.ep_cast_id
where a.a_id=@aid
set @rownumber=@rownumber+1;
end
--End Of Search For Actor--
end


declare @searchdirector varchar(50)
select @searchdirector=d.[name] from Directors d where d.[name] like @searchbar
--Search is About Director--


if(@searchdirector is Not NULL)
begin
declare @did int
select @count=Count(*) from Directors d where d.[name] like @searchbar
while(@rownumber<=@count)
begin
select @did=d_id from(select d_id, ROW_NUMBER() over (order by d_id) as Rownum from directors where [name] like @searchbar)sub where Rownum=@rownumber
--Information About Director Like Name,Gender BirthDay Etc--
select @deathdate=d_day from Directors where d_id=@did
if(@deathdate is NOT NULL)
begin
select d.d_id as [Driector ID],d.[name] as [Driector Name],d.b_city [ Birth City],d.b_day as Birthday,d.d_city as [Death City],d.d_day Deathday,d.[description],d.gender from Directors d where d.d_id=@did
end
else
begin
select d.[name] as [Driector Name],d.b_city [ Birth City],d.b_day as Birthday,d.[description],d.gender from Directors d where d.d_id=@did
end
--Movies Director Work In--
select d.d_id as [Driector ID],m.m_name as [Movie Name],m.rating,m.release_date,m.[description],g.[type] as Genre from movies m
inner join movie_d md on md.m_id=m.m_id
inner join Directors d on md.d_id=d.d_id
inner join genre g on g.g_id=m.g_id
where d.d_id=@did
--Shows Director Work In--
select d.d_id as [Driector ID],s.s_name as [Show Name],s.[description],s.rating,s.release_date,s.total_episodes,g.[type] as Genre from shows s
inner join shows_d sd on sd.s_id=s.s_id
inner join Directors d on sd.d_id=d.d_id
inner join genre g on g.g_id=s.g_id
where d.d_id=@did
--Each Episode Of Show Director Work In--
select d.d_id as [Driector ID],s.s_name as [Show Name],se.ep_name,se.ep_num,se.release_date,se.[description],se.ep_rating from shows_eps se
inner join shows_eps_d sed on sed.s_id=se.s_id and sed.ep_num=se.ep_num
inner join Directors d on sed.d_id=d.d_id
inner join shows s on s.s_id=se.s_id
where d.d_id=@did
set @rownumber=@rownumber+1
end
end
--End Of Search For Director--


declare @searchprdouction varchar(50)
select @searchprdouction= [name] from Production_house where [name] like @searchbar
--Search is About Production House--

if(@searchprdouction is Not NULL)
begin
declare @pid int
select @count=Count(*) from Production_house p where p.[name] like @searchbar
while(@rownumber<=@count)
begin
select @pid=p_id from(select p_id, ROW_NUMBER() over (order by p_id) as Rownum from Production_house where [name] like @searchbar)sub where Rownum=@rownumber
--Information About Production House Like name--
select p.p_id as [Production_House ID],p.[name] as [Production_House Name] from Production_house p where p.p_id=@pid

--Movies related to Production House--
select p.p_id as [Production_House ID],m.m_name as [Movie Name],m.rating,m.release_date,m.[description],g.[type] as Genre from movies m
inner join movie_p mp on mp.m_id=m.m_id
inner join Production_house p on mp.p_id=p.p_id
inner join genre g on g.g_id=m.g_id
where p.p_id=@pid


--Shows Related To Production House--
select p.p_id as [Production_House ID],s.s_name as [Show Name],s.[description],s.rating,s.release_date,s.total_episodes,g.[type] as Genre from shows s
inner join shows_p sp on sp.s_id=s.s_id
inner join Production_house p on sp.p_id=p.p_id
inner join genre g on g.g_id=s.g_id
where p.p_id=@pid

--Each Episode Of Show Related To Production House--
select p.p_id as [Production_House ID],s.s_name as [Show Name],se.ep_name as [Episode Name],se.ep_num as [Episode Number],se.release_date,se.[description],se.ep_rating from shows_eps se
inner join shows_eps_p sep on sep.s_id=se.s_id and sep.ep_num=se.ep_num
inner join Production_house p on sep.p_id=p.p_id
inner join shows s on s.s_id=se.s_id
where p.p_id=@pid
set @rownumber=@rownumber+1
end
end
--End Of Search For Production--



declare @searchwriter varchar(50)
select @searchwriter= [name] from writers where [name] like @searchbar
--Search Is About Writer--

if(@searchwriter is Not NULL)
begin
declare @wid int
select @count=Count(*) from writers w where w.[name] like @searchbar
while(@rownumber<=@count)
begin
select @wid=w_id from(select w_id, ROW_NUMBER() over (order by w_id) as Rownum from writers where [name] like @searchbar)sub where Rownum=@rownumber
--Information About Writer Like name,birthdate etc--
select @deathdate=d_day from writers where w_id=@wid
if(@deathdate is NOT NULL)
begin
select w.w_id as [Writer ID],w.[name] as [Writer Name],w.b_city as [Birth city],w.b_day as Birthday,w.d_city as [Death City],w.d_day as Deathday,w.[description],w.gender from writers w where w.w_id=@wid
end
else
begin
select w.w_id as [Writer ID],w.[name] as [Writer Name],w.b_city as [Birth city],w.b_day as Birthday,w.[description],w.gender from writers w where w.w_id=@wid
end
--Movies Wrtier Associated With--
select w.w_id as [Writer ID],m.m_name as [Movie Name],m.rating,m.release_date,m.[description],g.[type] as Genre from movies m
inner join movie_w mw on mw.m_id=m.m_id
inner join writers w on mw.w_id=w.w_id
inner join genre g on g.g_id=m.g_id
where w.w_id=@wid
--Shows Writer Associated With--
select w.w_id as [Writer ID],s.s_name as [Show Name],s.[description],s.rating,s.release_date,s.total_episodes,g.[type] as Genre from shows s
inner join shows_w sw on sw.s_id=sw.s_id
inner join writers w on sw.w_id=w.w_id
inner join genre g on g.g_id=s.g_id
where w.w_id=@wid
--Each Episode Of Show Writer Associated With--
select w.w_id as [Writer ID],s.s_name,se.ep_name as [Episode Name],se.ep_num,se.release_date,se.[description],se.ep_rating from shows_eps se
inner join shows_eps_w sew on sew.s_id=se.s_id and sew.ep_num=se.ep_num
inner join writers w on sew.w_id=w.w_id
inner join shows s on s.s_id=se.s_id
where w.w_id=@wid
set @rownumber=@rownumber+1
end
end

declare @searchgenre int
select @searchgenre=g_id from genre where [type] like @searchbar
--Seach is About Genre--

if(@searchgenre is Not NULL)
begin
declare @gid int
select @count=Count(*) from genre g where g.[type] like @searchbar
while(@rownumber<=@count)
begin
select @gid=g_id from(select g_id, ROW_NUMBER() over (order by g_id) as Rownum from genre where [type] like @searchbar)sub where Rownum=@rownumber
--For Movies--
select g.g_id as [Genre ID],m.m_name as [Movie Name],m.[description],m.rating,m.release_date from movies m
inner join genre g on g.g_id=m.g_id
where g.g_id=@gid
--For Shows--
select g.g_id as [Genre ID],s.s_name as [Show Name],s.[description],s.rating,s.release_date,s.total_episodes from shows s
inner join genre g on g.g_id=s.g_id
where g.g_id=@gid
set @rownumber=@rownumber+1
end
end
--End Of Search For Genre--
end
--End Of Simple Search--

--Search by Year Or By Name--
if(@status=2)
begin
--Movies Release On This Year or Name--
select m.m_id as [Movie ID],m.m_name as [Movie Name],m.release_date,m.rating,m.[description],g.[type] as Genre from movies m 
inner join genre g on g.g_id=m.g_id
where (datepart(year,m.release_date) = @searchbar) or m.m_name like @searchbar
--Shows Release On This Year or Name--
select s.s_id as [Show ID],s.s_name as [Show Name],s.release_date,s.rating,s.[description],g.[type] as Genre,s.total_episodes from shows s 
inner join genre g on g.g_id=s.g_id
where (datepart(year,s.release_date) = @searchbar) or s.s_name like @searchbar
--Each Episode Of Show Release On This Year or Name--
select s.s_id as [Show ID],s.s_name as [Show Name],se.ep_name as [Episode Name],se.ep_num as [Episode Number],se.[description],se.ep_rating,se.release_date from shows s
inner join shows_eps se on se.s_id=s.s_id
where (datepart(year,se.release_date) = @searchbar) or se.ep_name like @searchbar
--Actor Born Or Die On This Year--
select a_id as [Actor ID],[name] as [Actor Name],gender,[description],b_city,b_day from Actors
where (datepart(year,b_day) = @searchbar)
select a_id as [Actor ID],[name] as [Actor Name],gender,[description],b_city,b_day,d_city,d_day from Actors
where (datepart(year,d_day) = @searchbar)
--Directors Born Or Die On This Year--
select d_id as [Director ID],[name] as [Director Name],gender,[description],b_city,b_day from Directors
where (datepart(year,b_day) = @searchbar)
select d_id as [Director ID],[name],gender,[description],b_city,b_day,d_city,d_day from Directors
where (datepart(year,d_day) = @searchbar)
--Writers Born Or Die On This Year--
select w_id as [Writer ID],[name] as [Writer Name],gender,[description],b_city,b_day from writers
where (datepart(year,b_day) = @searchbar)
select w_id as [Writer ID],[name] as [Write Name],gender,[description],b_city,b_day,d_city,d_day from writers
where (datepart(year,d_day) = @searchbar)
end
--End Of Search By Year--

--Search By Day Month --
if(@status=3)
begin

declare @dat varchar(2);
declare @m varchar(2) 
SELECT @dat = value FROM STRING_SPLIT(@searchbar, '-') WHERE RTRIM(value) <> '';  
SELECT @m = SUBSTRING(@searchbar, 1, 100);
--Movies Release On This Day and Month--
select m.m_id as [Movie ID],m.m_name as [Movie Name],m.release_date,m.rating,m.[description],g.[type] as Genre from movies m
inner join genre g on g.g_id=m.g_id
where (datepart(DAY,m.release_date) = @dat) and (DATEPART(MONTH,m.release_date)=@m)
--Shows Release On This Day and Month--
select s.s_id as [Show ID],s.s_name as [Show Name],s.release_date,s.rating,s.[description],g.[type] as Genre,s.total_episodes from shows s 
inner join genre g on g.g_id=s.g_id
where (datepart(DAY,s.release_date) = @dat) and (DATEPART(MONTH,s.release_date)=@m)
--Each Episode Of Show Release On This Day and Month--
select s.s_id as [Show ID],s.s_name as [Show Name],se.ep_name as [Episode Name],se.ep_num as [Episode Number],se.[description],se.ep_rating,se.release_date from shows s
inner join shows_eps se on se.s_id=s.s_id
where (datepart(DAY,se.release_date) = @dat) and (DATEPART(MONTH,se.release_date)=@m)
--Actor Born Or Die On This Day and Month--
select a_id as [Actor ID],[name] as [Actor Name],gender,[description],b_city,b_day from Actors
where (datepart(DAY,b_day) = @dat) and (DATEPART(MONTH,b_day)=@m)
select a_id as [Actor ID],[name] as [Actor Name],gender,[description],b_city,b_day,d_city,d_day from Actors
where (datepart(DAY,d_day) = @dat) and (DATEPART(MONTH,d_day)=@m)
--Directors Born Or Die On This Day and Month--
select d_id as [Director ID],[name] as [Director Name],gender,[description],b_city,b_day from Directors
where (datepart(DAY,b_day) = @dat) and (DATEPART(MONTH,b_day)=@m)
select d_id as [Director ID],[name] as [Director Name],gender,[description],b_city,b_day,d_city,d_day from Directors
where (datepart(DAY,d_day) = @dat) and (DATEPART(MONTH,d_day)=@m)
--Writers Born Or Die On This Day and Month--
select w_id as [Writer ID],[name] as [Writer Name],gender,[description],b_city,b_day from writers
where (datepart(DAY,b_day) = @dat) and (DATEPART(MONTH,b_day)=@m)
select w_id as [Writer ID],[name] as [Write Name],gender,[description],b_city,b_day,d_city,d_day from writers
where (datepart(DAY,d_day) = @dat) and (DATEPART(MONTH,d_day)=@m)
end

--Search By Month Year--
if(@status=3)
begin

declare @year varchar(2);
declare @month varchar(2) 
SELECT @month = value FROM STRING_SPLIT(@searchbar, '-') WHERE RTRIM(value) <> '';  
SELECT @year = SUBSTRING(@searchbar, 1, 100);
--Movies Release On This Month and Year--
select m.m_id as [Movie ID],m.m_name as [Movie Name],m.release_date,m.rating,m.[description],g.[type] as Genre from movies m
inner join genre g on g.g_id=m.g_id
where (datepart(YEAR,m.release_date) = @year) and (DATEPART(MONTH,m.release_date)=@month)
--Shows Release On This Month and Year--
select s.s_id as [Show ID],s.s_name as [Show Name],s.release_date,s.rating,s.[description],g.[type] as Genre,s.total_episodes from shows s 
inner join genre g on g.g_id=s.g_id
where (datepart(YEAR,s.release_date) = @year) and (DATEPART(MONTH,s.release_date)=@month)
--Each Episode Of Show Release On This Month and Year--
select s.s_id as [Show ID],s.s_name as [Show Name],se.ep_name as [Episode Name],se.ep_num as [Episode Number],se.[description],se.ep_rating,se.release_date from shows s
inner join shows_eps se on se.s_id=s.s_id
where (datepart(YEAR,se.release_date) = @year) and (DATEPART(MONTH,se.release_date)=@month)
--Actor Born Or Die On This Month and Year--
select a_id as [Actor ID],[name] as [Actor Name],gender,[description],b_city,b_day from Actors
where (datepart(YEAR,b_day) = @dat) and (DATEPART(MONTH,b_day)=@month)
select a_id as [Actor ID],[name] as [Actor Name],gender,[description],b_city,b_day,d_city,d_day from Actors
where (datepart(YEAR,d_day) = @year) and (DATEPART(MONTH,d_day)=@month)
--Directors Born Or Die On This Month and Year--
select d_id as [Director ID],[name] as [Director Name],gender,[description],b_city,b_day from Directors
where (datepart(YEAR,b_day) = @dat) and (DATEPART(MONTH,b_day)=@month)
select d_id as [Director ID],[name] as [Director Name],gender,[description],b_city,b_day,d_city,d_day from Directors
where (datepart(YEAR,d_day) = @year) and (DATEPART(MONTH,d_day)=@month)
--Writers Born Or Die On This Month and Year--
select w_id as [Writer ID],[name] as [Writer Name],gender,[description],b_city,b_day from writers
where (datepart(YEAR,b_day) = @year) and (DATEPART(MONTH,b_day)=@month)
select w_id as [Writer ID],[name] as [Write Name],gender,[description],b_city,b_day,d_city,d_day from writers
where (datepart(YEAR,d_day) = @year) and (DATEPART(MONTH,d_day)=@month)
end

--Search By Day Year--
if(@status=4)
begin

declare @Dayyear varchar(2);
declare @yearday varchar(2) 
SELECT @Dayyear = value FROM STRING_SPLIT(@searchbar, '-') WHERE RTRIM(value) <> '';  
SELECT @yearday = SUBSTRING(@searchbar, 1, 100);

--Movies Release On This Day and Year--
select m.m_id as [Movie ID],m.m_name as [Movie Name],m.release_date,m.rating,m.[description],g.[type] as Genre from movies m
inner join genre g on g.g_id=m.g_id
where (datepart(YEAR,m.release_date) = @yearday) and (DATEPART(DAY,m.release_date)=@Dayyear)
--Shows Release On This Day and Year--
select s.s_id as [Show ID],s.s_name as [Show Name],s.release_date,s.rating,s.[description],g.[type] as Genre,s.total_episodes from shows s 
inner join genre g on g.g_id=s.g_id
where (datepart(YEAR,s.release_date) = @yearday) and (DATEPART(DAY,s.release_date)=@Dayyear)
--Each Episode Of Show Release On This Day and Yearr--
select s.s_id as [Show ID],s.s_name as [Show Name],se.ep_name as [Episode Name],se.ep_num as [Episode Number],se.[description],se.ep_rating,se.release_date from shows s
inner join shows_eps se on se.s_id=s.s_id
where (datepart(YEAR,se.release_date) = @yearday) and (DATEPART(DAY,se.release_date)=@Dayyear)
--Actor Born Or Die On This Day and Year--
select a_id as [Actor ID],[name] as [Actor Name],gender,[description],b_city,b_day from Actors
where (datepart(YEAR,b_day) = @dat) and (DATEPART(DAY,b_day)=@Dayyear)
select a_id as [Actor ID],[name] as [Actor Name],gender,[description],b_city,b_day,d_city,d_day from Actors
where (datepart(YEAR,d_day) = @yearday) and (DATEPART(DAY,d_day)=@Dayyear)
--Directors Born Or Die On This Day and Year--
select d_id as [Director ID],[name] as [Director Name],gender,[description],b_city,b_day from Directors
where (datepart(YEAR,b_day) = @dat) and (DATEPART(DAY,b_day)=@Dayyear)
select d_id as [Director ID],[name] as [Director Name],gender,[description],b_city,b_day,d_city,d_day from Directors
where (datepart(YEAR,d_day) = @yearday) and (DATEPART(DAY,d_day)=@Dayyear)
--Writers Born Or Die On This Day and Year--
select w_id as [Writer ID],[name] as [Writer Name],gender,[description],b_city,b_day from writers
where (datepart(YEAR,b_day) = @yearday) and (DATEPART(DAY,b_day)=@Dayyear)
select w_id as [Writer ID],[name] as [Write Name],gender,[description],b_city,b_day,d_city,d_day from writers
where (datepart(YEAR,d_day) = @yearday) and (DATEPART(DAY,d_day)=@Dayyear)
end
--Search By Day or Month--
if(@status=5)
begin
--Movies Release On This Day or Month--
select m.m_id as [Movie ID],m.m_name as [Movie Name],m.release_date,m.rating,m.[description],g.[type] as Genre from movies m
inner join genre g on g.g_id=m.g_id
where (datepart(DAY,m.release_date) = @searchbar) or (DATEPART(MONTH,m.release_date)=@searchbar) or m.m_name like @searchbar
--Shows Release On This Day or Month--
select s.s_id as [Show ID],s.s_name as [Show Name],s.release_date,s.rating,s.[description],g.[type] as Genre,s.total_episodes from shows s 
inner join genre g on g.g_id=s.g_id
where (datepart(DAY,s.release_date) = @searchbar) or (DATEPART(MONTH,s.release_date)=@searchbar) or s.s_name like @searchbar
--Each Episode Of Show Release On This Day or Month--
select s.s_id as [Show ID],s.s_name as [Show Name],se.ep_name as [Epsiode Name],se.ep_num as [Episode Number],se.[description],se.ep_rating,se.release_date from shows s
inner join shows_eps se on se.s_id=s.s_id
where (datepart(DAY,se.release_date) = @searchbar) or (DATEPART(MONTH,se.release_date)=@searchbar) or se.ep_name like @searchbar
--Actor Born Or Die On This Day or Month--
select a_id as [Actor ID],[name] as [Actor Name],gender,[description],b_city,b_day from Actors
where (datepart(DAY,b_day) = @searchbar) or (DATEPART(MONTH,b_day)=@searchbar)
select a_id as [Actor ID],[name] as [Actor Name],gender,[description],b_city,b_day,d_city,d_day from Actors
where (datepart(DAY,d_day) = @searchbar) or (DATEPART(MONTH,d_day)=@searchbar)
--Directors Born Or Die On This Day or Month--
select d_id as [Director ID],[name] as [Director Name],gender,[description],b_city,b_day from Directors
where (datepart(DAY,b_day) = @searchbar) or (DATEPART(MONTH,b_day)=@searchbar)
select d_id as [Director ID],[name] as [Director Name],gender,[description],b_city,b_day,d_city,d_day from Directors
where (datepart(DAY,d_day) = @searchbar) or (DATEPART(MONTH,d_day)=@searchbar)
--Writers Born Or Die On This Day or Month--
select w_id as [Writer ID],[name] as [Writer Name],gender,[description],b_city,b_day from writers
where (datepart(DAY,b_day) = @searchbar) or (DATEPART(MONTH,b_day)=@searchbar)
select w_id as [Writer ID],[name] as [Write Name],gender,[description],b_city,b_day,d_city,d_day from writers
where (datepart(DAY,d_day) = @searchbar) or (DATEPART(MONTH,d_day)=@searchbar)
end

--Search By Day--
if(@status=6)
begin
--Movies Release On This Day--
select m.m_id as [Movie ID],m.m_name as [Movie Name],m.release_date,m.rating,m.[description],g.[type] as Genre from movies m
inner join genre g on g.g_id=m.g_id
where (datepart(DAY,m.release_date) = @searchbar) or m.m_name like @searchbar
--Shows Release On This Day--
select s.s_id as [Show ID],s.s_name as [Show Name],s.release_date,s.rating,s.[description],g.[type] as Genre,s.total_episodes from shows s 
inner join genre g on g.g_id=s.g_id
where (datepart(DAY,s.release_date) = @searchbar) or s.s_name like @searchbar
--Each Episode Of Show Release On This Day--
select s.s_id as [Show ID],s.s_name as [Show Name],se.ep_name as [Epsiode Name],se.ep_num as [Episode Number],se.[description],se.ep_rating,se.release_date from shows s
inner join shows_eps se on se.s_id=s.s_id
where (datepart(DAY,se.release_date) = @searchbar) or s.s_name like @searchbar
--Actor Born Or Die On This Day
select a_id as [Actor ID],[name] as [Actor Name],gender,[description],b_city,b_day from Actors
where (datepart(DAY,b_day) = @searchbar)
select a_id as [Actor ID],[name] as [Actor Name],gender,[description],b_city,b_day,d_city,d_day from Actors
where (datepart(DAY,d_day) = @searchbar)
--Directors Born Or Die On This Day--
select d_id as [Director ID],[name] as [Director Name],gender,[description],b_city,b_day from Directors
where (datepart(DAY,b_day) = @searchbar)
select d_id as [Director ID],[name] as [Director Name],gender,[description],b_city,b_day,d_city,d_day from Directors
where (datepart(DAY,d_day) = @searchbar)
--Writers Born Or Die On This Day--
select w_id as [Writer ID],[name] as [Writer Name],gender,[description],b_city,b_day from writers
where (datepart(DAY,b_day) = @searchbar)
select w_id as [Writer ID],[name] as [Write Name],gender,[description],b_city,b_day,d_city,d_day from writers
where (datepart(DAY,d_day) = @searchbar)
end

--search by date--
if(@status=7)
begin

declare @date date
SELECT @date = CONVERT(date,@searchbar)

--Movies Release On This Date--
select m.m_id as [Movie ID],m.m_name as [Movie Name],m.release_date,m.rating,m.[description],g.[type] as Genre from movies m
inner join genre g on g.g_id=m.g_id
where m.release_date=@date
--Shows Release On This Date--
select s.s_id as [Show ID],s.s_name as [Show Name],s.release_date,s.rating,s.[description],g.[type] as Genre,s.total_episodes from shows s 
inner join genre g on g.g_id=s.g_id
where s.release_date=@date
--Each Episode Of Show Release On This Date--
select s.s_id as [Show ID],s.s_name as [Show Name],se.ep_name as [Epsiode Name],se.ep_num as [Episode Number],se.[description],se.ep_rating,se.release_date from shows s
inner join shows_eps se on se.s_id=s.s_id
where se.release_date=@date
--Actor Born Or Die On This Day
select a_id as [Actor ID],[name] as [Actor Name],gender,[description],b_city,b_day from Actors
where b_day=@date
select a_id as [Actor ID],[name] as [Actor Name],gender,[description],b_city,b_day,d_city,d_day from Actors
where d_day=@date
--Directors Born Or Die On This Day--
select d_id as [Director ID],[name] as [Director Name],gender,[description],b_city,b_day from Directors
where b_day=@date
select d_id as [Director ID],[name] as [Director Name],gender,[description],b_city,b_day,d_city,d_day from Directors
where d_day=@date
--Writers Born Or Die On This Day--
select w_id as [Writer ID],[name] as [Writer Name],gender,[description],b_city,b_day from writers
where b_day=@date
select w_id as [Writer ID],[name] as [Write Name],gender,[description],b_city,b_day,d_city,d_day from writers
where d_day=@date
end
end
