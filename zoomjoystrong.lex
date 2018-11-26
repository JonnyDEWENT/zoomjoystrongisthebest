%option noinput nounput

%{
 	#include <stdio.h>
	#include <stdlib.h>
	#include "zoomjoystrong.tab.h"
	int total = 0;

%}

%%

end 					{return END;}
;					{total++; return END_STATEMENT;}
point 			{total++; return POINT;}
line				{total++; return LINE;}
circle 		{total++; return CIRCLE;}
rectangle	{total++; return RECTANGLE;}
set_color	{total++; return SET_COLOR;}
[0-9]+	 				{ total++; yylval = atoi(yytext); return INT; }
[0-9]+\.[0-9]+				{ total++; yylval = atoi(yytext); return FLOAT; }
[ \t\n]					;

.					{printf("YOU MESSED UP ON LINE %d!\n", total);}

%%
