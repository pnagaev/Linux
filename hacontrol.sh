#!/bin/bash
# hacontrol.sh
# Simple script for HAProxy management
#
#
x=0

while [$x=0]
clear
echo -e '\n HAProxy service script \n
        1.Status
        2.Stop
        3.Start
        4.Restart
        5.Edit
        6.Check
        7.Log
        8.Tail
        9.Quit
'
read -p "Your choice:" choice

do
    case $choice in
        "1")
            echo "$choice - Status"

            sudo systemctl status haproxy.service -l --no-pager
        ;;

        "2")
           echo "$choice - Stop"

           sudo systemctl stop haproxy.service
        ;;

        "3")
           echo "$choice - Start"

           sudo systemctl start haproxy.service
        ;;

        "4")
           echo "$choice- Restart"

           sudo systemctl restart haproxy.service
        ;;


        "5")
           echo "$choice - Edit"

         sudo vim /etc/haproxy/haproxy.cfg

        ;;

        "6")

           echo "$choice - Check"

         sudo haproxy -c -f /etc/haproxy/haproxy.cfg

        ;;

        "7")
           echo "$choice - Log"

         sudo journalctl -u haproxy.service --since today --no-pager
        ;;

        "8")
           echo "$Tail - Tail"

         sudo tail -n 5 /var/log/haproxy.log

        ;;


        "9")
           echo "Bye!"
                x=1
           break;;

        *)
           echo "Ooops";;
    esac

 read -p "Press any key to continue . . ."
 echo ""

done
