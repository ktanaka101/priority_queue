require "./spec_helper"

describe PriorityQueue do
  describe "#pop" do
    it "returns the value of max priority" do
      q = PriorityQueue(Int32).build
      q << 1
      q.pop.should eq 1

      q = PriorityQueue(Int32).build
      q << 1
      q << 2
      q.pop.should eq 2

      q = PriorityQueue(Int32).build
      q << 2
      q << 1
      q.pop.should eq 2

      q = PriorityQueue(Int32).build
      q << 2
      q.pop.should eq 2
      q << 1
      q.pop.should eq 1

      q = PriorityQueue(Int32).build
      q << 3
      q << 1
      q << 2
      q << 5
      q << 4
      q.pop.should eq 5
      q.pop.should eq 4
      q.pop.should eq 3
      q.pop.should eq 2
      q.pop.should eq 1

      q = PriorityQueue(Int32).build
      q << 97
      q << 97
      q << 85
      q << 85
      q << 84
      q.pop.should eq 97
      q.pop.should eq 97
      q.pop.should eq 85
      q.pop.should eq 85
      q.pop.should eq 84

      q = PriorityQueue(Int32).build
      q << 84
      q << 85
      q << 85
      q << 97
      q << 97
      q.pop.should eq 97
      q.pop.should eq 97
      q.pop.should eq 85
      q.pop.should eq 85
      q.pop.should eq 84
    end

    it "raises `IndexError` if array is of 0 size" do
      q = PriorityQueue(Int32).build
      expect_raises(IndexError) { q.pop }

      q = PriorityQueue(Int32).build
      q << 1
      q.pop?
      expect_raises(IndexError) { q.pop }
    end
  end

  describe "#pop?" do
    it "returns the value of max priority" do
      q = PriorityQueue(Int32).build
      q << 3
      q << 1
      q << 2
      q << 5
      q << 4
      q.pop.should eq 5
      q.pop.should eq 4
      q.pop.should eq 3
      q.pop.should eq 2
      q.pop.should eq 1
    end

    it "returns nil if array is of 0 size" do
      q = PriorityQueue(Int32).build
      q.pop?.should be_nil

      q = PriorityQueue(Int32).build
      q << 1
      q.pop?
      q.pop?.should be_nil
    end
  end

  [
    [8, 3, 6, 9, 3, 4, 5, 2, 0, 4],
    [3, 2, 1, 2, 0, 4, 2, 1, 0, 3, 2, 1, 2, 1, 4, 3, 0, 2, 0, 0, 4, 1, 0, 2, 0, 2, 4, 3, 2, 4, 2, 4, 3, 0, 2, 1, 4, 0, 1, 3, 0, 2, 2, 0, 1, 1, 3, 0, 0, 0, 1, 4, 2, 3, 1, 3, 0, 3, 3, 3, 1, 2, 2, 2, 0, 0, 4, 1, 2, 2, 0, 3, 1, 4, 3, 2, 0, 4, 0, 0, 3, 2, 0, 4, 1, 4, 1, 4, 4, 1, 4, 1, 1, 3, 0, 1, 0, 3, 4, 2],
    [904, 311, 275, 175, 834, 112, 958, 364, 536, 953, 327, 413, 292, 66, 630, 403, 345, 202, 41, 664, 359, 569, 613, 779, 270, 784, 571, 623, 296, 41, 424, 700, 397, 988, 969, 522, 698, 652, 318, 108, 391, 348, 436, 133, 333, 465, 517, 266, 475, 39, 147, 139, 249, 594, 675, 929, 59, 199, 364, 774, 946, 963, 254, 329, 380, 596, 482, 200, 732, 472, 557, 755, 875, 231, 873, 262, 363, 740, 397, 31, 256, 926, 982, 243, 996, 756, 60, 70, 961, 611, 533, 606, 390, 708, 673, 277, 246, 907, 263, 529, 126, 435, 128, 643, 881, 995, 730, 805, 528, 194, 157, 429, 859, 77, 878, 768, 785, 106, 624, 652, 281, 909, 85, 55, 539, 822, 276, 280, 747, 132, 147, 183, 978, 420, 940, 700, 797, 945, 371, 770, 239, 68, 751, 676, 241, 639, 839, 437, 286, 537, 432, 45, 516, 667, 386, 397, 689, 222, 493, 284, 863, 657, 925, 904, 891, 147, 68, 222, 249, 482, 452, 639, 125, 927, 207, 685, 74, 405, 795, 287, 471, 154, 976, 336, 326, 352, 218, 402, 8, 275, 995, 507, 106, 993, 68, 340, 178, 850, 457, 852, 423, 367, 839, 654, 215, 890, 278, 784, 64, 874, 786, 723, 413, 717, 560, 216, 432, 74, 363, 956, 494, 419, 105, 677, 704, 475, 785, 683, 793, 75, 63, 134, 13, 783, 86, 894, 746, 478, 398, 75, 900, 716, 263, 793, 807, 17, 994, 95, 873, 409, 556, 26, 459, 870, 3, 656, 530, 67, 655, 906, 918, 920, 878, 382, 393, 822, 277, 903, 263, 952, 547, 390, 451, 925, 520, 987, 253, 592, 638, 930, 320, 569, 938, 141, 218, 293, 802, 609, 537, 84, 647, 952, 126, 272, 396, 482, 900, 588, 315, 778, 978, 679, 187, 770, 242, 350, 696, 679, 41, 181, 926, 423, 803, 253, 946, 673, 791, 627, 701, 959, 783, 55, 651, 173, 33, 373, 190, 839, 543, 75, 963, 732, 342, 730, 828, 464, 995, 173, 264, 110, 551, 452, 330, 174, 485, 307, 340, 585, 167, 173, 376, 310, 432, 11, 45, 648, 172, 888, 839, 599, 665, 822, 345, 469, 825, 155, 662, 741, 860, 880, 917, 474, 81, 636, 585, 829, 180, 120, 516, 751, 484, 160, 364, 172, 666, 625, 453, 592, 438, 286, 864, 126, 171, 974, 884, 228, 376, 770, 896, 212, 531, 289, 270, 68, 58, 426, 850, 578, 83, 289, 162, 784, 214, 894, 70, 180, 6, 894, 957, 713, 603, 411, 695, 959, 301, 92, 268, 818, 885, 631, 516, 773, 347, 913, 342, 448, 475, 142, 16, 602, 237, 871, 814, 763, 648, 797, 288, 764, 76, 983, 528, 432, 617, 353, 892, 603, 236, 685, 773, 217, 659, 179, 22, 234, 829, 718, 249, 920, 206, 922, 436, 795, 851, 468, 969, 904, 625, 418, 449, 910, 13, 75, 45, 909, 97, 851, 21, 738, 296, 628, 881, 267, 679, 725, 23, 768, 374, 756, 651, 702],
  ].each do |arr|
    it "Random(#{arr})" do
      q = PriorityQueue(Int32).build
      arr.each { |a| q << a }

      arr.sort_by { |a| -a }.each do |a|
        q.pop.should eq a
      end
    end
  end

  # it "rand" do
  #   q = PriorityQueue(Int32).build
  #   n = 500
  #   try_n = 1

  #   try_n.times do
  #     a = [] of Int32
  #     n.times do
  #       a << rand(1000)
  #     end

  #     p a
  #     a.each { |_a| q << _a }
  #     a.sort_by! { |_a| -_a }

  #     a.each do |_a|
  #       print "#{_a} : "
  #       q.pop.should eq _a
  #     end
  #   end
  # end
end
