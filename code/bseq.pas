uses math;
const   fi='bseq.inp';
        fo='bseq.out';
        maxn=5000;
        maxm=5000;
var     f,g:array[0..maxn+1,0..maxm+1] of longint;
        a,b:array[1..maxn+1] of longint;
        m,n:longint;
        procedure docfile;
        var     i:longint;
                begin
                        assign(input,fi); reset(input);
                        readln(m,n);
                        for i:= 1 to m do read(a[i]);
                        for i:= 1 to n do read(b[i]);
                        close(input);
                end;

        procedure thuchien;
        var     i,j:longint;
                begin
                        fillchar(f,sizeof(f),0);
                        fillchar(g,sizeof(g),0);
                        for i:= 1 to m do
                        for j:= 1 to n do
                                if a[i]>b[j] then
                                        begin
                                                f[i,j]:=g[i-1,j-1]+1;
                                                g[i,j]:=max(g[i-1,j],g[i,j-1]);
                                        end else
                                if a[i]<b[j] then
                                        begin
                                                g[i,j]:=f[i-1,j-1]+1;
                                                f[i,j]:=max(f[i-1,j],f[i,j-1]);
                                        end else
                                        begin
                                                g[i,j]:=f[i-1,j-1]+1;
                                                f[i,j]:=g[i-1,j-1]+1;
                                        end;
                end;

begin
        docfile;
        thuchien;
        assign(output,fo); rewrite(output);
        writeln(max(f[m,n],g[m,n]));
        close(output);
end.