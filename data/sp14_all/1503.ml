
let rec mulByDigit i l =
  let comb a b = match b with | [] -> [a] | hd::tl -> [a + hd] :: tl in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if (hd * i) > 9
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;


(* fix

let rec mulByDigit i l =
  let comb a b = match b with | [] -> [a] | hd::tl -> [a + hd] @ tl in
  let rec mBDhelper i x =
    match x with
    | [] -> []
    | hd::tl ->
        if (hd * i) > 9
        then ((hd * i) / 10) :: (comb ((hd * i) mod 10) (mBDhelper i tl))
        else (hd * i) :: (mBDhelper i tl) in
  mBDhelper i l;;

*)

(* changed spans
(3,54)-(3,68)
[a + hd] @ tl
AppG (fromList [VarG,ListG EmptyG])

*)

(* changed exprs
App (Just (3,54)-(3,67)) (Var (Just (3,63)-(3,64)) "@") [List (Just (3,54)-(3,62)) [Bop (Just (3,55)-(3,61)) Plus (Var (Just (3,55)-(3,56)) "a") (Var (Just (3,59)-(3,61)) "hd")] Nothing,Var (Just (3,65)-(3,67)) "tl"]
*)

(* typed spans
(3,54)-(3,67)
*)

(* correct types
int list
*)

(* bad types
int list list
*)
