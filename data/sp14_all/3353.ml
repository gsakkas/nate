
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      let rec adder x = match x with | [] -> [] | h::t -> bigAdd h (adder t) in
      (match [adder
                ((mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
                   [helper [] (h * i)])]
       with
       | h::t -> h);;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match x with
      | (v1,v2) ->
          (match a with
           | (list1,list2) ->
               (match list1 with
                | [] ->
                    ((((v1 + v2) / 10) :: list1), (((v1 + v2) mod 10) ::
                      list2))
                | h::t ->
                    (((((v1 + v2) + h) / 10) :: list1),
                      ((((v1 + v2) + h) mod 10) :: list2)))) in
    let base = ([], []) in
    let args = List.append (List.rev (List.combine l1 l2)) [(0, 0)] in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      let rec adder x = match x with | [] -> [] | h::t -> bigAdd h (adder t) in
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
        ((helper [] (h * i)) @ []);;

*)

(* changed spans
(38,6)-(42,19)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ (helper []
                                                        (h * i) @ [])
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* changed exprs
App (Just (38,6)-(39,34)) (Var (Just (38,64)-(38,65)) "@") [App (Just (38,6)-(38,63)) (Var (Just (38,7)-(38,17)) "mulByDigit") [Var (Just (38,18)-(38,19)) "i",App (Just (38,20)-(38,62)) (Var (Just (38,21)-(38,29)) "List.rev") [App (Just (38,30)-(38,61)) (Var (Just (38,31)-(38,39)) "List.map") [Lam (Just (38,40)-(38,58)) (VarPat (Just (38,45)-(38,46)) "x") (Bop (Just (38,51)-(38,57)) Times (Var (Just (38,51)-(38,52)) "x") (Lit (Just (38,55)-(38,57)) (LI 10))) Nothing,Var (Just (38,59)-(38,60)) "t"]]],App (Just (39,8)-(39,34)) (Var (Just (39,29)-(39,30)) "@") [App (Just (39,9)-(39,28)) (Var (Just (39,10)-(39,16)) "helper") [List (Just (39,17)-(39,19)) [] Nothing,Bop (Just (39,20)-(39,27)) Times (Var (Just (39,21)-(39,22)) "h") (Var (Just (39,25)-(39,26)) "i")],List (Just (39,31)-(39,33)) [] Nothing]]
*)

(* typed spans
(38,6)-(39,34)
*)

(* correct types
int list
*)

(* bad types
int list
*)
