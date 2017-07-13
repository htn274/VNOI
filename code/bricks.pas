const input='bricks.inp';
      output='bricks.out';
var     f:text;
        g,y:extended;
        kq1,kq2:extended;

        procedure xuly;
        var s,p,delta:extended;
          begin
              s:=(g+4) /2;
              p:=g+y;
              delta:=(s*s)-4*p;
              if delta>0 then
              begin
              delta:=sqrt(delta);
              kq1:=(s-delta) /2;
              kq2:=(s+delta) /2;
              end else
                begin
                  kq1:=0;
                  kq2:=0;
                end;
          end;

begin
    assign(f,input);
    reset(f);
    readln(f,g,y);
    close(f);
    assign(f,output);
    rewrite(f);
    xuly;
    writeln(f,kq1:0:0,' ',kq2:0:0);
    close(f);
end.
