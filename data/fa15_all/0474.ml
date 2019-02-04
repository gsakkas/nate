
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile ((f b), x) | (x,y) -> x;;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

*)

(* changed spans
(4,50)-(4,55)
EMPTY
EmptyG

(4,53)-(4,54)
EMPTY
EmptyG

*)
