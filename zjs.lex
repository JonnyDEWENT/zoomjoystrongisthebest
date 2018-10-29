%{
 	#include <stdio.h>
	#include <stdlib.h>
	int total = 0;
%}

%%

END 					{printf("END\n"); return 1;}
;					{printf("END STATEMENT\n"); total++;}
POINT\([0-9]{1,3},[0-9]{1,3}\) 			{printf("POINT\n"); total++;}
LINE\(([0-9]{1,3},){3}[0-9]{1,3}\) 				{printf("LINE\n"); total++;}
CIRCLE\(([0-9]{1,3},){2}[0-9]{1,3}\) 		{printf("CIRCLE\n"); total++;}
RECTANGLE\(([0-9]{1,3},){3}([0-9]{1,3})\)		{printf("RECTANGLE\n"); total++;}
SET_COLOR\((BLUE|RED|YELLOW|GREEN)\)	{printf("SET_COLOR"); total++;}
[0-9]+	 				{printf("INT\n"); total++;}
[0-9]+\.[0-9]+				{printf("FLOAT\n"); total++;}
[ \t\n]					;

.					{printf("YOU MESSED UP ON LINE %d!\n", total);}

%%

int main(int argc, char** argv) {
yylex();
}
