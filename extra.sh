#!/bin/bash
# Update: 2022-06-05
# Content: add  jd_insight.js(京洞察问卷通知) 

##############################  京  东  商  城  ##############################
## 列表格式： 脚本名称 | 活动名称 | 备注说明

#  jd_price.js                     京东价保
#  jd_cleancart.js                 清空购物车               (需要设置变量才会运行，详见下方)
#  jd_try.js                       京东试用                 (需要设置多个变量，详见下方)
#  jd_try_notify.py                京东试用待领取通知
#  jd_unsubscriLive.js             取关所有主播
#  jd_unsubscribe_xh.js            取关店铺和商品
#  jd_super_redrain.js             整点京豆雨
#  jd_half_redrain.js              半点京豆雨
#  jd_shop_sign.js                 店铺签到                 (内置店铺 Token，定期更新)
#  jd_productZ4Brand.js            特物Z
#  jd_sign_graphics.js             京东签到翻牌
#  jd_morningSc.js                 早起赢现金               (活动入口在京东汽车-瓜分万元，支付一元才能参与活动)
#  jd_moneyTree_heip.js            京东摇钱树助力
#  jd_dwapp.js                     积分换话费
#  jd_nnfls.js                     牛牛福利社
#  jd_gold_sign.js                 京东金榜签到
#  jd_beauty_ex.js                 美丽研究院兑换京豆
#  jd_jfcz.js                      见缝插针
#  jd_txjf.js                      通讯积分
#  jd_wish.js                      众筹许愿池
#  jd_wq_wxsign.js                 微信签到领红包
#  jd_wyw.js                       玩一玩成就
#  jd_fan.js                       粉丝互动
#  jd_mpdzcar.js                   京东汽车头文字J
#  jd_mpdzcar_game.js              京东汽车头文字J游戏
#  jd_mpdzcar_help.js              京东汽车头文字J助力
#  jd_ddly.js                      东东乐园
#  jd_speed_redpocke.js            京东极速版红包
#  jd_beauty.js                    美丽研究院修复版
#  jd_xgyl_wx.js                   小鸽有礼
#  jd_joy_park_task.js             汪汪乐园每日任务
#  jd_twCard.js                    特务Z集卡
#  jd_superBrandStar.js            特务Z明星送好礼
#  jd_joymanor_task.js             JOY庄园每日任
#  jd_618dfw.js                    大富翁金币
#  jd_tanwei.js                    探味奇遇记
#  jd_xm618.js                     逛小米618赢千万京豆
#  jd_jin_tie_xh.js                领金贴
#  jd_superBrandSign.js            特物Z签到
#  jd_insight.js                   京洞察问卷通知

##############################  脚  本  内  环  境  变  量  ##############################
## 推荐使用项目自带的环境变量管理命令，默认交互支持快捷命令
## 快速添加环境变量：task env add <变量名> <变量的值>

# "清空购物车"
#    export JD_CART=""               # 启用脚本
#    export XH_CLEAN_REMOVESIZE=""   # 空值一次取消多少条购物车数据，0为不删除，默认100
#    export XH_CLEAN_KEYWORDS=""     # 不从购物车清空的商品，填写过滤关键字/词，多个用@分隔
# "批量取关店铺和商品"
#    export JD_UNSUB_GKEYWORDS="" # 商品类过滤关键词，多个用@分隔
#    export JD_UNSUB_SKEYWORDS="" # 店铺类过滤关键词，多个用@分隔
# "早起赢现金"
#    export morningScPins=""  # 指定打卡账号，填 pt_pin 的值
# "京东试用"
#    export JD_TRY_UNIFIED=""            # 定义是否统一试用组，默认为false即每个账号都申请不同的商品，若想统一并加快脚本执行速度可设置为true
#    export JD_TRY_TOTALPAGES=""         # 定义每个Tab页要便遍历的申请页数，默认为20
#    export JD_TRY_PRICE=""              # 只申请试用高于此价格的商品
#    export JD_TRY_TABID=""              # 试用商品类型：1)精选 2)闪电试 3)家用电器 4)手机数码 5)电脑办公 默认为精选
#    export JD_TRY_TITLEFILTERS=""       # 试用商品标题关键词过滤，黑名单，多个关键词用@隔开
#    export JD_TRY_TRIALPRICE=""         # 试用价格，有些商品的试用价格不为0即不完全免费，默认为0
#    export JD_TRY_MINSUPPLYNUM=""       # 试用资格数量最小值，若商品提供的试用资格数量小于设定值则不会申请
#    export JD_TRY_APPLYNUMFILTER=""     # 过滤大于设定值的已申请人数的商品
#    export JD_TRY_APPLYINTERVAL=""      # 商品试用之间和获取商品之间的间隔, 单位毫秒，默认为3秒
#    export JD_TRY_MAXLENGTH=""          # 申请的商品队列长度
#    export JD_TRY_PASSZC=""             # 过滤种草官类试用，某些试用商品是专属官专属，默认为true
#    export JD_TRY_PLOG=""               # 是否打印输出到日志，默认为true，建议改为false因为日志太长了
#    export JD_TRY_WHITELIST=""          # 试用商品标题白名单是否打开，开启白名单后黑名单将不生效失效，默认为false
#    export JD_TRY_WHITELISTKEYWORDS=""  # 试用商品标题白名单关键词，多个关键词用@隔开
#    export JD_TRY_SENDNUM=""            # 每多少个账号推送一次通知，默认为4

##############################  近  期  删  除  ##############################

##############################  主  要  代  码  ##############################
## 免责声明：当作者的脚本不可拉取时，会临时启用别人 FORK 或搬运的库代替

NewLine="\n          "
UpdateDate="2022-06-05"
UpdateContent="add  jd_insight.js(京洞察问卷通知)"

## 作者
author_list="Public Dellear star261 yyds KingRan jiulan X1a0He"
author_name=(
  Public
  Dellear
  star261
  yyds
  KingRan
  jiulan
  X1a0He
)

## 定义下载代理 (非内置功能)
if [[ ${EnableExtraShellProxy} ]] && [[ ${EnableExtraShellProxy} == true ]]; then
  ProxyJudge="true"
else
  ProxyJudge="false"
fi

## Public
scripts_base_url_Public=https://supermanito.github.io/Helloworld/scripts/
my_scripts_list_Public="jd_shop_sign.js jd_super_redrain.js jd_half_redrain.js"

## Dellear
scripts_base_url_Dellear=https://raw.githubusercontent.com/Dellear/lost/main/extra/
my_scripts_list_Dellear="jd_price.js"

## star261
scripts_base_url_star261=https://raw.githubusercontent.com/star261/jd/main/scripts/
my_scripts_list_star261="jd_productZ4Brand.js jd_fan.js jd_twCard.js jd_618dfw.js jd_xm618.js"

## yyds
scripts_base_url_yyds=https://raw.githubusercontent.com/okyyds/yyds/master/
my_scripts_list_yyds="JDSignValidator.js jd_try_notify.py jd_morningSc.js jd_moneyTree_heip.js jd_dwapp.js jd_unsubscriLive.js jd_nnfls.js jd_gold_sign.js jd_beauty_ex.js jd_wq_wxsign.js jd_wyw.js jd_mpdzcar.js jd_mpdzcar_game.js jd_mpdzcar_help.js jd_ddly.js jd_speed_redpocke.js"

## KingRan
scripts_base_url_KingRan=https://raw.githubusercontent.com/KingRan/KR/main/
my_scripts_list_KingRan="jd_try.js sign_graphics_validate.js JDJRValidator_Pure.js jd_wish.js jd_beauty.js jd_xgyl_wx.js jd_joy_park_task.js jd_joymanor_task.js jd_superBrandStar.js jd_sign_graphics.js jd_tanwei.js jd_superBrandSign.js jd_insight.js"

## jiulan
scripts_base_url_jiulan=https://raw.githubusercontent.com/jiulan/platypus/main/scripts/
my_scripts_list_jiulan="jd_jfcz.js jd_txjf.js"

## X1a0He
scripts_base_url_X1a0He=https://raw.githubusercontent.com/X1a0He/jd_scripts_fixed/main/
my_scripts_list_X1a0He="jd_unsubscribe_xh.js jd_cleancart.js jd_jin_tie_xh.js"

## 青蛙
scripts_base_url_smiek2221=https://raw.githubusercontent.com/smiek2121/scripts/master/
my_scripts_list_smiek2221=""

## ccwav
scripts_base_url_ccwav=https://raw.githubusercontent.com/ccwav/QLScript2/main/ModScript/
my_scripts_list_ccwav=""

## 小埋
scripts_base_url_duck=https://raw.githubusercontent.com/okyyds/duck/master/
my_scripts_list_duck=""

## zero205
scripts_base_url_zero205=https://raw.githubusercontent.com/zero205/JD_tencent_scf/main/
my_scripts_list_zero205=""

## he1pu
scripts_base_url_he1pu=https://raw.githubusercontent.com/he1pu/JDHelp/main/
my_scripts_list_he1pu=""

## cdle
scripts_base_url_cdle=https://raw.githubusercontent.com/cdle/carry/main/
my_scripts_list_cdle=""

## curtinlv
scripts_base_url_curtinlv=https://raw.githubusercontent.com/curtinlv/JD-Script/main/
my_scripts_list_curtinlv=""

##############################  主 命 令  ##############################
cd $RootDir
if [ -d $RootDir/.git ]; then
  git remote -v | grep "git@jd_base_gitee:supermanito/jd_base.git" -wq
  [ $? -ne 0 ] && echo -e "\n${RED}非本项目用户禁止使用！${PLAIN}\n" && exit 1
fi

echo -e "更新日期：\033[33m${UpdateDate}\033[0m"
echo -e "更新内容：\033[33m${UpdateContent}\033[0m\n"

## 随机函数
rand() {
  min=$1
  max=$(($2 - $min + 1))
  num=$(cat /proc/sys/kernel/random/uuid | cksum | awk -F ' ' '{print $1}')
  echo $(($num % $max + $min))
}

index=0
for author in $author_list; do
  eval scripts_list=\$my_scripts_list_${author}
  eval url_list=\$scripts_base_url_${author}
  eval author="author_name[${index}]"

  ## 处理代理
  echo ${url_list} | grep -Eq "raw\.githubusercontent\.com"
  if [ $? -eq 0 ]; then
    if [[ ${ProxyJudge} == true ]]; then
      url_list=$(echo ${url_list} | perl -pe "{s|raw\.githubusercontent\.com|raw\.fastgit\.org|g}")
    fi
  fi

  ## 判断脚本来源仓库
  repository_judge=$(echo $url_list | grep -Eo "github|fastgit|gitee|jsdelivr")
  download_judge=""
  repository_platform=""
  reformat_url=""
  if [[ ${repository_judge} == "github" ]]; then
    repository_platform="https://github.com"
    repository_branch=$(echo $url_list | awk -F '.com' '{print$NF}' | sed 's/.$//' | awk -F '/' '{print$4}')
    reformat_url=$(echo $url_list | awk -F '.com' '{print$NF}' | perl -pe "{s|.$||g; s|$repository_branch|tree\/$repository_branch|g}")
    [[ ${ProxyJudge} == true ]] && download_judge="(代理)"
  elif [[ ${repository_judge} == "fastgit" ]]; then
    repository_platform="https://github.com"
    repository_branch=$(echo $url_list | perl -pe "{s|raw\.fastgit\.org|raw\.githubusercontent\.com|g}" | awk -F '.com' '{print$NF}' | sed 's/.$//' | awk -F '/' '{print$4}')
    reformat_url=$(echo $url_list | perl -pe "{s|raw\.fastgit\.org|raw\.githubusercontent\.com|g}" | awk -F '.com' '{print$NF}' | perl -pe "{s|.$||g; s|$repository_branch|tree\/$repository_branch|g}")
    [[ ${ProxyJudge} == true ]] && download_judge="(代理)"
  elif [[ ${repository_judge} == "gitee" ]]; then
    repository_platform="https://gitee.com"
    reformat_url=$(echo $url_list | awk -F '.com' '{print$NF}' | perl -pe "{s|.$||g; s|\/raw\/|\/tree\/|g}")
  elif [[ ${repository_judge} == "jsdelivr" ]]; then
    repository_platform="https://github.com"
    repository_branch=$(echo $format_url | awk -F '/' '{print$4}')
    reformat_url=$(echo $url_list | awk -F '/gh' '{print$NF}' | perl -pe "{s|.$||g; s|\@|\/tree\/|g}")
    download_judge="(代理)"
  else
    repository_platform="Unknown"
  fi
  repository_url="${repository_platform}${reformat_url}"

  echo -e "[${YELLOW}更新${PLAIN}] ${!author} ${download_judge}"
  [[ ${repository_url} ]] && echo -e "[${YELLOW}仓库${PLAIN}] $repository_url"

  for js in $scripts_list; do
    croname=""
    script_cron_standard=""

    eval url=$url_list$js
    eval name=$js
    eval formatname=$(echo $js | awk -F '/' '{print$NF}')

    [[ ${EnableExtraShellProxy} == true ]] && sleep 1s ## 降低使用代理下载脚本的请求频率
    wget -q --no-check-certificate $url -O "$ScriptsDir/$name.new" -T 20

    if [ $? -eq 0 ]; then
      mv -f $ScriptsDir/$name.new $ScriptsDir/$name
      echo -e "$COMPLETE $formatname"

      case $name in
      jddjCookie.js | sign_graphics_validate.js | JDSignValidator.js | JDJRValidator_Pure.js | TS_USER_AGENTS.ts | function/*)
        continue
        ;;
      esac

      croname=$(echo "$name" | awk -F\. '{print $1}' | perl -pe "{s|^jd_||; s|^jx_||; s|^jr_||;}")
      script_cron_standard=$(cat $ScriptsDir/$name | grep "https" | awk '{if($1~/^[0-9]{1,2}/) print $1,$2,$3,$4,$5}' | sort -u | head -n 1)
      case $name in
      jd_try.js)
        script_cron="30 10 * * *" # 指定京东试用的定时
        ;;
      jd_unsubscribe_xh.js)
        script_cron="20 10,23 * * *" # 指定取关脚本的定时
        ;;
      jd_jchsign.js)
        script_cron="$(rand 1 59) $(rand 1 23) * * *" # 京车会签到，随机定时
        ;;
      jd_beauty_ex.js)
        script_cron="$(rand 1 5) $(rand 6 8),$(rand 11 13),$(rand 18 20) * * * " # 美丽研究院兑换，随机定时
        ;;
      jd_txjf.js)
        script_cron="8 0,1 * * *" # 指定通讯积分的定时
        ;;
      *)
        if [[ -z ${script_cron_standard} ]]; then
          tmp1=$(grep -E "^cron|script-path=|tag=|[0-9] \* \*|^[0-9]\*.*$name" $ScriptsDir/$name | grep -Ev "^https\?:|^function " | head -1 | perl -pe '{s|[a-zA-Z\"\.\=\:\_]||g;}')
          ## 判断开头
          tmp2=$(echo "${tmp1}" | awk -F '[0-9]' '{print$1}' | sed 's/\*/\\*/g; s/\./\\./g')
          ## 判断表达式的第一个数字（分钟）
          tmp3=$(echo "${tmp1}" | grep -Eo "[0-9]" | head -1)
          ## 判定开头是否为空值
          if [[ $(echo "${tmp2}" | perl -pe '{s| ||g;}') = "" ]]; then
            script_cron=$(echo "${tmp1}" | awk '{if($1~/^[0-9]{1,2}/) print $1,$2,$3,$4,$5; else if ($1~/^[*]/) print $2,$3,$4,$5,$6}')
          else
            script_cron=$(echo "${tmp1}" | perl -pe "{s|${tmp2}${tmp3}|${tmp3}|g;}" | awk '{if($1~/^[0-9]{1,2}/) print $1,$2,$3,$4,$5; else if ($1~/^[*]/) print $2,$3,$4,$5,$6}')
          fi
        else
          script_cron=${script_cron_standard}
        fi
        ;;
      esac

      if [ -z "${script_cron}" ]; then
        cron_min=$(rand 1 59)
        cron_hour=$(rand 1 23)
        [ $(grep -c " $TaskCmd $croname" $ListCrontabUser) -eq 0 ] && sed -i "/hang up/a${cron_min} ${cron_hour} * * * $TaskCmd $croname" $ListCrontabUser
      else
        [ $(grep -c " $TaskCmd $croname" $ListCrontabUser) -eq 0 ] && sed -i "/hang up/a${script_cron} $TaskCmd $croname" $ListCrontabUser
      fi
    else
      [ -f $ScriptsDir/$name.new ] && rm -f $ScriptsDir/$name.new
      echo -e "$FAIL $formatname 更新失败"
    fi
  done
  let index+=1
  echo ''
done
##############################  自  定  义  命  令  ##############################

## 删除垃圾文件
DeleteCacheFiles=""
for del in ${DeleteCacheFiles}; do
  [ -f $ScriptsDir/$del ] && rm -rf $ScriptsDir/$del
done

## 删除脚本和定时
DeleteScripts=""
for del in ${DeleteScripts}; do
  [ -f $ScriptsDir/$del ] && rm -rf $ScriptsDir/$del && sed -i "/ $TaskCmd $(echo "$del" | awk -F\. '{print $1}' | perl -pe "{s|^jd_||; s|^jx_||; s|^jr_||;}")/d" $ListCrontabUser
done
