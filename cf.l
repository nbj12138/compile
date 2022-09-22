%{
#include<stdio.h>
#include<stdlib.h>
int yychars = 1;
%}
%option yylineno

INT ([1-9][0-9]*)|0
FLOAT ((0|[1-9][0-9]*)[.][0-9]*)|([.][0-9][0-9]*)
ID [a-zA-Z|_]([a-zA-Z_]|[0-9])*
SEMI ;
COMMA ,
RELOP >|<|>=|<=|==|!=
MINUS \-
PLUS \+
DIV \/
MUL \*
AND &&
OR \|\|
DOT \.
NOT \!
TYPE int|float
LP \(
RP \)
LB \[
RB \]
LC \{
RC \}
STRUCT struct
RETURN return
IF if
ELSE else
WHILE while
ASSIGNOP =

%%
[\t\r]+ {yychars += yyleng;}
[\n] {yychars = 1;}
{FLOAT} {printf("FLOAT at line %d,char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{INT} {printf("INT at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{SEMI} {printf("SEMI at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{DIV} {printf("DIV at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{MUL} {printf("MUL at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{COMMA} {printf("COMMA at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{RELOP} {printf("RELOP at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{MINUS} {printf("MINUS at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{AND} {printf("AND at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{OR} {printf("OR at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{DOT} {printf("DOT at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{NOT} {printf("NOT at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{TYPE} {printf("TYPE at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{LP} {printf("LP at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{RP} {printf("RP at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{LB} {printf("LB at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{RB} {printf("RB at line %d, chars %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{LC} {printf("LC at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{RC} {printf("RC at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{STRUCT} {printf("STRUCT at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{IF} {printf("IF at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{ELSE} {printf("ELSE at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{RETURN} {printf("RETURN at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{WHILE} {printf("WHILE at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{ASSIGNOP} {printf("ASSIGNOP at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
{ID} {printf("ID at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
. {printf("UNDEFINED at line %d, char %d: %s\n", yylineno, yychars, yytext); yychars += yyleng;}
%%

int main(int argc, char* argv[])
{
	if(argc > 1){
		if(!(yyin = fopen(argv[1], "r"))){
			perror(argv[1]);
			return 1;
		}
		while (yylex() != 0);
	}
	return 0;
}

