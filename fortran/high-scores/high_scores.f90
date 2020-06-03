module high_scores
  implicit none
contains

function scores(score_list)
  integer, dimension(:), intent(in) :: score_list
  integer, dimension(size(score_list)) :: scores
  scores = score_list
end function scores

integer function latest(score_list)
  integer, dimension(:), intent(in) :: score_list
  latest = score_list(ubound(score_list, 1))
end function latest

integer function personalBest(score_list)
  integer, dimension(:), intent(in) :: score_list
  personalBest = maxval(score_list)
end function personalBest

function personalTopThree(score_list)
  integer, dimension(:), intent(in) :: score_list
  integer, dimension(3) :: personalTopThree

  ! I'm gonna do this in the stupidest way possible
  logical, dimension(size(score_list)) :: no_max_mask
  integer :: maxval_index

  personalTopThree = 0
  no_max_mask = .true.

  ! top score
  maxval_index = maxloc(score_list, 1)
  personalTopThree(1) = score_list(maxval_index)
  ! in further searches, don't search the maximum value
  no_max_mask(maxval_index) = .false.

  ! 2nd best score
  maxval_index = maxloc(score_list, 1, no_max_mask)
  personalTopThree(2) = score_list(maxval_index)
  no_max_mask(maxval_index) = .false.

  ! 3rd best score
  maxval_index = maxloc(score_list, 1, no_max_mask)
  personalTopThree(3) = score_list(maxval_index)
end function personalTopThree
end module
