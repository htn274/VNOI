uses math;
const   fi='bonus.inp';
        fo='bonus.out';
        maxn=1000;
var     a,s:array[0..maxn,0..maxn] of longint;
        n,k,res:longint;
        procedure docfile;
        var     i,j:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(n,k);
                        fillchar(s,sizeof(s),0);
                        for i:= 1 to n do
                        begin
                                for j:= 1 to n do
                                        begin
                                                read(a[i,j]);
                                                s[i,j]:=s[i-1,j]+s[i,j-1]-s[i-1,j-1]+a[i,j];
                                        end;
                                readln;
                        end;
                        for i:= 1 to n do
                        begin
                                for j:= 1 to n do write(s[i,j],' ');
                                writeln;
                        end;
                        close(input);
                end;

        procedure xuli;
        var     i,j,t:longint;
                begin
                        res:=0;
                        for i:=1 to n-k+1 do
                        for j:=1 to n-k+1 do
                                begin
                                        t:=s[i+k-1,j+k-1]-s[i-1,j+k-1]-s[i+k-1,j-1]+s[i-1,j-1];
                                        res:=max(res,t);
                                end;
                end;

begin
        docfile;
        xuli;
        assign(output,fo); rewrite(output);
        writeln(res);
        close(output);
end.