job(1..4). machine(1..4).
duration(1,1,4).
duration(1,2,2).
duration(1,3,2).
duration(1,4,1).
duration(2,1,2).
duration(2,2,2).
duration(2,3,9).
duration(2,4,2).
duration(3,1,5).
duration(3,2,5).
duration(3,3,4).
duration(3,4,4).
duration(4,1,7).
duration(4,2,1).
duration(4,3,2).
duration(4,4,5).
sequence(1,1,3).
sequence(1,2,2).
sequence(1,3,1).
sequence(1,4,4).
sequence(2,1,2).
sequence(2,2,1).
sequence(2,3,3).
sequence(2,4,4).
sequence(3,1,1).
sequence(3,2,2).
sequence(3,3,4).
sequence(3,4,3).
sequence(4,1,2).
sequence(4,2,1).
sequence(4,3,4).
sequence(4,4,3).






%Answer: 1
%permutation(2,3) permutation(3,4) permutation(4,1) dl((1,1),14) dl(bound,27) dl((1,2),18) dl((1,3),20) dl((1,4),26) dl((2,1),0) dl((2,2),2) dl((2,3),4) dl((2,4),13) dl((3,1),2) dl((3,2),7) dl((3,3),13) dl((3,4),17) dl((4,1),7) dl((4,2),14) dl((4,3),17) dl((4,4),21)
%Answer: 2
%permutation(2,3) permutation(3,1) permutation(1,4) dl((1,1),7) dl(bound,27) dl((1,2),12) dl((1,3),17) dl((1,4),21) dl((2,1),0) dl((2,2),2) dl((2,3),4) dl((2,4),13) dl((3,1),2) dl((3,2),7) dl((3,3),13) dl((3,4),17) dl((4,1),11) dl((4,2),18) dl((4,3),19) dl((4,4),22)
