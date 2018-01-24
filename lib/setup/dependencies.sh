subroutines="$ROUTINES/$ROUTINE"

for subroutine in brew
  do
    source "$subroutines/$subroutine.sh"
done

unset subroutine subroutines
