select hello('내이름');

call usp_countBooks();

call usp_findbytitle('안녕', @count); -- out자리에는 결과를 받을 공간을 넣어주면 된다
select @count;

call usp_selectTable('persons');

call usp_loop(10);

select * from book;
select * from persons;
select * from files;