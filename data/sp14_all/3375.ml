
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

let x a = a;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [helper [] (h * i)]
       with
       | [] -> []
       | x::y ->
           let rec adder w =
             match w with | [] -> [] | a::b -> bigAdd a (adder b) in
           adder (x :: y));;


(* fix

let rec mulByDigit i l = match l with | [] -> [];;

*)

(* changed spans
(34,2)-(46,26)
match l with
| [] -> []
CaseG VarG (fromList [(Nothing,ListG EmptyG)])

*)

(* changed exprs
Case (Just (2,25)-(2,48)) (Var (Just (2,31)-(2,32)) "l") [(ConPat (Just (2,40)-(2,42)) "[]" Nothing,Nothing,List (Just (2,46)-(2,48)) [] Nothing)]
*)

(* typed spans
(2,25)-(2,48)
*)

(* correct types
'a list
*)

(* bad types
int list
*)
