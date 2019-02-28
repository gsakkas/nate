
let rec clone x n =
  if n < 1
  then []
  else
    (let rec helper acc f x =
       match x with | 0 -> acc | _ -> (helper (f :: acc) f x) - 1 in
     helper [] x n);;


(* fix

let rec clone x n =
  if n < 1
  then []
  else
    (let rec helper acc f x =
       match x with | 0 -> acc | _ -> helper (f :: acc) f (x - 1) in
     helper [] x n);;

*)

(* changed spans
(7,38)-(7,65)
helper (f :: acc) f (x - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG,ConAppG (Just EmptyG)])

*)

(* changed exprs
App (Just (7,38)-(7,65)) (Var (Just (7,38)-(7,44)) "helper") [ConApp (Just (7,45)-(7,55)) "::" (Just (Tuple (Just (7,46)-(7,54)) [Var (Just (7,46)-(7,47)) "f",Var (Just (7,51)-(7,54)) "acc"])) Nothing,Var (Just (7,56)-(7,57)) "f",Bop (Just (7,58)-(7,65)) Minus (Var (Just (7,59)-(7,60)) "x") (Lit (Just (7,63)-(7,64)) (LI 1))]
*)

(* typed spans
(7,38)-(7,65)
*)

(* correct types
'a list
*)

(* bad types
int
*)
