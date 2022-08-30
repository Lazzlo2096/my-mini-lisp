import Data.Maybe
import Data.List

data LispVal = Atom String
           | List [LispVal]
           | String String
           | Number Integer
           -- deriving Show

instance Show LispVal where
  show = showVal

showVal :: LispVal -> String
showVal (String contents) = "\"" ++ contents ++ "\""
showVal (Atom name) = name
showVal (Number x) = show x
showVal (List xs) = "(" ++ (mconcat (intersperse " " (map showVal xs))) ++ ")"


-- data [a]      = (:)  a [a]        | []
-- data []     a = (:)  a ([] a)     | []
-- data MyList a = Cons a (MyList a) | Nil

--------
program3 = "(def x 42) (+ x 8)"
program2 = "(+ (+ 2 3) 8)"

-- "(+ (+ 2 3) 8)"
s2 = List [ Atom "+", List [ Atom "+", Number 2, Number 3], Number 8 ]    

program1 = "(+ 1 2)"
s1 = List [Atom "+", Number 1, Number 2]

s12 = Number 2
--------

eval :: LispVal -> LispVal
eval val@(String _) = val
eval val@(Number _) = val
-- eval val@(Bool _) = val
-- eval (List [Atom "quote", val]) = val

eval (List (Atom func : args)) = apply func (map eval args)

apply :: String -> [LispVal] -> LispVal
apply func args  = fromJust (lookup func primitives) $ args

primitives = [
  ( "+", numericBinop (+) ),
  ( "-", numericBinop (-) )
  ]


-- "(+ 1 2 3)"
-- [Number 1, Number 2, Number 3]
numericBinop :: (Integer -> Integer -> Integer) -> [LispVal] -> LispVal
numericBinop op params = Number $ foldl1 op $ map unpackNum params

unpackNum :: LispVal -> Integer
unpackNum (Number n) = n
unpackNum (List [n]) = unpackNum n
-- unpackNum (String n) = 
-- unpackNum _ = 0

--------

main = do
  putStrLn "Hello World"

  print $ eval s2
  --print $ eval s1  == 3
