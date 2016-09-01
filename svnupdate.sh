read -r -p "Download and pack latest LeeDroid SVN? [y/N] " response
case $response in
    [yY][eE][sS]|[yY]) 
svn update
zip -r Builds/LeeDroid_$(svn info | grep 'Revision: ' | cut -d\   -f2).zip boot.img extras kernel META-INF supersu system
echo $(md5sum Builds/LeeDroid_$(svn info | grep 'Revision: ' | cut -d\   -f2).zip) > Builds/Leedroid_$(svn info | grep 'Revision: ' | cut -d\   -f2).zip.md5
echo 'Updated to' $(svn info | grep 'Revision') 'and built zip in Builds/LeeDroid_'$(svn info | grep 'Revision: ' | cut -d\   -f2)'.zip'
        ;;
    *)
        exit
        ;;
esac
