
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = match h with | h::[] -> h in
      let l = t in List.fold_left f base l;;


(* fix

let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = match a with | "" -> x | _ -> a ^ (sep ^ x) in
      let base = "" in let l = sl in List.fold_left f base l;;

*)

(* changed spans
(6,18)-(6,31)
match a with
| "" -> x
| _ -> a ^ (sep ^ x)
CaseG VarG (fromList [(Nothing,VarG),(Nothing,AppG (fromList [EmptyG]))])

(7,17)-(7,42)
""
LitG

(8,14)-(8,15)
sl
VarG

*)

(* changed exprs
Case (Just (6,18)-(6,61)) (Var (Just (6,24)-(6,25)) "a") [(LitPat (Just (6,33)-(6,35)) (LS ""),Nothing,Var (Just (6,39)-(6,40)) "x"),(WildPat (Just (6,43)-(6,44)),Nothing,App (Just (6,48)-(6,61)) (Var (Just (6,50)-(6,51)) "^") [Var (Just (6,48)-(6,49)) "a",App (Just (6,52)-(6,61)) (Var (Just (6,57)-(6,58)) "^") [Var (Just (6,53)-(6,56)) "sep",Var (Just (6,59)-(6,60)) "x"]])]
Lit (Just (7,17)-(7,19)) (LS "")
Var (Just (7,31)-(7,33)) "sl"
*)

(* typed spans
(6,18)-(6,61)
(7,17)-(7,19)
(7,31)-(7,33)
*)

(* correct types
string
string
string list
*)

(* bad types
string
string
string list list
*)
