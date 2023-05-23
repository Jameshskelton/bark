while getopts u:s:d:t:q:v:z flag
do
    case "${flag}" in
        u) url=${OPTARG};;
        s) space_name=${OPTARG};;
        d) docker_username=${OPTARG};;
        t) tag=${OPTARG};;
        q) template=${OPTARG};;
        v) vers=${OPTARG};;
    esac
done
# TESTS
# echo tag $url
# echo space name $space_name
# echo your docker username $docker_username
# echo tag for container $tag
# echo template for container $template
# echo version for container $vers
# export date=$(date +%m%B-%T)


git-lfs clone $url
# mkdir app
# mv $space_name/* ./app/
# rm -r -f $space_name
# cd $space_name

# option one: Dockerhub

# docker compose build --no-cache
# docker -t $docker_username/$name:$vers
# docker push $docker_username/$name:$vers
# pspace init ./ -t $template
# bash run_huggingface.sh -u https://huggingface.co/spaces/suno/bark -s bark -d jameshskelton -t eh -q jameshskelton/bark -z test6_version

# option two: GHCR

# git remote add origin git@github.com:$fullname/$space_name.git
git init
git add .
git commit -m 'init commit'
gh repo create $space_name --private --source=. --push
sleep 5
pspace init . -t $template
