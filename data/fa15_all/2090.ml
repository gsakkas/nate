
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let rec clone x n = sepConcat ";" ((clone x n) - 1);;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,18)-(7,58)
fun x ->
  fun n ->
    if n = 0
    then []
    else x :: (clone x (n - 1))
LamG (LamG EmptyG)

*)

(* changed exprs
Lam (Just (2,14)-(2,64)) (VarPat (Just (2,14)-(2,15)) "x") (Lam (Just (2,16)-(2,64)) (VarPat (Just (2,16)-(2,17)) "n") (Ite (Just (2,20)-(2,64)) (Bop (Just (2,23)-(2,28)) Eq (Var (Just (2,23)-(2,24)) "n") (Lit (Just (2,27)-(2,28)) (LI 0))) (List (Just (2,34)-(2,36)) [] Nothing) (ConApp (Just (2,42)-(2,64)) "::" (Just (Tuple (Just (2,42)-(2,64)) [Var (Just (2,42)-(2,43)) "x",App (Just (2,47)-(2,64)) (Var (Just (2,48)-(2,53)) "clone") [Var (Just (2,54)-(2,55)) "x",Bop (Just (2,56)-(2,63)) Minus (Var (Just (2,57)-(2,58)) "n") (Lit (Just (2,61)-(2,62)) (LI 1))]])) Nothing)) Nothing) Nothing
*)

(* typed spans
(2,14)-(2,64)
*)

(* correct types
'a -> int -> 'a list
*)

(* bad types
string -> string list -> string
*)
