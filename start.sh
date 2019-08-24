#! /bin/bash
# If you need to debug you code you can write is bash shell: bash -x /home/../start.sh ($pwd/$0)
# If you are stupid and do not want to write -x everytime, you can write insted of #! /bin/bash this #! /bin/bash -x in first line of you file
# and the most coolest thing - you can debug you code with with set (set -x and set +x). set -x from start and set +x where stop

# all your addition spaces will remove
# ; in the end of line can be or can not to be (line end when find ; or \n, one of this sign must to be for bash be able to understood that line is done) (if you need to write some line of bash code in one line, you will should to use ';', because here is not any \n sign)
# if want to know what version of bash you use, you can use variable BASH_VERSION
echo $BASH_VERSION;

if [[ $1 == -p ]]
then
	if [[ $2 == 1111 ]]
	then
		echo You entered;
	else
		echo Wrong password;
		exit 1; # exit without code (when you force to stop executing you must to give a code of exit (0 (success), 1, 2 or 3), or it will be just stoped)
	fi
else
	echo You must to past your password;
	exit 2;
fi
# you can also use elif (else if)

# you can not use equel sign with spaces, it will be wrong (args = $@ - wring way)
args1=($@); # this is makes an array spliting by space (no spce in variable, in any case) # if past only this variable without index - it will out the first value of array
args2=$@; # this is take all string

arr=(1 2 3 4 5 6 7 8);

echo $args1; # as far as this is an array, it will print first value (${args[0]})
echo ${args1[1]};
echo $args2; # print all your params as a string spliting by one space
echo * # execute ls command in your pwd and print it
echo $@; # it will print all parameter past after calling an bash script as a string (so you do not need past index)
echo $PWD; # your present working directory
echo $0 $1 $2 $3 $4 $5; # here is each numeric answer to his place pasted in calling script, where zero is the name of script and other answer to his place (how in array)
echo $#; # print a count of parametr pasted after calling script
echo ${arr[0]} ${arr[1]} ${arr[2]} ${arr[3]} ${arr[4]} ${arr[5]}; # array
echo ${arr[@]}; # take all val and make a string, as a $@, but for your array
echo ${!arr[@]}; # ! works only with array, and show you an indexes 
echo ${#arr[@]}; # how length of array or 1 if only one string
arr[8]=9; # add new elem to array, as it had the last index 7
arr[0]=10; # change first elem which was 1, and now it is 10
unset arr[0]; # remove elem with index 0
echo -e 'Past file name: \c';
read; # assign this value to REPLY
# echo $REPLY;

# In bash every parametrs is an array, when you set to any key a value, you just put this value to first place (zero (0) index), and when write output command without index, it by default take 0 index. Example in next line:
var=true;
echo ${var[@]}; # will print only true as well as the next
echo ${var[0]};
echo ${#var[@]}; # will print 1, beacuse in this array only one param
echo ${var}; # print param with 0 index
echo ${var[1]}; # if print a param with index which does not exist, it will just move you to next line (will print only '\n')

echo -e 'This' ${REPLY}: ; # -e - intrepetor your string and parse it (its allow to you use \n (next line) \c (clear after) \t (tab) and so on)

# --------------------------------------- if --------------------------------------- #
# Description

## a=12
## b=10

# When you compare string on greter or less condition - bash will use ascii (american standart code for information interchange) and for that you must to use [[]], it makes because always checking base on ascii would be very heavy, so when you need it you can use it by [[]]

# -eq (equal). Example: if [ $a -eq $b ] - no
# -ne (not equal). Example: if [ $a -ne $b ] - yes 
# -gt (greater then). Example: if [ $a -gt $b ] - yes
# -ge (greater or equal then). Example: if [ $a -ge $b ]  - yes
# -lt (less then). Example: if [ $a -lt $b ] - no
# -le (less or equal then). Example: if [ $a -le $b ] - no

# = or == (equal) (you can use both, but must to use == insted of =). Example: if [ $a == $b ] - no
# != (not equal). Example: if [ $a != $b ] - yes

# (With this sign you must use double (()) or [[]], else will have only yes) ( [[  ]] on a ascii; ((  )) on numeric parsing; ) (You must use this brackets, because everything what in this brackets will parse to numeric, and letter can not be in this brackets in your case: -lt, -le, -eq, -ne, -gt, -ge. And insted of this you must to use: >, <, <=, >=, !=, = (==), and in another case you can use: ++)
# < (greater then). Example: if (( $a < $b )) or if want to compare string with ascii use if [[ $a < $b ]] - no (since we use number)
# <= (greater or equal then). Example: if (( $a <= $b )) if to use [[ $a <= $b ]], you will get an error, I dunno why, but like this only with <= and >=
# > (less then). Example: if (( $a > $b )) or if want to compare string with ascii use if [[ $a > $b ]] - yes (since we use number)
# >= (less or equal then). Example: if (( $a >= $b )) if to use [[ $a >= $b ]], you will get an error, I dunno why, but like this only with <= and >=

# -z (is null). Example: if [[ -z $a ]] - no (null is a clear string (''), zero is not a null (null is only '' or unexisting param)) (must use [[]], because all pasted in transform to string and check as a string)

# && or -a (and). Example: if [ $a -gt 10 ] && [ $a -gt 11 ] or if [ $a -gt 10 -a $a -gt 11 ] or if [[ $a -gt 10 && $a -gt 11 ]] -yes
# || or -o (or). Example: if [ $a -gt 10 ] || [ $a -gt 11 ] or if [ $a -gt 10 -o $a -gt 11 ] or if [[ $a -gt 10 || $a -gt 11 ]] -yes

# --------------------------------------- fi --------------------------------------- #

# I put 'echo;' every because I learned -e in echo and I must to use it somewhere
if [ -e $REPLY ] # -e checks for existing a file or folder
then
	echo -e 'exist. (-e)\c';
	echo;
	if [ -f $REPLY ] # -f checks for existing a file
	then
		echo -e 'exist. (-f)\c';
	else
		echo -e 'not exits. (-f)\c'
	fi
	echo;

	if [ -d $REPLY ] # -d checks for existing a directory
	then
		echo -e 'exist. (-d)\c';
	else
		echo -e 'not exits. (-d)\c'
	fi
	echo;

	if [ -b $REPLY ] # -b checks for existing so calling block special file (picture, video, music and so on) (media file)
	then
		echo -e 'exist. (-b)\c';
	else
		echo -e 'not exits. (-b)\c'
	fi
	echo;

	if [ -c $REPLY ] # -c checks for existing so calling a character special file (word or any text data) (ordinary file)
	then
		echo -e 'exist. (-c)\c';
	else
		echo -e 'not exits. (-c)\c'
	fi
	echo;

	if [ -r $REPLY ] # -r checks for existing read rule for file
	then
		echo -e 'readable. (-r)\c';
	else
		echo -e 'not readable. (-r)\c'
	fi
	echo;

	if [ -w $REPLY ] # -w checks for existing so calling a character special file (word or any text data) (ordinary file)
	then
		echo -e 'writable. (-w)\c';
	else
		echo -e 'not writable. (-w)\c'
	fi
	echo;

	if [ -x $REPLY ] # -x checks for existing so calling a character special file (word or any text data) (ordinary file)
	then
		echo -e 'executable. (-x)\c';
	else
		echo -e 'not executable. (-x)\c'
	fi
	echo;

	if [ -s $REPLY ] # -s checks for empty
	then
		echo -e 'is not empty. (-s)\c';
	else
		echo -e 'is empty. (-s)\c'
	fi
	echo;
else
	echo -e 'not exits. (-e)\c'
	echo;
fi
# I put 'echo;' every because I learned -e in echo and I must to use it somewhere

echo 'If you do not want to write it, type enter without any text and you will be able to see next process.'
echo -e 'Write a filename, in which you want to add a word in new line, which you will type after write filename: \c';
read;
echo 'If you want to quite, you must to press enter if you on the line which writing and then press Ctrl+C (If you press Ctrl+C when on the writing line, this line will be remove) (Just clean lines are acceptable)';
if [ -z $REPLY ]
then
	echo -e '\c'; # just for continue executing (you can not use break here, it make sence to use break in for, select, while, until, ... loop)
else
	if [ -f $REPLY ]
	then
		cat >> $REPLY; # add new character to finded file
	else 
		cat > $REPLY; # rewrite all file, as it is just created
	fi
fi

# Arithmetic
echo Arithmetic;
# With $((  )) - only integer
echo $(( ${arr[0]} + ${arr[1]} + ${arr[2]} + ${arr[3]} ));
echo $(( ${arr[2]} - ${arr[3]} ));
echo $(( ${arr[2]} * ${arr[3]} ));
echo $(( ${arr[2]} / ${arr[3]} ));
echo $(( ${arr[2]} % ${arr[3]} )); # back the number, which did not enter in division (answer always less then second values ( $arr[3] ))
# With $(expr  ) - only integer
echo $(expr ${arr[1]} + ${arr[2]} + ${arr[3]} + ${arr[4]} ); # arr[0] is unset on line 46
echo $(expr ${arr[2]} - ${arr[3]} );
echo $(expr ${arr[2]} \* ${arr[3]} ); # back error if '*' will be alone (dunno why)
echo $(expr ${arr[2]} / ${arr[3]} );
echo $(expr ${arr[2]} % ${arr[3]} );
# In bash exist a lot of modules, for example bc (you can read about them in cmd by typing man bc), which allow you to make arithmetic operation, by parse you issue and work with it, and also it allows to work you with decimal (non integer) number, and makes more possibilities (all of them you can read by typing in cmd 'man bc')
# Do not use spaces
# -------------- Use module! -------------- #
echo 'The same, but without $((  )) or $(expr  ): ';
echo ${arr[0]}+${arr[1]}+${arr[2]}+${arr[3]}|bc;
echo ${arr[2]}-${arr[3]}|bc;
echo ${arr[2]}*${arr[3]}|bc;
echo ${arr[2]}/${arr[3]}|bc; # here we will got count of how many times first number enters in second
echo 'scale=2;'${arr[2]}/${arr[3]}|bc; # here we say that I want to see two number after comma, and if issue division to whole number we will see .00 (use '' because ';' ends a line, and without '' will get an error)
echo ${arr[2]}%${arr[3]}|bc;

# RegExp
# If you want to find some specific character, use \ and your character. Example: \|
# 'pat' 	- Looking for 'pat' set in any place of whole issue.
# [dDreQ] 	- Looking for letter which count in [] in whole issue.
# [a-z] 	- Looking for small letter in whole issue.
# [A-Z] 	- Looking for big letter in whole issue.
# [a-Z] 	- Looking for any letter in whole issue.
# [a-Z0-9] 	- Looking for any letter and digits in whole issue.
# [^] 		- Start an issue from this.
# .	    	- Matches any single character.
# ?	    	- The preceding item is optional and will be matched, at most, once.
# *	    	- The preceding item will be matched zero or more times.
# +	    	- The preceding item will be matched one or more times.
# {N}		- The preceding item is matched exactly N times.
# {N,}		- The preceding item is matched N or more times.
# {N,M}		- The preceding item is matched at least N times, but not more than M times.
# -     	- Represents the range if it's not first or last in a list or the ending point of a range in a list.
# ^	    	- Matches the empty string at the beginning of a line; also represents the characters not in the range of a list.
# $	    	- Matches the empty string at the end of a line.
# \b		- Matches the empty string at the edge of a word.
# \B		- Matches the empty string provided it's not at the edge of a word.
# \<		- Match the empty string at the beginning of word.
# \>		- Match the empty string at the end of word.

regexp='([a-zA-Z0-9]{3,})\@([a-z]{4,})\.([a-z]{2,})'
temp='mik11110@gmail.com'
if [[ $temp =~ $regexp ]]
then
  echo "Email is accept"
else
  echo "Wrong email"
fi

# Case
case=`df -h | awk '{print $5}' | grep % | grep -v Use | sort -n | tail -1 | cut -d "%" -f1 -`

# this ) use like:
# 1)
# 2)
# 3)
# 4)
# ...
# * - if non of previous script was not work, it will execute default case, which is this
# and write ; twice (;;) needed for showing to bash, that this is the end of this case, because we can use ; once when want to say that this line is done (or can not to use), and this lines can be a lot in one case, and for keep bash clean to know that this case is done we write ;; (as I understood first ; is done a line and second ; is done for case)
case $case in
    [1-6])
        Message="All is quiet.";;
    [7-8])
        Message="Start thinking about cleaning out some stuff.  There's a partition that is $space % full.";;
    9[1-8])
        Message="Better hurry with that new disk...  One partition is $space % full.";;
    99)
        Message="I'm drowning here!  There's a partition at $space %!";;
    *)
        Message="I seem to be running with an nonexistent amount of disk space...";;
esac

echo $Message

# while loop
# you can just add new stuff in $while, and see it in loop echo from end to start
# single round brackets use only when you want to declare array, in all other cases you will use double round brackets
while=(1 2 3);
n=${#while[@]};

while (( $n > 0 )) # you can use (()) and [[]] as in if statement ( [[  ]] )
do
    xterm & # this & need for run this term in background (pick out new thread for this command), we need this, because this term will block our executing until close it
    gnome-terminal # here we do not use &, because this term does not block our thread
    (( n-- ));
    echo ${while[$n]};
done

# read file not only with 'cat'
# read also with comment
while read line
do
	echo $line
done < ./root.sh # as I understood, its like do-while

cat ./root.sh | while read line # this pipe works with stream, it just takes an stdout of its own stream and put it in stdin of next script, and in while loop I will execute code while I will be able to read what comes to stdin from stdout
do
	echo $line
done

echo -e '1\n2\n3\n4' | while read line # as I understood after this executing, it takes by line, to '\n' sign
do
	echo $line
done

# also can use IFS

# until loops
# ((  )) just parse (if you will use it with $, it will execute in bash, and can show an error of wrong command)
# be careful when use any command, because you can run it in bash shell, and get an error
until=1;
until (( $until == 11 ))
do
	echo $until;
	(( until++ ))
done

# for
for=(1 2 3 4 5)

for i in 1 2 3 4 5
do
	echo $i;
done

for i in {1..10} # like: for i in 1 2 3 4 5 6 7 8 9 10
do
    echo $i;
done

for (( i=0; i<=5; i=i+1 )) # or i++
do
	echo $i;
done

for i in {0..50..10} # like: for (( i=0; i<=50; i=i+10 ))
do
    echo $i;
done

for i in ${for[@]} # for var push from his stdout stream to stdin stream in i var
do
    echo $i;
done

for i in *
do
	if [ -f $i ]
	then
		echo $i is a file
	elif [ -d $i ]
	then
		echo $i is a directory
	else
		echo $i is a unknown
	fi
done

# select loop
# case is use with select
# this ) use like:
# 1)
# 2)
# 3)
# 4)
# ...
# * - if non of previous script was not work, it will execute default case, which is this
# and write ; twice (;;) needed for showing to bash, that this is the end of this case, because we can use ; once when want to say that this line is done (or can not to use), and this lines can be a lot in one case, and for keep bash clean to know that this case is done we write ;; (as I understood first ; is done a line and second ; is done for case)
select=(sharaga bomsh chugun falcon9);
echo 'Type somethis, which not exist for exit';
select i in ${select[@]}
do
	case $i in
		sharaga)
			echo 'sharaga is norm?';;
		bomsh)
			echo 'bomsh syka';;
		chugun)
			echo 'Y ebal chugun';;
		falcon9)
			echo 'Big fucking rocket';;
        *)
			echo 'This does not exist';
			break; # or: continue;; # break - go out from select loop (insted of exit, it continue to execute your code); continue - without ending code go to next step of loop
            ;;
	esac
done

# we also can open another bash script file
# if you use in script file read command, you can use it here and reply put in executing this file as you do in this file, when write a password
cat ./root.sh # show what inside this file
bash ./root.sh # execute this file

# function
# You can declare function in two way. Example:
name='Ander';
function print(){
	echo $@
}

print_with_greating(){
    local name=$1 # every var which you call became global, but in this way of declare var is more better, because it is local. And yes $@ is always local and give by executing this function
    echo 'Hi' $name
}

echo 'Hello' $name
print foo and bar # first is calling function, and then you give a parametr (cool)
print_with_greating Vel
echo 'Hello again' $name

# usage
error1(){
	echo 'You must to provide any file name'
}

error2(){
	echo 'Wrong file name'
}

file_finder(){
	if [ -z $1 ]
	then
        error1
	elif [ -f $1 ]
    then
        echo $1;
    else
        error2
    fi
}

file_finder root.sh

# readonly
readonly -f error2 # -f means for function
readonly -f error1
error1(){
	echo 'You must to provide any file name!'
}
error2(){
	echo 'Wrong file name!'
}
var_for_read_only=1
readonly var_for_read_only # for variable
var_for_read_only=2
readonly # show the list of readonly valiables
readonly -f # show the list of readonly function

# signals and traps
# and success executing
# You must to define a trap before executing code, or it will work only with coming after code
trap 'echo you done && echo ahahahaha && exit' 2; # if the srcipt before && execute successfully - it will execute the script after &&, the same case you can provide with ||, | and &

# 0 (0 - no change) - On exit from shell
# 1 (SIGHUP) - Clean tidyup
# 2 (SIGINT) - Interrupt
# 3 (SIGQUIT) - Quit
# 6 (SIGABRT) - Abort
# 9 (SIGKILL) - Die Now (cannot be trapped)
# 14 (SIGALRM) - Alarm Clock
# 15 (SIGTERM) - Terminate

num=1
while (( 1 == 1 ))
do
    echo $num
    (( num++ ))
    sleep 5; # wait for 5 seconds after continue
	if (( num % 5 == 0 ))
	then
		echo 'To stop type Ctrl+C and see your traps';
	fi
done
# it is not working, I dunno why
trap # shows the list of all traps
trap - 2 # delete all custom traps for signal with 2
