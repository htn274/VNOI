const   fi              ='BCAKE.inp';
        fo              ='BCAKE.out';
        maxn            =500;
var     m,n,k,res       :longint;
        stack           :array[1..maxn*maxn] of longint;
        a               :array[1..maxn+1,1..maxn+1] of longint;
        l,r,h           :array[0..maxn+1] of longint;

Procedure Docfile;
var     i,j,x:longint;
begin
        assign(input,fi); reset(input);
        readln(m,n,k);
        for i:= 1 to m do
        begin
                for j:= 1 to n do
                        begin
                                read(x);
                                a[i,j]:=ord(x>=k);
                        end;
                readln;
        end;
        close(input);
end;

Procedure Innit;
var     i,top:longint;
begin
        h[0]:=-1;
        h[n+1]:=-1;
        top:=0;
        fillchar(stack,sizeof(stack),0);
        for i:= 1 to n do
                if h[i]>h[i-1] then
                        begin
                                l[i]:=i;
                                inc(top);
                                stack[top]:=i;
                        end else
                        begin
                                while (top>0) and (h[i]<=h[stack[top]]) do dec(top);
                                inc(top);
                                l[i]:=l[stack[top]];
                                stack[top]:=i;
                        end;

        top:=0;
        fillchar(stack,sizeof(stack),0);
        for i:=n downto 1 do
                if h[i]>h[i+1] then
                        begin
                                r[i]:=i;
                                inc(top);
                                stack[top]:=i;
                        end else
                        begin
                                while (top>0) and (h[i]<=h[stack[top]]) do dec(top);
                                inc(top);
                                r[i]:=r[stack[top]];
                                stack[top]:=i;
                        end;
end;

Procedure Thuchien;
var     i,j:longint;
begin
        res:=0;
        for i:= 1 to m do
        begin
                for j:= 1 to n do
                        if a[i,j]=1 then inc(h[j]) else h[j]:=0;
                Innit;
                for j:= 1 to n do
                        if (r[j]-l[j]+1)*h[j]>res then
                                res:=(r[j]-l[j]+1)*h[j];
        end;
end;


BEGIN
Docfile;
Thuchien;
assign(output,fo); rewrite(output);
writeln(res);
close(output);
END.
