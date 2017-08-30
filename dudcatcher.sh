#!/usr/local/bin/bash
function HELP() {
  echo "Usage: $0 target apk" >&2
}
START_DIR=$(pwd);
declare -A keys=(
[aasb]="64c7c7f4f401d22b87897c564028727f75a512d66df3db6f31a01f2d5e691fcd"
[bfcu]="2c2ca4906653b2c4da89014f6d709b5de1720b43518f351eedee8a6c133e7dc7"
[cfcu]="d2703535eb6fc21484a83f87f67a7591bf2faf23d22d2392284b232524865807"
[chcu]="bcc50bfceeb812e1bca8bb5b326fd4f442a85676b34227416c4678e203eabb08"
[csb]="fb365397d4cf34038d248e60aed92851a06c0505d16cf91f3f717afd4cfd1fea"
[dfcu]="b63b75f02896be40e6c5f67e5707b85f6c90c8018deb9f04c99be4e53dd4f73d"
[fcb]="bf2b8f4fdb84b19354430d1b2c54dc501e927a9a0f34e7b7163b09a1f8b61beb"
[gwcu]="fd868525413bfb4480b1a25be4edfeaf97e519c510dacc688fafc39151bff878"
[larky]="51173ad5c0cb2318866bdbf2a4cb2fce30539d31dbd4139d69212b43167dab9a"
[mccu]="7061ea84f0c61d30b8db332671d1f19efb95e94975351a5dc85c8380ffd651ff"
[msfcu]="6ea490efc98e46260b9ecf9f29d4bcdf96d626eaa51a82ae455ead3d960105b4"
[offcu]="844ede1959df26cbc3eb3369b789942de755651fffb01913edc8cf95d1164c38"
[rcu]="2395926f7e9eeb03be5d481a828529c87110cd3cd79417843a11d1c93173b801"
[scu]="f46bb0ef51bef2b4b8a41e6761815c63d323d7244d55c8fd7aee211d9d73dffc"
[sccu]="97eff3ad343adffd9f7912c8bae142a78e57099d153d1e1eab783ac7d278af07"
[shcu]="ff5a8f6081d6873c65a3df995f84f664782d6cafeba81f0790e9a94154036040"
[tcu]="9fffedbd9513c86a2d160522ade52a1e40ee70ac54c9458fca3ca9dd83ceb3af"
[tsb]="c5fa3487168017794d1055caf99a78b7bdf7e70dda0b37fd5cd101f1cb018513"
[wfcu]="c76a383e4bd1232a1e218a452c04780e97cab3280ed9da2dc50bbc28d2a08843"
[wfcucu]="34ada2f665e285fa04d8a4dae7ade614c4dbd8e1d6fe9dd1b3819e2d4c3595a1"
[hfcu]="8700953dc7b7da315e58fd92003457eb6769de4b5fdd36a194fbf955757ea25c"
[nwcua]="562a61411a9f42c92d09fe45299ae7ea1924a684a7b1bd3a1ad42bab41768395"
[uccu]="d82cdc84188ed3414d66cc1447df70f7ebe5c0ea8c43ae8feb0335d8940c2515"
[mlive]="0afc0f73fe5adc2efe93ee2bb9b02945072fb1e4384360381d046cf162709a59"
[utf]="58e4efd80c52825ab3acce02051b9a48c943de34d7049e87351088cc4a79fc9c"
[cuo]="d4a27a8c3317b2dae375e192300c5a03c6e40f95dbe291888c32b98f571034c3"
[acu]="4ab04205b163af99f82a8d06b8212fbc61faf0885d346f26de3636d04f5b03c1"
[hap]="a783c56d2855a2ffa08a3c69292a64470b95483481e81cf3c25defa7619686d7"
[fcs]="1ad2fc7a8b5e1ef398e2a8d1898d8da7e16bfdeddf70b1dbe693ea2ef2d42a5b"
[facu]="4bc9ac3155d6fcf04b7e0f8035890d90bc6f7525b096f0efb914ebc448b0f53d"
[glfcu]="aea7c104a6fbaa19bedc35b35e5d6f6b520f3d7ce90cd7d9b93631e64926f1d9"
[cbcfcu]="f83cb2c7e8065ba756c4e6e9da698b8f47b6a7be745ed245cee4fa6162343890"
[slfcu]="1346157a827cf6cdcaad506c028f8d0cd20a229e1f021a240c9a8b818aae38e7"
[rrcu]="b5f157b2a9088859b35ef33be4176dff853d30431cbcaf9ea86b302d52593066"
[bhccu]="c2a5ff00d46fd890014d56b8a9783055a11f3392a635c0bbc29fd1e5f1280dc6"
[ntfcu]="fde785b651d5f385e25f7c67a20ae1d997cb0979a9dfba003ab1b15faf55c2a1"
)
if [[ "$#" -ne 2 ]]; then
  HELP;
  exit 1;
fi

if aapt l -a "$2" | grep -q ${keys[$1]}
then 
   echo "APPTENTIVE IS CORRECT FOR $1";
else
   echo "APPTENTIVE IS NOT CORRECT FOR $1";
fi

mkdir -p tmp;

# cp "$2" tmp/;
cd tmp;
unzip -q "$2";

RESOURCE_PATH=$LARKY_PATH/assets/targets/$1;

if cmp assets/www/images/larkylogo.png "$RESOURCE_PATH/www/images/larkylogo.png"
then
	echo "MAP LOGO HEADER IS THE CORRECT TARGET";
else
	echo "MAP LOGO HEADER IS NOT THE CORRECT TARGET";
fi
cd ../;
rm -rf tmp;

cd $START_DIR;
calabash-android run "$2" features/dudcatcher.feature;