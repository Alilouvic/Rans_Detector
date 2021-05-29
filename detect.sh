#!/usr/bin/env bash 
# Sara_ransmware_detector : by djawad hammadi
# Copyright@2020
# let's start this shit
function banner(){
sleep 3 
clear
printf "
|\/\/\/|                  <-- SARA_RANS DETECTOR -->
|      |               < -- Coder : Djawad Hammadi --> 
|      |                 < -- twitter : @xlinex23 -->
| (o)(o)            ---------------------------------------
C      _)         |  WARNING : Before Start Say            |
 | ,___| ---------|            Oh Shit Here We Go Again    |  
 |   /             ----------------------------------------
 /____\         
"
printf "\n"
}
function check(){
    if [[ $EUID != 0 ]]; then
        printf "\n"
        printf "[*] This Script Must Be Run As Root So Please Use Sudo Command\n" 
        sleep 3
        exit 1
    elif [[ $EUID == 0 ]];then
            if [[ -e ran ]];then
            rm -rf ran
            fi
        printf "\n"
        if  ! command -v "apktool" > /dev/null ;then
            printf "[*] Apktool Not Found In Your System\n\n"
            apt-get install apktool -y > /dev/null
            printf "[*] Done\n" 
        else
            printf "[*] Apktool Alrady Installed In Your System\n\n"
        fi 
        if ! command -v "java" > /dev/null ;then
            printf "[*] Java Note Found In Your System Please Install It\n\n"
            sleep 3 
            exit 1 
        else
            printf "[*] Java Already Installed In Your Sytsem\n\n"
        fi 
   fi
}
function main(){
            trap ctrl_c INT
            ctrl_c() {
            printf "\n\n(Ctrl + C ) Detected, Trying To Exit...\n\n"
            sleep 1
            printf "[*] Thanks For Using This Tool :)\n\n"
            exit
}
            sleep 5
            printf "\n"
            printf "[*] Checking ....\n\n"
            FILE="ran/smali"
            FILE2="com"
            FILE3="termuxhackers"
            FILE4="id"
            if [[ -d "$FILE" ]];then
                test1= cd ran/smali
                if [[ -d "$FILE2" ]];then
                    test2= cd com
                    if [[ -d "$FILE3" ]];then
                        test3= cd termuxhackers
                        if [[ -d "$FILE4" ]];then
                            test4= cd id
                            printf "[*] Ransomware Detected ...\n"
                            printf "\n"
                            sleep 5 
                            printf "Info : \n\n"
                            sed 's+    const-string v7, +''+g' MyService\$100000000.smali > ok.smali
                            sed 's/"//g' ok.smali > ready.smali
                            printf "KEY : ";sed -n '91p' ready.smali; printf "\n"
                            back= cd ../../../..
                            name= cd res/values/
                            sed 's/<[^>]*>//g' strings.xml > titi.xml
                            perl -pe 's/   //' titi.xml > hello.xml
                            printf "APP NAME : ";sed -n '4p' hello.xml; printf "\n"
                            printf "DESCRIPTION : ";sed -n '5p' hello.xml; printf "\n"
                            printf "RANS_MESSAGE: ";sed -n '7p' hello.xml; printf "\n"
                        else
                            printf "This App Is Note A Sara Ransomware\n"
                        fi
                    else
                        printf "This App Is Note A Sara Ransomware\n"
                    fi 
                else
                    printf "This App Is Note A Sara Ransomware\n"
                fi 
            elif [[ ! -d "$FILE" ]];then
                 printf "This App Is Note A Sara Ransomware\n"
            fi
}
case $1 in
    -p | --payload )
        check
        sudo apktool d $2 -o ran > /dev/null 2>&1;
        banner
        main
    ;;
    -h | --helo )
        echo "-p | --payload : Enter Your APK Payload"
        echo "-h | --help : Show Help Command"
    ;;
    *)  
        echo "Error No Argument Please Check -h command"
        exit 
    ;;
esac
# end of this shit
