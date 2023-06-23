*1.  di gitlab (state awal)*
other_branch           @@@@@@@@@-@@@
main (server)          XXXXXXXXX

*2. git clone <url>*
other_branch           @@@@@@@@@-@@@
main (server)          XXXXXXXXX
main (local)           ========= (me)

*3. git checkout -b <my_branch>*
other_branch           @@@@@@@@@-@@@
main (server)          XXXXXXXXX
main (local)           =========
my_branch (local)      ######### (me)

*4. melakukan pekerjaan di branch kita, other branch MR ke main (server)*
other_branch           @@@@@@@@@-@@@
main (server)          XXXXXXXXX-@@@
main (local)           =========
my_branch (local)      #########-##  (me)

*5. git checkout main*
other_branch           @@@@@@@@@-@@@
main (server)          XXXXXXXXX-@@@
main (local)           =========     (me)
my_branch (local)      #########-##

*6. git pull*
other_branch           @@@@@@@@@-@@@
main (server)          XXXXXXXXX-@@@
main (local)           =========-@@@ (me)
my_branch (local)      #########-##

*7. git checkout <branch_kita>*
other_branch           @@@@@@@@@-@@@
main (server           XXXXXXXXX-@@@
main (local)           =========-@@@
my_branch (local)      #########-##   (me)

*8. git rebase main*
other_branch           @@@@@@@@@-@@@
main (server)          XXXXXXXXX-@@@
main (local)           =========-@@@
my_branch (local)      #########-@@@-##  (me)

*9. git push origin <branch_kita>*
other_branch           @@@@@@@@@-@@@
main (server)          XXXXXXXXX-@@@
main (local)           =========-@@@
my_branch (local)      #########-@@@-##  (me)
my_branch (server)     #########-@@@-##

*10. Merge request di gitlab*





