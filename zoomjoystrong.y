%{
   #include <stdio.h>
   #include "zoomjoystrong.h"


void yyerror(const char *s);
%}

%token INT
%token END_STATEMENT
%token END
%token POINT
%token LINE
%token CIRCLE
%token RECTANGLE
%token SET_COLOR
%token FLOAT


%%

program:        statement_list END;

statement_list: statement
        | statement_list statement
        ;

statement:      command END_STATEMENT;

command: line
        | point
        | circle
        | rectangle
        | set_color
        ;

line: LINE INT INT INT INT {line($2,$3,$4,$5);};

point: POINT INT INT {point($2,$3);};

circle: CIRCLE INT INT INT {circle($2,$3,$4);};

rectangle: RECTANGLE INT INT INT INT{rectangle($2,$3,$4,$5);};

set_color: SET_COLOR INT INT INT {set_color($2,$3,$4);};
        ;



%%

int main(int argc, char** argv) {
        setup();
        yyparse();
        finish();
}

void yyerror(const char *s) {
}
