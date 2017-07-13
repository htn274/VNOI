uses math;
const   fi              ='BONUS13.inp';
        fo              ='BONUS13.out';
type    chess           =record
        x,y             :longint;
        score           :int64;
        end;

var     bonus,notbonus  :array[1..64] of chess;
        hx              :array[1..8] of longint=(-2,-2,-1,-1,1,1,2,2);
        hy              :array[1..8] of longint=(-1,1,-2,2,-2,2,-1,1);
        k,count         :longint;
        res             :int64;
        M,H,X,T         :array[1..64,1..64] of boolean;
        dd              :array[1..64,1..64] of longint;

Procedure Docfile;
var     i:longint;
begin
        assign(input,fi); reset(input);
        readln(k);
        for i:= 1 to k do
        with bonus[i] do
        begin
                readln(bonus[i].x,bonus[i].y,bonus[i].score);
                dd[x,y]:=score;
        end;
        close(input);
end;


Function CheckM(i,j:longint):boolean;
var x,y,h:longint;
begin
        x:=notbonus[i].x;
        y:=notbonus[i].y;
        for h:= 1 to 8 do
                if (bonus[j].x=x+hx[h]) and (bonus[j].y=y+hy[h]) then
                        exit(true);
        exit(false);
end;

Function CheckT(i,j:longint):boolean;
begin
        if abs(notbonus[i].x-bonus[j].x)=abs(notbonus[i].y-bonus[j].y) then
                exit(true);
        exit(false);
end;

Function CheckX(i,j:longint):boolean;
begin
        if (notbonus[i].x=bonus[j].x) or (notbonus[i].y=bonus[j].y)  then
                exit(true);
        exit(false);
end;

Function CheckH(i,j:longint):boolean;
begin
        CheckH:=CheckT(i,j) or CheckX(i,j);
end;

Procedure Innit;
var     i,j:longint;
begin
        for i:= 1 to 8 do
                for j:=1 to 8 do
                if dd[i,j]=0 then
                        begin
                                inc(count);
                                notbonus[count].x:=i;
                                notbonus[count].y:=j;
                        end;

        for i:= 1 to count do
                for j:= 1 to k do
                        begin
                                M[i,j]:=CheckM(i,j);
                                H[i,j]:=CheckH(i,j);
                                X[i,j]:=CheckX(i,j);
                                T[i,j]:=CheckT(i,j);
                        end;
end;

Function Cal(hau,xe,ma,tuong:longint):int64;
var sum:int64; j:longint;
begin
        sum:=0;
        for j:= 1 to k do
                if (M[ma,j]) or (H[hau,j]) or (X[xe,j]) or (T[tuong,j]) then
                        sum:=sum+bonus[j].score;
        exit(sum);
end;

Procedure Thuchien;
var     hau,xe,tuong,ma:longint;
begin
        for hau:= 1 to count do
                for xe:= 1 to count do
                if xe<>hau then
                        for tuong:= 1 to count do
                                if (tuong<>xe) and (tuong<>hau) then
                                for ma:= 1 to count do
                                        if (ma<>tuong) and (ma<>xe) and (ma<>hau) then
                                                res:=max(res,Cal(hau,xe,tuong,ma));

end;


BEGIN
Docfile;
fillchar(M,sizeof(M),false);
fillchar(H,sizeof(H),false);
fillchar(X,sizeof(X),false);
fillchar(T,sizeof(T),false);
Innit;
Thuchien;
writeln(res);
END.