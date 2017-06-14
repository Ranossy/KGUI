------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2012-8-16
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	if not cPlayer then
		return
	end
	cPlayer.DelBuff(4255,1)
	cPlayer.DelBuff(4256,1)
	cPlayer.DelBuff(4257,1)
	cPlayer.DelBuff(4258,1)
	cPlayer.DelBuff(4259,1)
	cPlayer.DelBuff(4260,1)
	cPlayer.DelBuff(4255,2)
	cPlayer.DelBuff(4256,2)
	cPlayer.DelBuff(4257,2)
	cPlayer.DelBuff(4258,2)
	cPlayer.DelBuff(4259,2)
	cPlayer.DelBuff(4260,2)
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com