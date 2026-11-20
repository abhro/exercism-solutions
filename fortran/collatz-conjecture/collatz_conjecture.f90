module collatz_conjecture
  implicit none
contains

  integer function steps(i)
    integer, intent(in) :: i
    integer :: j
    steps = -1
    j = i
    do while (j /= 1)
      if (mod(j, 2) == 0) then
        j = j / 2
      else
        j = 3 * j + 1
      end if
      steps = steps + 1
    end do
  end function

end module
