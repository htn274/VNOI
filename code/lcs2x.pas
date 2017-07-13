uses math;
const input='lcs2x.inp';
      output='lcs2x.out';
var   f,g:text;
      c:array[0..1501,0..1501] of longint;
      a,b,d:array[1..1500] of longint;
      t,n,m,dem:longint;
      procedure xuly;
      var  i,j,maxt,res:longint;
        begin
                res:=0;
                for i:= 1 to m do d[i]:=0;
                for i:= 1 to n do
                begin
                        maxT:=0;
                for j:= 1 to m do
                        begin
                                if a[i]=b[j] then c[i,j]:=maxt+1;
                                if a[i]>=2*b[j] then maxT:=max(maxt,d[j]);
                                if a[i]=b[j] then
                                        begin
                                                res:=max(res,c[i,j]);
                                                d[j]:=max(d[j],c[i,j]);
                                        end;
                        end;
                end;
                writeln(g,res);
        end;

      procedure xuli;
      var    maxt,i,j,x,y:longint;
        begin
                for i:= 1 to n do
                begin
                maxt:=1;
                for j:= 1 to m do
                        if a[i]<>b[j] then c[i,j]:=max(c[i-1,j],c[i,j-1]) else
                begin
                        for x:= 1 to i-1 do
                        for y:= 1 to j-1 do
                        if a[x]=b[y] then
                                if (2*a[x]<=a[i]) then
                                        maxT:=max(maxT,c[x,y]+1);
                        c[i,j]:=maxT;
                end;
                end;
                writeln(g,c[n,m]);
        end;
      procedure docfile;
      var     i,k:longint;
        begin
          assign(f,input);
          reset(f);
          assign(g,output);
          rewrite(g);
          readln(f,t);
          for k:= 1 to t do
          begin
          readln(f,n,m);
          for i:= 1 to n do read(f,a[i]);
          for i:= 1 to m do read(f,b[i]);
          fillchar(c,sizeof(c),0);
          if (m<=15) and (n<=15) then
          xuli else xuly;
          end;
          close(f);
          close(g);
        end;
begin
  docfile;
end.
