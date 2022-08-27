programm1 = "(+ 1 2)"

data Arithms = Plus Integer Integer

s1 = Plus 1 2

eval :: Arithms -> Integer
eval (Plus a b) = (+) a b

main = do
  putStrLn "Hello"
  putStrLn "World"
  putStrLn $ show $ (eval s1) == 3
