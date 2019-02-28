
let rec clone x n =
  let helper = match n with | 0 -> [] | _ -> x :: ((clone x n) - 1) in
  helper n;;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(3,2)-(4,10)
match n with
| 0 -> []
| _ -> x :: (clone x (n - 1))
CaseG VarG (fromList [(Nothing,ConAppG (Just EmptyG)),(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (2,20)-(2,72)) (Var (Just (2,26)-(2,27)) "n") [(LitPat (Just (2,35)-(2,36)) (LI 0),Nothing,List (Just (2,40)-(2,42)) [] Nothing),(WildPat (Just (2,45)-(2,46)),Nothing,ConApp (Just (2,50)-(2,72)) "::" (Just (Tuple (Just (2,50)-(2,72)) [Var (Just (2,50)-(2,51)) "x",App (Just (2,55)-(2,72)) (Var (Just (2,56)-(2,61)) "clone") [Var (Just (2,62)-(2,63)) "x",Bop (Just (2,64)-(2,71)) Minus (Var (Just (2,65)-(2,66)) "n") (Lit (Just (2,69)-(2,70)) (LI 1))]])) Nothing)]
*)

(* typed spans
(2,20)-(2,72)
*)

(* correct types
'a list
*)

(* bad types
int
*)
