
let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let seen' = h :: seen in
        if (List.mem h List.rev t) = false
        then let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;


(* fix

let removeDuplicates l =
  let rec helper (seen,rest) =
    match rest with
    | [] -> seen
    | h::t ->
        let r = List.rev t in
        let seen' = h :: seen in let rest' = t in helper (seen', rest') in
  List.rev (helper ([], l));;

*)

(* changed spans
(7,8)-(9,76)
EMPTY
EmptyG

(7,20)-(7,21)
EMPTY
EmptyG

(7,20)-(7,29)
EMPTY
EmptyG

(7,25)-(7,29)
EMPTY
EmptyG

(8,8)-(9,76)
EMPTY
EmptyG

(8,11)-(8,34)
EMPTY
EmptyG

(8,11)-(8,42)
EMPTY
EmptyG

(8,12)-(8,20)
EMPTY
EmptyG

(8,21)-(8,22)
let r = List.rev t in
let seen' = h :: seen in
let rest' = t in
helper (seen' , rest')
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (LetG NonRec (fromList [EmptyG]) EmptyG)

(8,23)-(8,31)
List.rev t
AppG (fromList [VarG])

(8,37)-(8,42)
EMPTY
EmptyG

*)
