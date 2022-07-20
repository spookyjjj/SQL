select hello('내이름');

call usp_countBooks();

call usp_findbytitle('안녕', @count);
select @count;

call usp_selectTable('persons');

call usp_loop(10);

select * from book;
select * from persons;
select * from files;