(display (list 1 (list 2 (list 3 4))))
; Outputs (1 (2 (3 4)))


; Box and pointer
;[ 1 | * ] ---> [ * | / ]
;                 |
;                 v
;               [ 2 | * ] ---> [ * | / ]
;                                |
;                                v
;                              [ 3 | * ] ---> [ 4 | / ]

;Tree version
;        (1 (2 (3 4)))
;         /       \
;        1      (2 (3 4))
;                /     \
;               2     (3 4)
;                     /   \
;                    3     4