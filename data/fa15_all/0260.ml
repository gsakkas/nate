
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let pipe fs =
  let f a x n = x (a n) in let base n = n in List.fold_left f base fs;;

let stringOfList f l = "[" ^ ((sepConcat "; " (List.map f l)) ^ "]");;

let rec clone x n = pipe stringOfList x n;;


(* fix

let rec cloneHelper x n = if x <= 0 then [] else cloneHelper x (n - 1);;

let rec clone x n = cloneHelper x n;;

*)

(* changed spans
(2,18)-(7,58)
fun x ->
  fun n ->
    if x <= 0
    then []
    else cloneHelper x (n - 1)
LamG (LamG EmptyG)

(14,20)-(14,41)
cloneHelper x n
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (2,20)-(2,70)) (VarPat (Just (2,20)-(2,21)) "x") (Lam (Just (2,22)-(2,70)) (VarPat (Just (2,22)-(2,23)) "n") (Ite (Just (2,26)-(2,70)) (Bop (Just (2,29)-(2,35)) Le (Var (Just (2,29)-(2,30)) "x") (Lit (Just (2,34)-(2,35)) (LI 0))) (List (Just (2,41)-(2,43)) [] Nothing) (App (Just (2,49)-(2,70)) (Var (Just (2,49)-(2,60)) "cloneHelper") [Var (Just (2,61)-(2,62)) "x",Bop (Just (2,63)-(2,70)) Minus (Var (Just (2,64)-(2,65)) "n") (Lit (Just (2,68)-(2,69)) (LI 1))])) Nothing) Nothing
App (Just (4,20)-(4,35)) (Var (Just (4,20)-(4,31)) "cloneHelper") [Var (Just (4,32)-(4,33)) "x",Var (Just (4,34)-(4,35)) "n"]
*)

(* typed spans
(2,20)-(2,70)
(4,20)-(4,35)
*)

(* correct types
int -> int -> 'a list
'a list
*)

(* bad types
string -> string list -> string
'a
*)
