---------------------------------------------------------------------->
-- 脚本名称:	scripts/Map/HorseSkill/skill/乘骑中监控_魔法.lua
-- 更新时间:	2014/11/7 14:42:02
-- 更新用户:	zhangyan3
-- 脚本说明:	--该BUFF生效时候触发一次应用
-- 鱼头实测备注：一个BUFF的魔法脚本中的Apply 函数，在添加此BUFF时候触发一次
-- 鱼头实测备注：一个BUFF的魔法脚本中的UnApply 函数，在此BUFF消失时候触发一次各种条件均会触发（维持条件不符合消失，player.DelBuff(8475,1)消失，时间到了消失）
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	--print(33333)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
--	player.Talk("定")
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "set character freeze 0 1")
end

function UnApply(dwCharacterID)
	--print(44444)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
--	player.Talk("解")
	RemoteCallToClient(player.dwID, "CallUIGlobalFunction", "rlcmd", "set character freeze 0 0")
	RemoteCallToClient(player.dwID,"On_Freeze_End")	
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com