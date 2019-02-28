
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let stringOfList f l = sepConcat ("", (List.map (f, l)));;


(* fix

let stringOfList f l = match l with | x::[] -> "[" ^ (x ^ "]");;

*)

(* changed spans
(2,18)-(7,58)
fun f ->
  fun l ->
    match l with
    | x :: [] -> "[" ^ (x ^ "]")
LamG (LamG EmptyG)

*)

(* changed exprs
Lam (Just (2,17)-(2,62)) (VarPat (Just (2,17)-(2,18)) "f") (Lam (Just (2,19)-(2,62)) (VarPat (Just (2,19)-(2,20)) "l") (Case (Just (2,23)-(2,62)) (Var (Just (2,29)-(2,30)) "l") [(ConsPat (Just (2,38)-(2,43)) (VarPat (Just (2,38)-(2,39)) "x") (ConPat (Just (2,41)-(2,43)) "[]" Nothing),Nothing,App (Just (2,47)-(2,62)) (Var (Just (2,51)-(2,52)) "^") [Lit (Just (2,47)-(2,50)) (LS "["),App (Just (2,53)-(2,62)) (Var (Just (2,56)-(2,57)) "^") [Var (Just (2,54)-(2,55)) "x",Lit (Just (2,58)-(2,61)) (LS "]")]])]) Nothing) Nothing
*)

(* typed spans
(2,17)-(2,62)
*)

(* correct types
'a -> string list -> string
*)

(* bad types
string -> string list -> string
*)
