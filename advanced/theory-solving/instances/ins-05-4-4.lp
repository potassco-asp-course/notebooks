job(1..4). machine(1..4).
duration(1,1,6).
duration(1,2,5).
duration(1,3,7).
duration(1,4,3).
duration(2,1,9).
duration(2,2,5).
duration(2,3,5).
duration(2,4,9).
duration(3,1,5).
duration(3,2,1).
duration(3,3,5).
duration(3,4,5).
duration(4,1,4).
duration(4,2,3).
duration(4,3,1).
duration(4,4,1).
sequence(1,1,3).
sequence(1,2,4).
sequence(1,3,1).
sequence(1,4,2).
sequence(2,1,4).
sequence(2,2,2).
sequence(2,3,3).
sequence(2,4,1).
sequence(3,1,4).
sequence(3,2,3).
sequence(3,3,2).
sequence(3,4,1).
sequence(4,1,1).
sequence(4,2,4).
sequence(4,3,3).
sequence(4,4,2).






%Answer: 1
%permutation(2,3) permutation(3,1) permutation(1,4) dl((1,1),14) dl(bound,37) dl((1,2),20) dl((1,3),25) dl((1,4),33) dl((2,1),0) dl((2,2),9) dl((2,3),14) dl((2,4),19) dl((3,1),9) dl((3,2),14) dl((3,3),19) dl((3,4),28) dl((4,1),20) dl((4,2),25) dl((4,3),32) dl((4,4),36)
%Answer: 2
%permutation(2,1) permutation(3,2) permutation(1,4) dl((1,1),14) dl(bound,37) dl((1,2),20) dl((1,3),25) dl((1,4),33) dl((2,1),5) dl((2,2),14) dl((2,3),19) dl((2,4),24) dl((3,1),0) dl((3,2),5) dl((3,3),6) dl((3,4),11) dl((4,1),20) dl((4,2),25) dl((4,3),32) dl((4,4),36)
