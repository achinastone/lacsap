program virt;

type
   base	= object
             d, e: integer;
             function a(x : integer): integer; virtual;
             function b(x : integer): integer; virtual;
             function cv(x : integer): integer; virtual;
	   end;

   derived = object(base)
              function b(x : integer): integer; override;
              function a(x : integer): integer; override;
	     end;

der2 = object(derived)
           function cv(x : integer): integer; override;
	end;

function base.cv(x : integer): integer;
begin
   writeln('In CV');
   cv := a(x) + b(x);
end;

function base.a(x : integer): integer;
begin
   writeln('Base.a');
   a := x;
end; { base }

function derived.a(x : integer): integer;
begin
   writeln('derived.a');
   a := x * 2;
end;

function base.b(x : integer): integer;
begin
   writeln('Base.b');
   b := x * 3;
end; { base }

function derived.b(x : integer): integer;
begin
   writeln('derived.b');
   b := x * 4;
end; { derived }

function der2.cv(x : integer) : integer;
begin
   writeln('Derived2 CV');
   cv := 7 + a(x) + b(x);
end; { der2 }


procedure p;
var
   aa : base;
   bb : derived;
   d  : integer;
   e  : integer;
begin
   e := aa.a(7);
   d := aa.cv(5);
   writeln('d:', d);
   writeln('e:', e);
   e := bb.a(7);
   d := bb.cv(5);
   writeln('d:', d);
   writeln('e:', e);
end;

var
   a : base;
   b : derived;
   c : der2;
   x : integer;
   y : integer;

begin
   x := a.a(2);
   y := b.a(2);
   writeln('a:', x, ' b:', y);
   x := a.b(3);
   y := b.b(3);
   writeln('a:', x, ' b:', y);
   x := a.cv(4);
   y := b.cv(4);
   writeln('a:', x, ' b:', y);
   x := c.cv(4);
   writeln('c:', x);

   p;
end.




