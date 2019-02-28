
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let l1 = [9; 9; 9];;

let rec mulByDigit i l =
  let f a x =
    let (i,j) = x in
    let (s,t) = a in ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
  let base = (0, []) in
  let args =
    List.combine (List.rev (0 :: l1)) (clone i ((List.length + 1) l)) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let l1 = [9; 9; 9];;

let rec mulByDigit i l =
  let f a x =
    let (i,j) = x in
    let (s,t) = a in ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
  let base = (0, []) in
  let args =
    List.combine (List.rev (0 :: l1)) (clone i ((List.length l) + 1)) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(12,47)-(12,68)
List.length l + 1
BopG (AppG (fromList [EmptyG])) LitG

*)

(* changed exprs
Bop (Just (12,47)-(12,68)) Plus (App (Just (12,48)-(12,63)) (Var (Just (12,49)-(12,60)) "List.length") [Var (Just (12,61)-(12,62)) "l"]) (Lit (Just (12,66)-(12,67)) (LI 1))
*)

(* typed spans
(12,47)-(12,68)
*)

(* correct types
int
*)

(* bad types
int
*)
