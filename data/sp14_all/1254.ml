
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
  let rec adder n l' a =
    match n with
    | 0 -> [0]
    | 1 -> bigAdd l' a
    | _ -> adder (n - 1) l' (bigAdd a l') in
  adder i l [0];;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (w,y) -> (w, (bigAdd y (mulByDigit (x * (10 ** (List.length y))) l1))) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


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
  let rec adder n l' a =
    match n with
    | 0 -> [0]
    | 1 -> bigAdd l' a
    | _ -> adder (n - 1) l' (bigAdd a l') in
  adder i l [0];;

let rec mulByTen n =
  match n with | 0 -> 0 | 1 -> 10 | _ -> 10 * (mulByTen (n - 1));;

let bigMul l1 l2 =
  let f a x =
    match a with
    | (w,y) ->
        (w, (bigAdd y (mulByDigit (x * (mulByTen (List.length y))) l1))) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(34,11)-(39,75)
fun n ->
  match n with
  | 0 -> 0
  | 1 -> 10
  | _ -> 10 * mulByTen (n - 1)
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(37,46)-(37,69)
mulByTen (List.length y)
AppG (fromList [AppG (fromList [EmptyG])])

(37,46)-(37,69)
mulByTen
VarG

(37,54)-(37,65)
List.length y
AppG (fromList [VarG])

*)

(* changed exprs
Lam (Just (34,17)-(35,64)) (VarPat (Just (34,17)-(34,18)) "n") (Case (Just (35,2)-(35,64)) (Var (Just (35,8)-(35,9)) "n") [(LitPat (Just (35,17)-(35,18)) (LI 0),Nothing,Lit (Just (35,22)-(35,23)) (LI 0)),(LitPat (Just (35,26)-(35,27)) (LI 1),Nothing,Lit (Just (35,31)-(35,33)) (LI 10)),(WildPat (Just (35,36)-(35,37)),Nothing,Bop (Just (35,41)-(35,64)) Times (Lit (Just (35,41)-(35,43)) (LI 10)) (App (Just (35,46)-(35,64)) (Var (Just (35,47)-(35,55)) "mulByTen") [Bop (Just (35,56)-(35,63)) Minus (Var (Just (35,57)-(35,58)) "n") (Lit (Just (35,61)-(35,62)) (LI 1))]))]) Nothing
App (Just (41,39)-(41,65)) (Var (Just (41,40)-(41,48)) "mulByTen") [App (Just (41,49)-(41,64)) (Var (Just (41,50)-(41,61)) "List.length") [Var (Just (41,62)-(41,63)) "y"]]
Var (Just (41,40)-(41,48)) "mulByTen"
App (Just (41,49)-(41,64)) (Var (Just (41,50)-(41,61)) "List.length") [Var (Just (41,62)-(41,63)) "y"]
*)

(* typed spans
(34,17)-(35,64)
(41,39)-(41,65)
(41,40)-(41,48)
(41,49)-(41,64)
*)

(* correct types
int -> int
int
int -> int
int
*)

(* bad types
int list -> int list -> int list
int
int
int list -> int
*)
