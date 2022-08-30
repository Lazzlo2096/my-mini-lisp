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

data LispVal = Atom String
           | List [LispVal]
           | String String
           | Number Integer
    


-- data [a]      = (:)  a [a]        | []
-- data []     a = (:)  a ([] a)     | []
-- data MyList a = Cons a (MyList a) | Nil



program2 = "(+ (+ 2 3) 8)"


s2 = List [ Atom "+", List [ Atom "+", Number 2, Number 3], Number 8 ]    -- "(+ (+ 2 3) 8)"


--------

program1 = "(+ 1 2)"
s1 = List [Atom "+", Number 1, Number 2]
s12 = Number 2

eval :: LispVal -> Integer
eval (Number x)     = x
-- eval (Atom x)       = -- ??
-- eval (List (x:xs))  = eval x + eval xs -- ??
eval (List [Atom "+", Number a, Number b]) = (+) a b
{-
eval (Atom x) = case x of
            "+" -> evalWithOp (eval ?? ) (+)
            "-" -> evalWithOp (eval ?? ) (-)

evalWithOp :: LispVal -> (a -> b) -> Integer
evalWithOp a op = 
-}


ops = [
  ( "+", (+) ),
  ( "-", (-) )
  ]
--------

main = do
  putStrLn "Hello World"

  print $ eval s12 == 2
  print $ eval s1  == 3
