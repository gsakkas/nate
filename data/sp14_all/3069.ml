
let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec digitsOfInt n =
  if n = 0
  then [0]
  else
    (fun help  ->
       fun n  -> match n with | 0 -> [] | _ -> cat (help (n / 10)) (n mod 10));;


(* fix

let rec cat x y = match x with | [] -> [y] | h::t -> h :: (cat t y);;

let rec help n = match n with | 0 -> [] | _ -> cat (help (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else help n;;

*)

(* changed spans
(5,2)-(9,78)
match n with
| 0 -> []
| _ -> cat (help (n / 10))
           (n mod 10)
CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,ListG EmptyG)])

(5,2)-(9,78)
fun n ->
  if n = 0 then [0] else help n
LamG (IteG EmptyG EmptyG EmptyG)

*)

(* changed exprs
Case (Just (4,17)-(4,77)) (Var (Just (4,23)-(4,24)) "n") [(LitPat (Just (4,32)-(4,33)) (LI 0),Nothing,List (Just (4,37)-(4,39)) [] Nothing),(WildPat (Just (4,42)-(4,43)),Nothing,App (Just (4,47)-(4,77)) (Var (Just (4,47)-(4,50)) "cat") [App (Just (4,51)-(4,66)) (Var (Just (4,52)-(4,56)) "help") [Bop (Just (4,57)-(4,65)) Div (Var (Just (4,58)-(4,59)) "n") (Lit (Just (4,62)-(4,64)) (LI 10))],Bop (Just (4,67)-(4,77)) Mod (Var (Just (4,68)-(4,69)) "n") (Lit (Just (4,74)-(4,76)) (LI 10))])]
Lam (Just (6,20)-(6,53)) (VarPat (Just (6,20)-(6,21)) "n") (Ite (Just (6,24)-(6,53)) (Bop (Just (6,27)-(6,32)) Eq (Var (Just (6,27)-(6,28)) "n") (Lit (Just (6,31)-(6,32)) (LI 0))) (List (Just (6,38)-(6,41)) [Lit (Just (6,39)-(6,40)) (LI 0)] Nothing) (App (Just (6,47)-(6,53)) (Var (Just (6,47)-(6,51)) "help") [Var (Just (6,52)-(6,53)) "n"])) Nothing
*)

(* typed spans
(4,17)-(4,77)
(6,20)-(6,53)
*)

(* correct types
int list
int -> int list
*)

(* bad types
(int -> int list) -> int -> int list
(int -> int list) -> int -> int list
*)
