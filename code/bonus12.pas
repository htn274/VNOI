uses math;
const input='bonus.inp';
      output='bonus.out';
      limit=1000*1000*1000;
var   f:text;
      a,s:array[0..1000,0..1000] of longint;
      u,d,l,r:array[1..1000] of longint;
      n,k:longint;
      best:int64;

      procedure docfile;
      var   i,j:longint;
        begin
            assign(f,input);
            reset(f);
            fillchar(s,sizeof(s),0);
            readln(f,n,k);
            for i:= 1 to n do
            for j:= 1 to n do
              begin
                read(f,a[i,j]);
                s[i,j]:=s[i-1,j]+s[i,j-1]-s[i-1,j-1]+a[i,j];
              end;
            close(f);
        end;

      procedure thuchien;
      var i,j:longint;
          sum:int64;
        begin
                best:=-1;
                for i:= 1 to n-k+1 do
                for j:= 1 to n-k+1 do
                best:=max(best,s[i+k-1,j+k-1]-s[i-1,j+k-1]-s[i+k-1,j-1]+s[i-1,j-1]);
                for i:= 1 to n do
                begin
                for j:= 1 to n do
                        write(s[i,j],' ');
                        writeln;
                end;
        end;

begin
  docfile;
  thuchien;
  assign(f,output);
  rewrite(f);
  writeln(f,best);
  close(f);
end.



