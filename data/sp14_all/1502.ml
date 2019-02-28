
let rec mulByDigit i l =
  let comb a b = match b with | [] -> a | hd::tl -> a + hd in
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
(3,38)-(3,39)
[a]
ListG VarG

(3,52)-(3,58)
[a + hd]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (3,38)-(3,41)) [Var (Just (3,39)-(3,40)) "a"] Nothing
List (Just (3,54)-(3,62)) [Bop (Just (3,55)-(3,61)) Plus (Var (Just (3,55)-(3,56)) "a") (Var (Just (3,59)-(3,61)) "hd")] Nothing
*)

(* typed spans
(3,38)-(3,41)
(3,54)-(3,62)
*)

(* correct types
int list
int list
*)

(* bad types
int
int
*)
