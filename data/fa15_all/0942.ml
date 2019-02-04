
let pipe fs =
  let f a x = x a in
  let base = match fs with | (h::t,z) -> z in List.fold_left f base fs;;


(* fix

let pipe fs z = let f a x = x a in let base = z in List.fold_left f base fs;;

*)

(* changed spans
(3,2)-(4,70)
fun z ->
  (let f =
     fun a -> fun x -> x a in
   let base = z in
   List.fold_left f base fs)
LamG (LetG NonRec (fromList [EmptyG]) EmptyG)

(4,13)-(4,42)
EMPTY
EmptyG

(4,19)-(4,21)
EMPTY
EmptyG

*)
