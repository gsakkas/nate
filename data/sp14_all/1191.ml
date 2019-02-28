
let digitsOfInt n =
  let rec loop n tlist =
    if n = 0 then tlist else loop (n / 10) ((n mod 10) :: tlist) in
  match n with | 0 -> [0] | _ -> loop n [];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  let rec aPHelper n i =
    if n < 10 then i else aPHelper sumList (digits n) (i + 1) in
  n;;


(* fix

let digitsOfInt n =
  let rec loop n tlist =
    if n = 0 then tlist else loop (n / 10) ((n mod 10) :: tlist) in
  match n with | 0 -> [0] | _ -> loop n [];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  let rec aPHelper n i =
    if n < 10 then i else aPHelper (sumList (digits n)) (i + 1) in
  n;;

*)

(* changed spans
(13,26)-(13,61)
aPHelper (sumList (digits n))
         (i + 1)
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* changed exprs
App (Just (13,26)-(13,63)) (Var (Just (13,26)-(13,34)) "aPHelper") [App (Just (13,35)-(13,55)) (Var (Just (13,36)-(13,43)) "sumList") [App (Just (13,44)-(13,54)) (Var (Just (13,45)-(13,51)) "digits") [Var (Just (13,52)-(13,53)) "n"]],Bop (Just (13,56)-(13,63)) Plus (Var (Just (13,57)-(13,58)) "i") (Lit (Just (13,61)-(13,62)) (LI 1))]
*)

(* typed spans
(13,26)-(13,63)
*)

(* correct types
int
*)

(* bad types
int
*)
