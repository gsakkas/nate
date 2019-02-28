
let rec mulByDigit i l =
  let f x a =
    let digitRes = (x * i) + (fst a) in
    ((digitRes / 10), ((digitRes mod 10) :: (snd a))) in
  let base = (0, []) in
  let (_,result) = List.fold_right f ((0, 0) :: l) base in result;;


(* fix

let rec mulByDigit i l =
  let f x a =
    let digitRes = (x * i) + (fst a) in
    ((digitRes / 10), ((digitRes mod 10) :: (snd a))) in
  let base = (0, []) in
  let (_,result) = List.fold_right f (0 :: l) base in result;;

*)

(* changed spans
(7,38)-(7,44)
0
LitG

*)

(* changed exprs
Lit (Just (7,38)-(7,39)) (LI 0)
*)

(* typed spans
(7,38)-(7,39)
*)

(* correct types
int
*)

(* bad types
(int * int)
*)
