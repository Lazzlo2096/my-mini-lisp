--------
--parser:
-- "(" s_expr ")"
-- s_expr = name | "+" <> number <> number => Plus (toInt $2) (toInt $3)
--
-- (def x 42) => m::Map String Value ; m.add("x", "42");
-- Not multy map. -- Hash? Or Tree?
--
--
--------

program3 = "(def x 42) (+ x 8)"

--------

data SExpr = A [SExpr]
           | B String
           | C Integer


-- data [a]      = (:)  a [a]        | []
-- data []     a = (:)  a ([] a)     | []
-- data MyList a = Cons a (MyList a) | Nil



program2 = "(+ (+ 2 3) 8)"


s2 = A [ B "+", A [ B "+", B "2", B "3"], B "8" ]    -- "(+ (+ 2 3) 8)"
s3 = A [ B "doThing" ]                              -- "(doThing )"
s4 = A [ B "doThing", A [B "1" , B "2", B "3"] ]    -- "(doThing 1 2 3)"

--------

program1 = "(+ 1 2)"
s1 = A [B "+", C 1, C 2]


-- eval :: Arithms -> Integer
-- eval (Plus a b) = (+) a b

--------

main = do
  putStrLn "Hello"
  putStrLn "World"
  -- print $ eval s1 == 3
