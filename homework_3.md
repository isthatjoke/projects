1. Создать файл file1 и наполнить его произвольным содержимым. Скопировать его в file2. Создать символическую ссылку file3 на file1. Создать жесткую ссылку file4 на file1. Посмотреть, какие айноды у файлов. Удалить file1. Что стало с остальными созданными файлами? Попробовать вывести их на экран.
 - a) echo against_you! > file1
 - b) cat file1 > file2
 - c) ln -s file1 file3
 - d) ln file1 file4
 - e) ls -lai
 - f) rm file1
 - g) ls -lai (символическая ссылка стала красной, так как отсутствует конечный файл), cat file2, cat file4, cat file3 (получили ответ - cat: file3: No such file or directory)

2. Дать созданным файлам другие, произвольные имена. Создать новую символическую ссылку. Переместить ссылки в другую директорию.
 - a) mv file2 file5
 - b) mkdir new_one
 - c) mv new_link /new_one (получили ответ mv: cannot move 'new_link' to '/new_one': Permission denied)
 - d) если перекинуть ссылку физически через системный файловый менеджер, то далее из консоли - заходим в папку, куда перекинули файл, ссылка становится красной, соответственно, она не рабочая


3. Создать два произвольных файла. Первому присвоить права на чтение, запись для владельца и группы, только на чтение для всех. Второму присвоить права на чтение, запись только для владельца. Сделать это в численном и символьном виде.
 - a) touch file1
 - b) touch file2
 - c) chmod ug=rw file1, chmod o=r или chmod 664 file1
 - d) chmod u=rw file2, chmod go-rwx file2 или chmod 600 file2
 
4. Создать пользователя, обладающего возможностью выполнять действия от имени суперпользователя.
 - a) sudo groupadd new
 - b) sudo useradd -M -g new_users -s /bin/bash new_one
 - c) sudo visudo
 - d) добавляем строчку new_one ALL=(ALL:ALL) ALL и сохраняем файл

5. * Создать группу developer, несколько пользователей, входящих в эту группу. Создать директорию для совместной работы. Сделать так, чтобы созданные одними пользователями файлы могли изменять другие пользователи этой группы.
 - a) sudo groupadd new_users
 - b) sudo useradd -M -g new_users -s /bin/bash new_user1
 - c) sudo useradd -M -g new_users -s /bin/bash new_user2
 - d) mkdir new_folder
 - e) sudo chgrp new_users new_folder
 - f) chmod -R 575 new_folder
 - g) cd new_folder
 - h) umask 002

6. * Создать в директории для совместной работы поддиректорию для обмена файлами, но чтобы удалять файлы могли только их создатели.
 - a) cd new_folder
 - b) mkdir new_one
 - c) chmod 1664 new_one

7. * Создать директорию, в которой есть несколько файлов. Сделать так, чтобы открыть файлы можно только, зная имя файла, а через ls список файлов посмотреть нельзя.
 - a) mkdir again_new
 - b) echo abra-kadabra > again_new/file1
 - c) echo xulivtule > again_new/file2
 - d) echo abirvalg > again_new/file3
 - e) chmod 333 again_new
 - f) cat again_new/file1