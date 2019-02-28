
let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec digitalRoot n = if n < 10 then n else digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  let ns = [] in
  match n with
  | 0 -> ns
  | n -> if n < 0 then [] else (n mod 10) :: (digitsOfInt (n / 10));;

let rec sumList xs =
  match xs with | [] -> 0 | xs -> (List.hd xs) + (sumList (List.tl xs));;

let rec digitalRoot n = sumList (digitsOfInt n);;

*)

(* changed spans
(8,20)-(8,59)
fun xs ->
  match xs with
  | [] -> 0
  | xs -> List.hd xs + sumList (List.tl xs)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(8,24)-(8,59)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

(8,24)-(8,59)
sumList
VarG

(8,46)-(8,57)
digitsOfInt n
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (8,16)-(9,71)) (VarPat (Just (8,16)-(8,18)) "xs") (Case (Just (9,2)-(9,71)) (Var (Just (9,8)-(9,10)) "xs") [(ConPat (Just (9,18)-(9,20)) "[]" Nothing,Nothing,Lit (Just (9,24)-(9,25)) (LI 0)),(VarPat (Just (9,28)-(9,30)) "xs",Nothing,Bop (Just (9,34)-(9,71)) Plus (App (Just (9,34)-(9,46)) (Var (Just (9,35)-(9,42)) "List.hd") [Var (Just (9,43)-(9,45)) "xs"]) (App (Just (9,49)-(9,71)) (Var (Just (9,50)-(9,57)) "sumList") [App (Just (9,58)-(9,70)) (Var (Just (9,59)-(9,66)) "List.tl") [Var (Just (9,67)-(9,69)) "xs"]]))]) Nothing
App (Just (11,24)-(11,47)) (Var (Just (11,24)-(11,31)) "sumList") [App (Just (11,32)-(11,47)) (Var (Just (11,33)-(11,44)) "digitsOfInt") [Var (Just (11,45)-(11,46)) "n"]]
Var (Just (11,24)-(11,31)) "sumList"
App (Just (11,32)-(11,47)) (Var (Just (11,33)-(11,44)) "digitsOfInt") [Var (Just (11,45)-(11,46)) "n"]
*)

(* typed spans
(8,16)-(9,71)
(11,24)-(11,47)
(11,24)-(11,31)
(11,32)-(11,47)
*)

(* correct types
int list -> int
int
int list -> int
int list
*)

(* bad types
int -> int list
int list
int list
int -> int list
*)
