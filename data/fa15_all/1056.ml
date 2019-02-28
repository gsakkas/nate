
let pipe fs = let f a x = x a in let base = f fs in List.fold_left f base fs;;


(* fix

let pipe fs n = let f a x = x a in let base = n in List.fold_left f base fs;;

*)

(* changed spans
(2,14)-(2,76)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(2,44)-(2,48)
n
VarG

*)

(* typed spans
(2,12)-(2,75)
(2,46)-(2,47)
*)

(* typed spans
'a -> 'a
'a
*)

(* typed spans
'a
('a -> 'a) -> 'a
*)
