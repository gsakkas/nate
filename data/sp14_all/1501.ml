
let rec mulByDigit i l =
  let comb a (hd::tl) = a + hd in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) - 9) != 0
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;


(* fix

let rec mulByDigit i l =
  let comb a b = match b with | [] -> [a] | hd::tl -> [a + hd] in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if ((hd * i) - 9) != 0
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;

*)

(* changed spans
(3,14)-(3,30)
fun b ->
  match b with
  | [] -> [a]
  | hd :: tl -> [a + hd]
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

*)

(* changed exprs
Lam (Just (3,13)-(3,62)) (VarPat (Just (3,13)-(3,14)) "b") (Case (Just (3,17)-(3,62)) (Var (Just (3,23)-(3,24)) "b") [(ConPat (Just (3,32)-(3,34)) "[]" Nothing,Nothing,List (Just (3,38)-(3,41)) [Var (Just (3,39)-(3,40)) "a"] Nothing),(ConsPat (Just (3,44)-(3,50)) (VarPat (Just (3,44)-(3,46)) "hd") (VarPat (Just (3,48)-(3,50)) "tl"),Nothing,List (Just (3,54)-(3,62)) [Bop (Just (3,55)-(3,61)) Plus (Var (Just (3,55)-(3,56)) "a") (Var (Just (3,59)-(3,61)) "hd")] Nothing)]) Nothing
*)

(* typed spans
(3,13)-(3,62)
*)

(* correct types
int list -> int list
*)

(* bad types
int list -> int
*)
