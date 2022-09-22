%option yylineno
%option noyywrap
DIGIT [0-9]
LETTER [a-zA-Z]

FLOAT [+-]?({DIGIT}+)?\.{DIGIT}+([eE][+-]?(0|[0-9]*))
ILLEGALFLOAT ([+-]?({DIGIT}+)?[eE][+-]?{DIGIT}*\.{DIGIT}*)|([+-]?({DIGIT}+)?[eE]{LETTER}*)

%{
int count = 1;
%}

%%
{FLOAT} {printf("FLOAT at line %d,char %d:%s\n",yylineno,count,yytext);count+=yyleng;}
{ILLEGALFLOAT} {printf("Error Type A at line %d,char %d:Illegal floating point number:'%s',\n",yylineno,count,yytext);count+=yyleng;}
%%

int main(int argc,char *argv[])
{
if(argc>1){
if(!(yyin = fopen(argv[1],"r"))){
perror(argv[1]);
return 1;
}
while (yylex()!=0);
}
return 0;
}
