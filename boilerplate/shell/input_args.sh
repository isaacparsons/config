helpFunction()
{
   echo ""
   echo "usage: -d dump_path -c container_name"
   echo -e "\t-d path to db dumps folder"
   echo -e "\t-c name of container containing db"
   exit 1 
}

while getopts "d:c:" flag; do
  case "${flag}" in
    d) PARAM_D="${OPTARG}" ;;
    c) PARAM_C="${OPTARG}" ;;
    *) helpFunction;; 
  esac
done


if [ -z "$PARAM_D" ] || [ -z "$PARAM_C" ]
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

