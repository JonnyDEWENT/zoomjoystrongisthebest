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

line: LINE x y u v;
point: POINT x y;
circle: CIRCLE x y r
rectangle: RECTANGLE x y w h
set_color: SET_COLOR r g b
        ;

x:      INT
        | FLOAT
        ;

y:      INT
        | FLOAT
        ;

u:      INT
        | FLOAT
        ;

v:      INT
        | FLOAT
        ;

r:      INT
        | FLOAT
        ;

w:      INT
        | FLOAT
        ;

h:      INT
        | FLOAT
        ;

g:      INT
        | FLOAT
        ;

b:      INT
        | FLOAT
        ;



%%

int main(int argc, char** argv) {
        yyparse();
}

void yyerror(const char *s) {
}
