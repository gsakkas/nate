
let rec sepConcat sep sl =
  match sl with
  | [] -> ""
  | h::t ->
      let f a x = a ^ (sep ^ x) in
      let base = h in let l = t in List.fold_left f base l;;

let rec clone x n = sepConcat ";" (clone ((x n) - 1));;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,18)-(7,58)
EMPTY
EmptyG

(6,18)-(6,31)
EMPTY
EmptyG

(9,20)-(9,29)
EMPTY
EmptyG

(9,20)-(9,53)
if n = 0
then []
else x :: (clone x (n - 1))
IteG (BopG EmptyG EmptyG) (ListG EmptyG) (ConAppG (Just EmptyG))

(9,41)-(9,52)
EMPTY
EmptyG

(9,45)-(9,46)
n - 1
BopG VarG LitG

*)

(* typed spans
(2,20)-(2,64)
(2,56)-(2,63)
*)

(* typed spans
'a list
int
*)

(* typed spans
string
'a
*)
