-- .bnf в гитхабе не подсвениваеться. -- .ebnf (* вот так там комментарий *) 

-- Примеры от куда можно подсмотреть готовые BNF для некоторых lisp'ов:
-- https://iamwilhelm.github.io/bnf-examples/lisp -- https://github.com/arrdem/sad/blob/master/test/lisp.bnf

-- Инетерсное:
-- https://www.gnu.org/software/emacs/manual/html_node/elisp/SMIE-Grammar.html
-- https://github.com/chiant1/bnf/blob/master/bnf.lisp

-------------------------------------------------------------------
-- Некое сравнение BNF и Regex :
a = b   | b a		-- это значит b повторяеться от 1 до inf (аналог + в regex)
a = b a | b		-- Это тоже самое? Тут не уйдёт в безконеночть? Имеет ли в BNF порядок рекурсивных выражений?

a = a a | b		-- А вот так можно вообще в BNF?

a = b | c		-- (аналог | в regex)

a = b c e | c e		-- это значит b повторяеться 0 или 1 (аналог ? в regex, только для b)
-------------------------------------------------------------------

-- I version (not working, i guess) :
s_expr = "(" s_expr_body ")" | "(" ")"
s_expr_body   = may_evals | all s_expr_body			-- s_expr должен начинаться только с тех, которые могут быть eval! Не с number! -- Тут ошибка! выражение может оканчиваться только may_evals! Что исключает выражение "(plus 2 2)", где в конце number!
all           = may_evals | may_not_evals
may_not_evals = number | may_evals
may_evals     = space  | name | s_expr				-- А то что между именами должен быть пробел тут предусмотрено? Или он сразу может после пергово же символа начать типа распозновать следующий name ?

-- II version (Вроде норм) :
s_expr      = "(" s_expr_body ")"   | "(" ")"
s_expr_body = may_evals s_expr_body | may_evals | number   -- но плохо ли это что и так у нас number (и прочее) это список? А space не список? Или его тоже лучше сделать списком?
may_evals   = space | name | s_expr

-- Основа для I и II:
name = letter | letter name
-- name = letter | letter name | named_ops -- ???
letter = "a" | "b" | .. | "z"

number = digit | digit number
digit = "0" | "1" | .. | "9"  -- или иногда это называют number

spaces = space | space spaces
space = " "

ops       = "+"    | "-"
named_ops = "plus" | "minus" -- или keywords
-- 
-------------------------------------------------------------------

-- examples:
"()"
"(   )"
"(plus 1 2)"
"(plus 42 (plus 1 2))"

