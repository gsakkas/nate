LetG Rec (fromList [LamG EmptyG]) (AppG (fromList [EmptyG]))
let rec helper =
  fun acc ->
    fun cin ->
      match l with
      | [] -> cin :: acc
      | h :: t -> (let sum =
                     (i * h) + cin in
                   helper ((sum mod 10) :: acc)
                          (sum / 10)) in
helper [] 0
let rec funt =
  fun x -> (b , f b = b) in
wwhile (funt , b)
let rec recurse =
  fun original ->
    fun reverse ->
      match original with
      | [] -> reverse
      | front :: back -> recurse back
                                 (front :: reverse) in
recurse l []
let rec helper =
  fun curList ->
    fun lt1 ->
      fun lt2 ->
        match lt1 with
        | [] -> curList
        | h :: t -> helper ((h , List.hd lt2) :: curList)
                           t (List.tl lt2) in
helper [] l1 l2
