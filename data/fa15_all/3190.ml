
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (List.length a1) = 0
      then ((((x1 + x2) / 10) :: 0), ((x1 + x2) mod 10))
      else
        (let c::c' = a1 in
         ((a1 @ [((x1 + x2) + c) / 10]), (a2 @ (((x1 + x2) + c) mod 10)))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (List.length a1) = 0
      then ([(x1 + x2) / 10; 0], [(x1 + x2) mod 10])
      else
        (let c::c' = a1 in
         ((a1 @ [((x1 + x2) + c) / 10]), (a2 @ [((x1 + x2) + c) mod 10]))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,12)-(28,35)
[(x1 + x2) / 10 ; 0]
ListG LitG

(28,37)-(28,55)
[(x1 + x2) mod 10]
ListG (BopG EmptyG EmptyG)

(31,47)-(31,71)
[((x1 + x2) + c) mod 10]
ListG (BopG EmptyG EmptyG)

*)

(* changed exprs
List (Just (28,12)-(28,31)) [Bop (Just (28,13)-(28,27)) Div (Bop (Just (28,13)-(28,22)) Plus (Var (Just (28,14)-(28,16)) "x1") (Var (Just (28,19)-(28,21)) "x2")) (Lit (Just (28,25)-(28,27)) (LI 10)),Lit (Just (28,29)-(28,30)) (LI 0)] Nothing
List (Just (28,33)-(28,51)) [Bop (Just (28,34)-(28,50)) Mod (Bop (Just (28,34)-(28,43)) Plus (Var (Just (28,35)-(28,37)) "x1") (Var (Just (28,40)-(28,42)) "x2")) (Lit (Just (28,48)-(28,50)) (LI 10))] Nothing
List (Just (31,47)-(31,71)) [Bop (Just (31,48)-(31,70)) Mod (Bop (Just (31,48)-(31,63)) Plus (Bop (Just (31,49)-(31,58)) Plus (Var (Just (31,50)-(31,52)) "x1") (Var (Just (31,55)-(31,57)) "x2")) (Var (Just (31,61)-(31,62)) "c")) (Lit (Just (31,68)-(31,70)) (LI 10))] Nothing
*)

(* typed spans
(28,12)-(28,31)
(28,33)-(28,51)
(31,47)-(31,71)
*)

(* correct types
int list
int list
int list
*)

(* bad types
int list
int
int
*)
