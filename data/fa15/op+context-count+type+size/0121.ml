
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x =
    let isFPoint s = ((f s) - s) < 0 in
    let iterate (t,y) = t y in
    let rec go r =
      if isFPoint r then (r, true) else go ((iterate (x, r)), false) in
    go x in
  wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint s = ((f s) - s) < 0 in ((f x), (isFPoint x)) in
  wwhile (gs, b);;

*)

(* changed spans
(8,4)-(12,8)
(9,4)-(12,8)
(9,17)-(9,27)
(9,24)-(9,25)
(9,24)-(9,27)
(9,26)-(9,27)
(10,4)-(12,8)
(10,15)-(11,68)
(11,6)-(11,68)
(11,9)-(11,17)
(11,9)-(11,19)
(11,18)-(11,19)
(11,26)-(11,27)
(11,29)-(11,33)
(12,4)-(12,8)
(13,2)-(13,16)
*)

(* type error slice
(8,4)-(12,8)
(8,17)-(8,36)
(8,21)-(8,32)
(8,30)-(8,31)
(9,4)-(12,8)
(9,17)-(9,27)
(9,24)-(9,25)
(9,24)-(9,27)
(10,4)-(12,8)
(10,15)-(11,68)
(11,9)-(11,17)
(11,9)-(11,19)
(11,18)-(11,19)
(11,40)-(11,42)
(11,40)-(11,68)
(11,43)-(11,68)
(11,44)-(11,60)
(11,45)-(11,52)
(11,53)-(11,59)
(11,54)-(11,55)
(12,4)-(12,6)
(12,4)-(12,8)
(12,7)-(12,8)
*)
