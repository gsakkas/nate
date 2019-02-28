
let rec clone x n = match n with | 0 -> [] | _ -> ((clone x n) - 1) :: x;;


(* fix

let helper (x,m) = x :: m;;

let rec clone x n = match n with | 0 -> [] | _ -> helper (x, (clone x n));;

*)

(* changed spans
(2,14)-(2,72)
fun (x , m) -> x :: m
LamG (ConAppG (Just (TupleG (fromList [VarG]))))

(2,50)-(2,72)
helper (x , clone x n)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* changed exprs
Lam (Just (2,12)-(2,25)) (TuplePat (Just (2,12)-(2,15)) [VarPat (Just (2,12)-(2,13)) "x",VarPat (Just (2,14)-(2,15)) "m"]) (ConApp (Just (2,19)-(2,25)) "::" (Just (Tuple (Just (2,19)-(2,25)) [Var (Just (2,19)-(2,20)) "x",Var (Just (2,24)-(2,25)) "m"])) Nothing) Nothing
App (Just (4,50)-(4,73)) (Var (Just (4,50)-(4,56)) "helper") [Tuple (Just (4,57)-(4,73)) [Var (Just (4,58)-(4,59)) "x",App (Just (4,61)-(4,72)) (Var (Just (4,62)-(4,67)) "clone") [Var (Just (4,68)-(4,69)) "x",Var (Just (4,70)-(4,71)) "n"]]]
*)

(* typed spans
(2,12)-(2,25)
(4,50)-(4,73)
*)

(* correct types
('a * 'a list) -> 'a list
'a list
*)

(* bad types
int list -> int -> int list
int list
*)
