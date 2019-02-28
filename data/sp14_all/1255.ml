
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper acc n lis =
    match n with | 1 -> lis + acc | _ -> helper (n - 1) (bigAdd l lis) in
  helper [] i l;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let dl = (List.length l1) - (List.length l2) in
  match dl with
  | 0 -> (l1, l2)
  | _ ->
      if dl > 0
      then (l1, ((clone 0 dl) @ l2))
      else (((clone 0 (dl / (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let z = (fst x) + (snd x) in
      match a with | (w,y) -> (((w + z) / 10), (((w + z) mod 10) :: y)) in
    let base = (0, []) in
    let args = (List.rev (List.combine l1 l2)) @ [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let rec helper i l acc =
    match i with | 0 -> [0] | 1 -> l | _ -> helper (i - 1) l (bigAdd acc l) in
  helper i l [0];;

*)

(* changed spans
(27,17)-(28,70)
fun i ->
  fun l ->
    fun acc ->
      match i with
      | 0 -> [0]
      | 1 -> l
      | _ -> helper (i - 1) l
                    (bigAdd acc l)
LamG (LamG EmptyG)

(29,14)-(29,15)
[0]
ListG LitG

*)

(* changed exprs
Lam (Just (27,17)-(28,75)) (VarPat (Just (27,17)-(27,18)) "i") (Lam (Just (27,19)-(28,75)) (VarPat (Just (27,19)-(27,20)) "l") (Lam (Just (27,21)-(28,75)) (VarPat (Just (27,21)-(27,24)) "acc") (Case (Just (28,4)-(28,75)) (Var (Just (28,10)-(28,11)) "i") [(LitPat (Just (28,19)-(28,20)) (LI 0),Nothing,List (Just (28,24)-(28,27)) [Lit (Just (28,25)-(28,26)) (LI 0)] Nothing),(LitPat (Just (28,30)-(28,31)) (LI 1),Nothing,Var (Just (28,35)-(28,36)) "l"),(WildPat (Just (28,39)-(28,40)),Nothing,App (Just (28,44)-(28,75)) (Var (Just (28,44)-(28,50)) "helper") [Bop (Just (28,51)-(28,58)) Minus (Var (Just (28,52)-(28,53)) "i") (Lit (Just (28,56)-(28,57)) (LI 1)),Var (Just (28,59)-(28,60)) "l",App (Just (28,61)-(28,75)) (Var (Just (28,62)-(28,68)) "bigAdd") [Var (Just (28,69)-(28,72)) "acc",Var (Just (28,73)-(28,74)) "l"]])]) Nothing) Nothing) Nothing
List (Just (29,13)-(29,16)) [Lit (Just (29,14)-(29,15)) (LI 0)] Nothing
*)

(* typed spans
(27,17)-(28,75)
(29,13)-(29,16)
*)

(* correct types
int -> int list -> int list -> int list
int list
*)

(* bad types
int -> int -> int -> int
int list
*)
