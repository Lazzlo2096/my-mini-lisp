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
{-
data Arithms = Plus Ar2 Ar2 -- не робит
data Ar2 = Arithms | Integer
-}
data Arithms =
    Plus Arithms Integer
  | Plus2 Integer Integer
  | Plus3 Integer Arithms
  | Plus4 Arithms Arithms
-- Не, это не правильно ваще. Plus должен быть как значение, а не как парсинг.

program2 = "(+ (+ 2 3) 8)"

s2 = Plus (Plus2 2 3) 8

--------
-- data Arithms = Plus Integer Integer

program1 = "(+ 1 2)"

-- s1 = parseMyLisp program1    -- progInHaskellTypes
s1 = Plus2 1 2

-- eval :: Arithms -> Integer
-- eval (Plus a b) = (+) a b

--------

main = do
  putStrLn "Hello"
  putStrLn "World"
  -- print $ eval s1 == 3
